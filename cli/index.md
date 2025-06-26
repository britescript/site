# Britescript CLI

The Britescript CLI is a powerful command-line tool for working with Britescript files. It provides commands for creating projects, compiling code, running files, and more.

## Overview

```bash
# Get help
brite --help

# Create new project
brite init my-project

# Build entire project
brite build

# Compile individual .bs files
brite compile file.bs

# Run .bs files directly
brite run file.bs

# Interactive REPL
brite repl

# Show version
brite --version
```

## Features

- 🚀 **Zero Setup** - No configuration required
- 📦 **Project Templates** - Quick project initialization
- 🔄 **File Watching** - Auto-compilation and execution
- 🛠 **Interactive REPL** - Test code snippets quickly
- 🎯 **TypeScript Output** - Clean, readable compiled code
- 📱 **Cross Platform** - Works on macOS, Linux, and Windows
- ⚛️ **Atoms** - Elixir-style immutable constants (`:ok`, `:error`)
- 🎭 **Pattern Matching** - Rust/Elixir-style match expressions

## Installation

Install the CLI globally:

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

## Quick Start

Create a new project:

```bash
# Create a new project
brite init my-app
cd my-app

# Run your first Britescript file
brite run src/main.bs
```

## Core Commands

### `brite init`

Create a new Britescript project with example files and configuration:

```bash
brite init my-project
cd my-project
```

### `brite build`

Build entire Britescript projects with configuration support:

```bash
# Build project
brite build

# Build and watch for changes
brite build --watch

# Use custom config file
brite build --config custom.toml
```

### `brite compile`

Compile individual Britescript (.bs) files to TypeScript:

```bash
# Compile to TypeScript
brite compile file.bs

# Custom output file
brite compile file.bs -o output.ts

# Watch for changes
brite compile file.bs --watch
```

### `brite run`

Execute Britescript files directly without manual compilation:

```bash
# Run once
brite run file.bs

# Watch and re-run on changes
brite run file.bs --watch

# Silent mode
brite run file.bs --silent

# Debug mode
brite run file.bs --debug
```

### `brite repl`

Start an interactive Britescript REPL (Read-Eval-Print Loop):

```bash
# Start REPL
brite repl

# Show TypeScript compilation
brite repl --typescript
```

## Next Steps

- [Installation Guide](/cli/installation)
- [Command Reference](/cli/commands)
- [Project Setup](/cli/project-setup)
- [Configuration Options](/cli/configuration)