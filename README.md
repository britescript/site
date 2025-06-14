# Britescript Site

The official Britescript documentation and playground site built with React, TypeScript, Vite, and Mantine.

## Development

```bash
# Install dependencies
bun install

# Start development server
bun dev

# Build for production
bun build
```

## Features

- **Britescript Integration**: Uses the `@britescript/vite` plugin to support `.bsx` files
- **Interactive Playground**: Test Britescript code in the browser
- **Documentation**: Comprehensive guides and examples
- **Modern Stack**: React 19, TypeScript, Vite, Mantine UI

## Architecture

- **Vite Configuration**: Custom setup with Britescript plugin support
- **File Extensions**: `.bsx` files are transformed by the Britescript plugin before React processing
- **Type Safety**: Full TypeScript support with proper `.bsx` file recognition
