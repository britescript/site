# CLI Installation

This guide covers how to install and set up the Britescript CLI on different platforms.

## Quick Install

The fastest way to install Britescript CLI is with our install scripts:

::: code-group
```bash [macOS/Linux]
curl -fsSL https://britescript.com/install | bash
```

```powershell [Windows]
irm britescript.com/install.ps1 | iex
```
:::

## Prerequisites

Before installing the Britescript CLI, make sure you have one of the following installed:

- [Node.js](https://nodejs.org/) (v16 or later)
- [Bun](https://bun.sh/) (recommended for best performance)

## Global Installation

Install the CLI globally to use it from anywhere on your system:

::: code-group
```bash [npm]
npm install -g @britescript/cli
```

```bash [yarn]
yarn global add @britescript/cli
```

```bash [pnpm]
pnpm add -g @britescript/cli
```

```bash [bun]
bun install -g @britescript/cli
```
:::

Verify the installation:

```bash
brite --version
```

You should see the version number of the installed CLI.

## Project-specific Installation

For project-specific installation:

::: code-group
```bash [npm]
npm install --save-dev @britescript/cli
```

```bash [yarn]
yarn add --dev @britescript/cli
```

```bash [pnpm]
pnpm add --save-dev @britescript/cli
```

```bash [bun]
bun add --dev @britescript/cli
```
:::

When installed locally, you can run the CLI using npx:

```bash
npx brite --version
```

Or add scripts to your package.json:

```json
{
  "scripts": {
    "build": "brite build",
    "dev": "brite build --watch",
    "compile": "brite compile src/main.bs",
    "start": "brite run src/main.bs"
  }
}
```

## Platform-specific Instructions

### macOS

On macOS, you can install the CLI using Homebrew:

```bash
brew install britescript-cli
```

### Windows

On Windows, you can use npm or bun as shown above. Additionally, you can install via Chocolatey:

```bash
choco install britescript-cli
```

### Linux

On Linux, you can use npm or bun as shown above. For Debian-based distributions, you can also use apt:

```bash
curl -fsSL https://britescript.com/gpg | sudo apt-key add -
sudo add-apt-repository "deb https://britescript.com/debian stable main"
sudo apt update
sudo apt install britescript-cli
```

## Docker Installation

You can also use Britescript with Docker:

```bash
docker pull britescript/cli
docker run -it --rm -v $(pwd):/app britescript/cli brite --version
```

## Troubleshooting

### Command Not Found

If you see `command not found: brite` after installation:

1. Make sure the installation directory is in your PATH
2. Try closing and reopening your terminal
3. For npm global installs, check your npm prefix: `npm config get prefix`

### Permission Errors

If you encounter permission errors during installation:

```bash
# On Unix-like systems
sudo npm install -g @britescript/cli

# Or fix npm permissions
https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
```

### Updating the CLI

To update to the latest version:

```bash
npm update -g @britescript/cli
```

## Next Steps

Now that you have the CLI installed, you can:

1. [Create your first project](/cli/project-setup)
2. [Learn about CLI commands](/cli/commands)
3. [Configure your projects](/cli/configuration)