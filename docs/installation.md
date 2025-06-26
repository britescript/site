# Installation

There are several ways to install and use Britescript, depending on your project needs.

## Quick Installation

The fastest way to get started with Britescript is using our installation scripts:

::: code-group
```bash [macOS/Linux]
curl -fsSL https://britescript.com/install | bash
```

```powershell [Windows]
irm britescript.com/install.ps1 | iex
```

```bash [Homebrew]
brew install britescript
```
:::

These scripts will:
- Check if [Bun](https://bun.sh) is installed (and offer to install it if not)
- Download and install the latest version of Britescript
- Add Britescript to your PATH

## Package Manager Installation

You can also install Britescript using package managers:

::: code-group
```bash [npm]
npm install -g britescript
```

```bash [yarn]
yarn global add britescript
```

```bash [pnpm]
pnpm add -g britescript
```

```bash [bun]
bun install -g britescript
```
:::

## Project Installation

For project-specific installation:

::: code-group
```bash [npm]
npm install --save-dev @britescript/cli @britescript/core
```

```bash [yarn]
yarn add --dev @britescript/cli @britescript/core
```

```bash [pnpm]
pnpm add --save-dev @britescript/cli @britescript/core
```

```bash [bun]
bun add --dev @britescript/cli @britescript/core
```
:::

## Vite Plugin

For Vite projects, install the Britescript plugin:

::: code-group
```bash [npm]
npm install --save-dev @britescript/vite
```

```bash [yarn]
yarn add --dev @britescript/vite
```

```bash [pnpm]
pnpm add --save-dev @britescript/vite
```

```bash [bun]
bun add --dev @britescript/vite
```
:::

Then configure your `vite.config.ts`:

```typescript
import { defineConfig } from 'vite'
import { britescript } from '@britescript/vite'

export default defineConfig({
  plugins: [
    britescript({
      jsx: true, // Enable JSX support for .bsx files
    }),
    // ... other plugins
  ],
  resolve: {
    extensions: ['.js', '.ts', '.jsx', '.tsx', '.bsx', '.bs']
  }
})
```

## VS Code Extension

For the best development experience, install the Britescript VS Code extension:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Britescript"
4. Click "Install"

Or install from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=britescript.vscode-britescript).

## Native Packages

Britescript is also available as native packages for various platforms:

### macOS
- **Homebrew**: `brew install britescript`
- **Installer Package**: Download the `.pkg` installer from the [releases page](https://github.com/britescript/britescript/releases)

### Linux
- **Debian/Ubuntu**: Download the `.deb` package from the [releases page](https://github.com/britescript/britescript/releases)
- **RHEL/Fedora**: Download the `.rpm` package from the [releases page](https://github.com/britescript/britescript/releases)

### Windows
- **Installer**: Download the `.exe` installer from the [releases page](https://github.com/britescript/britescript/releases)

## System Requirements

- **Bun**: v1.0.0 or later (required)
- **VS Code**: v1.60.0 or later (for the extension)

## Verifying Installation

Verify the CLI installation:

```bash
brite --version
```

Test a simple Britescript file:

```bash
echo 'let message = "Hello, Britescript!"; message |> console.log' > test.bs
brite run test.bs
```

You should see the output:

```
Hello, Britescript!
```

## Docker Installation

You can also use Britescript with Docker:

```bash
docker pull britescript/britescript:latest
docker run -it --rm -v $(pwd):/app britescript/britescript --version
```

For easier use, create a shell alias:

```bash
# Add to your .bashrc or .zshrc
alias brite='docker run -it --rm -v $(pwd):/app britescript/britescript'
```

Or use Docker Compose for development:

```yaml
# docker-compose.yml
version: '3'
services:
  britescript:
    image: britescript/britescript:latest
    volumes:
      - .:/app
    working_dir: /app
```

Then run:

```bash
docker-compose run --rm britescript [command]
```

## Next Steps

Now that you have Britescript installed, you can:

1. [Create your first project](/docs/getting-started)
2. [Learn about Britescript concepts](/docs/concepts/structs)
3. [Set up your development environment](/vscode-extension/)