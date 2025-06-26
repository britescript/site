# Britescript Installer for Windows
# Usage: irm britescript.com/install.ps1 | iex

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

function Write-Logo {
    Write-Host "  ____       _ _                      _       _   " -ForegroundColor Blue
    Write-Host " | __ ) _ __(_) |_ ___  ___  ___ _ __(_)_ __ | |_ " -ForegroundColor Blue
    Write-Host " |  _ \| '__| | __/ _ \/ __|/ __| '__| | '_ \| __|" -ForegroundColor Blue
    Write-Host " | |_) | |  | | ||  __/\__ \ (__| |  | | |_) | |_ " -ForegroundColor Blue
    Write-Host " |____/|_|  |_|\__\___||___/\___|_|  |_| .__/ \__|" -ForegroundColor Blue
    Write-Host "                                       |_|        " -ForegroundColor Blue
    Write-Host ""
    Write-Host "A language that compiles to TypeScript with traits, structs, and pipes" -ForegroundColor Cyan
    Write-Host ""
}

function Get-LatestVersion {
    try {
        $releaseInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/britescript/britescript/releases/latest"
        $version = $releaseInfo.tag_name -replace 'v', ''
        return $version
    }
    catch {
        Write-Host "Failed to determine the latest version: $_" -ForegroundColor Red
        exit 1
    }
}

function Test-CommandExists {
    param (
        [string]$Command
    )
    
    return [bool](Get-Command -Name $Command -ErrorAction SilentlyContinue)
}

