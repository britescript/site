# Britescript Vite Plugin

A Vite plugin for transforming Britescript (`.bs`) and Britescript JSX (`.bsx`) files.

## Features

- ✅ **Transform .bs files** - Compile Britescript to TypeScript
- ✅ **Transform .bsx files** - Compile Britescript + JSX to TypeScript + JSX
- ✅ **Source maps** - Full source map support for debugging
- ✅ **Hot Module Replacement** - Fast development with HMR
- ✅ **TypeScript integration** - Full TypeScript support
- ✅ **Configurable** - Extensive plugin options
- ✅ **Fast** - Optimized for Vite's dev server and build process

## Installation

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

## Basic Usage

Add the plugin to your `vite.config.ts`:

```typescript
import { defineConfig } from 'vite';
import { britescript } from '@britescript/vite';

export default defineConfig({
  plugins: [
    britescript(), // Add before other plugins like React
    // ... other plugins
  ]
});
```

## Configuration

The plugin accepts various options to customize its behavior:

```typescript
import { defineConfig } from 'vite';
import { britescript } from '@britescript/vite';

export default defineConfig({
  plugins: [
    britescript({
      // File patterns to include (default: [/\.bs$/, /\.bsx$/])
      include: [/\.bs$/, /\.bsx$/],
      
      // File patterns to exclude (default: [/node_modules/])
      exclude: [/node_modules/],
      
      // Enable source maps (default: true)
      sourceMaps: true,
      
      // Target ECMAScript version (default: 'es2020')
      target: 'es2020',
      
      // Enable JSX transformation for .bsx files (default: true)
      jsx: true,
      
      // JSX factory function (default: 'React.createElement')
      jsxFactory: 'React.createElement',
      
      // JSX fragment factory (default: 'React.Fragment')
      jsxFragment: 'React.Fragment',
      
      // Enable verbose logging (default: false)
      verbose: true,
      
      // Custom compiler options
      compilerOptions: {
        // Add any custom Britescript compiler options
      }
    })
  ]
});
```

## Usage with React

For React projects, use the plugin alongside `@vitejs/plugin-react`. There are two recommended approaches:

### Option 1: Pure .bs files + .tsx files

Use .bs files for pure Britescript logic and .tsx files for React components:

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { britescript } from '@britescript/vite';

export default defineConfig({
  plugins: [
    // Britescript plugin for .bs files only
    britescript({
      include: [/\.bs$/],
      jsx: false, // React plugin handles JSX
      verbose: true
    }),
    
    // React plugin for JSX transformation in .tsx files
    react({
      include: ['**/*.tsx', '**/*.ts', '**/*.jsx', '**/*.js']
    })
  ],
  
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.jsx', '.bs']
  }
});
```

### Option 2: Mixed .tsx files (Recommended)

Use .tsx files that can contain both Britescript syntax and JSX:

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { britescript } from '@britescript/vite';

export default defineConfig({
  plugins: [
    // Britescript plugin for .bs and .tsx files with Britescript syntax
    britescript({
      include: [/\.bs$/, /\.tsx$/],
      jsx: false, // Let React plugin handle JSX
      verbose: true
    }),
    
    // React plugin for JSX transformation
    react({
      include: ['**/*.tsx', '**/*.ts', '**/*.jsx', '**/*.js']
    })
  ],
  
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.jsx', '.bs']
  },
  
  optimizeDeps: {
    include: ['react', 'react-dom']
  }
});
```

## Transformations

The plugin transforms Britescript syntax to TypeScript:

| Britescript | TypeScript |
|-------------|------------|
| `struct User { name: string; }` | `type User = { name: string; };` |
| `trait Display { show(): string; }` | `interface Display { show(): string; }` |
| `impl Display for User { ... }` | `class UserDisplayImpl implements Display { ... }` |
| `let x = 5` | `const x = 5` |
| `data \|> func` | `func(data)` |

## Next Steps

- [Installation Guide](/vite-config/installation)
- [Configuration Options](/vite-config/configuration)
- [React Integration](/vite-config/react-integration)
- [Examples](/vite-config/examples)