function Install-Bun {
    Write-Host "Installing Bun..." -ForegroundColor Blue
    
    try {
        # Save current progress preference and disable progress bar for nested Invoke-WebRequest
        $oldProgressPreference = $ProgressPreference
        $ProgressPreference = 'SilentlyContinue'
        
        # Install Bun using the official installer
        iex "& { $(irm bun.sh/install.ps1) }"
        
        # Restore progress preference
        $ProgressPreference = $oldProgressPreference
        
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
        
        if (Test-CommandExists "bun") {
            Write-Host "Bun installed successfully!" -ForegroundColor Green
        }
        else {
            Write-Host "Bun was installed, but you may need to restart your terminal to use it." -ForegroundColor Yellow
            Write-Host "Please open a new PowerShell window after installation completes." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "Failed to install Bun: $_" -ForegroundColor Red
        Write-Host "Please install Bun manually from https://bun.sh" -ForegroundColor Yellow
        Write-Host "After installing Bun, you can run Britescript with 'brite'" -ForegroundColor Yellow
        
        $manualInstall = Read-Host "Would you like to open the Bun installation page in your browser? (y/n)"
        if ($manualInstall -eq "y") {
            Start-Process "https://bun.sh"
        }
        
        exit 1
    }
}

function Install-Britescript {
    param (
        [string]$Version,
        [string]$InstallDir
    )
    
    Write-Host "Installing Britescript v$Version..." -ForegroundColor Blue
    
    # Create temporary directory
    $tempDir = Join-Path $env:TEMP "britescript-installer"
    if (Test-Path $tempDir) {
        Remove-Item -Path $tempDir -Recurse -Force
    }
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    
    # Download the zip file
    $zipUrl = "https://github.com/britescript/britescript/releases/download/v${Version}/britescript-${Version}-windows.zip"
    $zipPath = Join-Path $tempDir "britescript.zip"
    
    Write-Host "Downloading from $zipUrl..." -ForegroundColor Yellow
    try {
        # Show progress bar
        $ProgressPreference = 'Continue'
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
        $ProgressPreference = 'SilentlyContinue'
    }
    catch {
        Write-Host "Failed to download Britescript: $_" -ForegroundColor Red
        Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow
        Write-Host "If the problem persists, please report it at https://github.com/britescript/britescript/issues" -ForegroundColor Yellow
        exit 1
    }
    
    # Verify the download
    if (-not (Test-Path $zipPath) -or (Get-Item $zipPath).Length -eq 0) {
        Write-Host "Downloaded file is empty or does not exist." -ForegroundColor Red
        Write-Host "This could be due to a network issue or the release may not be available yet." -ForegroundColor Yellow
        exit 1
    }
    
    # Extract the zip file
    Write-Host "Extracting..." -ForegroundColor Yellow
    try {
        Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
    }
    catch {
        Write-Host "Failed to extract the zip file: $_" -ForegroundColor Red
        Write-Host "The downloaded file may be corrupted. Please try again." -ForegroundColor Yellow
        exit 1
    }
    
    # Create installation directory
    if (-not (Test-Path $InstallDir)) {
        try {
            New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
        }
        catch {
            Write-Host "Failed to create installation directory: $_" -ForegroundColor Red
            Write-Host "Please check your permissions and try again." -ForegroundColor Yellow
            exit 1
        }
    }
    
    # Find the brite executable and copy files
    $briteExe = Get-ChildItem -Path $tempDir -Recurse -Filter "brite" | Select-Object -First 1
    if ($null -eq $briteExe) {
        Write-Host "Could not find the 'brite' executable in the downloaded package." -ForegroundColor Red
        Write-Host "The package structure may have changed. Please report this issue." -ForegroundColor Yellow
        exit 1
    }
    
    # Copy all files from the extracted directory to the install directory
    try {
        $extractedDir = Split-Path $briteExe.FullName -Parent
        Copy-Item -Path "$extractedDir\*" -Destination $InstallDir -Recurse -Force
    }
    catch {
        Write-Host "Failed to copy files to installation directory: $_" -ForegroundColor Red
        Write-Host "Please check your permissions and try again." -ForegroundColor Yellow
        exit 1
    }
    
    # Create a .cmd wrapper for brite
    $cmdWrapper = @"
@echo off
bun "%~dp0\brite" %*
"@
    try {
        Set-Content -Path (Join-Path $InstallDir "brite.cmd") -Value $cmdWrapper -Encoding ASCII
    }
    catch {
        Write-Host "Failed to create brite.cmd wrapper: $_" -ForegroundColor Red
        Write-Host "This may affect the ability to run Britescript from the command line." -ForegroundColor Yellow
    }
    
    # Create a PowerShell wrapper for brite
    $psWrapper = @"
#!/usr/bin/env pwsh
bun "$InstallDir\brite" @args
"@
    try {
        Set-Content -Path (Join-Path $InstallDir "brite.ps1") -Value $psWrapper -Encoding UTF8
    }
    catch {
        Write-Host "Failed to create brite.ps1 wrapper: $_" -ForegroundColor Red
    }
    
    Write-Host "Britescript has been installed successfully!" -ForegroundColor Green
    
    # Clean up
    try {
        Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
    catch {
        # Ignore cleanup errors
    }
}

function Add-ToPath {
    param (
        [string]$InstallDir
    )
    
    # Check if the directory is already in PATH
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($currentPath -notlike "*$InstallDir*") {
        Write-Host "Adding Britescript to your PATH..." -ForegroundColor Yellow
        
        try {
            $newPath = "$currentPath;$InstallDir"
            [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
            
            Write-Host "Added to PATH successfully!" -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to add to PATH: $_" -ForegroundColor Red
            Write-Host "Please add $InstallDir to your PATH manually." -ForegroundColor Yellow
            
            # Show instructions for manually adding to PATH
            Write-Host "`nTo manually add Britescript to your PATH:" -ForegroundColor Yellow
            Write-Host "1. Right-click on the Start button and select 'System'" -ForegroundColor Cyan
            Write-Host "2. Click on 'Advanced system settings'" -ForegroundColor Cyan
            Write-Host "3. Click on 'Environment Variables...'" -ForegroundColor Cyan
            Write-Host "4. Under 'User variables', select 'Path' and click 'Edit...'" -ForegroundColor Cyan
            Write-Host "5. Click 'New' and add the following path:" -ForegroundColor Cyan
            Write-Host "   $InstallDir" -ForegroundColor White
            Write-Host "6. Click 'OK' on all dialogs to save the changes" -ForegroundColor Cyan
        }
    }
    else {
        Write-Host "$InstallDir is already in your PATH." -ForegroundColor Green
    }
    
    # Try to create a shortcut in a common location
    try {
        $startMenuPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Programs"), "Britescript")
        
        if (-not (Test-Path $startMenuPath)) {
            New-Item -ItemType Directory -Path $startMenuPath -Force | Out-Null
        }
        
        $shortcutPath = Join-Path $startMenuPath "Britescript.lnk"
        $cmdPath = Join-Path $InstallDir "brite.cmd"
        
        $WshShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WshShell.CreateShortcut($shortcutPath)
        $Shortcut.TargetPath = $cmdPath
        $Shortcut.Description = "Britescript Command Line Tool"
        $Shortcut.WorkingDirectory = "%USERPROFILE%"
        $Shortcut.Save()
        
        Write-Host "Created Start Menu shortcut: $shortcutPath" -ForegroundColor Green
    }
    catch {
        # Ignore shortcut creation errors
    }
}

# Main script
Write-Logo

Write-Host "Welcome to the Britescript installer!" -ForegroundColor Cyan
Write-Host "This script will install Britescript on your system." -ForegroundColor Cyan
Write-Host ""

# Check for Bun
if (-not (Test-CommandExists "bun")) {
    Write-Host "Britescript requires Bun to run." -ForegroundColor Yellow
    $installBun = Read-Host "Would you like to install Bun now? (y/n)"
    
    if ($installBun -eq "y") {
        Install-Bun
    }
    else {
        Write-Host "Please install Bun manually from https://bun.sh before using Britescript." -ForegroundColor Yellow
        Write-Host "After installing Bun, run this installer again." -ForegroundColor Yellow
        exit 1
    }
}
else {
    Write-Host "Bun is already installed. Great!" -ForegroundColor Green
}

# Get the latest version
Write-Host "Checking for the latest version..." -ForegroundColor Blue
$version = Get-LatestVersion
if (-not $version) {
    Write-Host "Failed to determine the latest version." -ForegroundColor Red
    Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow
    Write-Host "If the problem persists, you can download Britescript manually from:" -ForegroundColor Yellow
    Write-Host "https://github.com/britescript/britescript/releases" -ForegroundColor Cyan
    exit 1
}
Write-Host "Latest version: $version" -ForegroundColor Blue

# Determine installation directory
$installDir = "$env:LOCALAPPDATA\Britescript"
Write-Host "Installing to: $installDir" -ForegroundColor Blue

# Install Britescript
Install-Britescript -Version $version -InstallDir $installDir

# Add to PATH
Add-ToPath -InstallDir $installDir

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "You can now run Britescript using the 'brite' command." -ForegroundColor Cyan
Write-Host "Try it out:" -ForegroundColor Cyan
Write-Host "  brite --version" -ForegroundColor Yellow
Write-Host "  brite --help" -ForegroundColor Yellow
Write-Host ""
Write-Host "To create a new Britescript project:" -ForegroundColor Cyan
Write-Host "  brite init my-project" -ForegroundColor Yellow
Write-Host "  cd my-project" -ForegroundColor Yellow
Write-Host "  brite run" -ForegroundColor Yellow
Write-Host ""
Write-Host "For documentation and examples, visit:" -ForegroundColor Cyan
Write-Host "  https://britescript.com" -ForegroundColor Yellow
Write-Host ""
Write-Host "Enjoy using Britescript!" -ForegroundColor Cyan