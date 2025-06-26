# CLI Commands

The Britescript CLI provides several commands for working with Britescript files and projects. This page documents all available commands and their options.

## Command Overview

| Command | Description |
|---------|-------------|
| `init` | Create a new Britescript project |
| `build` | Build an entire Britescript project |
| `compile` | Compile individual Britescript files |
| `run` | Execute Britescript files directly |
| `repl` | Start an interactive REPL |
| `help` | Show help information |
| `version` | Show CLI version |

## `brite init`

Create a new Britescript project with example files and configuration.

```bash
brite init [project-name] [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--template <name>` | Template to use (default: "basic") |
| `--no-install` | Skip package installation |
| `--package-manager <name>` | Package manager to use (npm, yarn, pnpm, bun) |

### Templates

- `basic` - Basic project with minimal setup
- `react` - React project with Britescript
- `node` - Node.js project with Britescript
- `bun` - Bun project with Britescript
- `vite` - Vite project with Britescript plugin

### Examples

```bash
# Create a basic project
brite init my-project

# Create a React project
brite init my-react-app --template react

# Create a project with Bun
brite init my-app --package-manager bun
```

## `brite build`

Build an entire Britescript project according to configuration.

```bash
brite build [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--watch`, `-w` | Watch for file changes |
| `--config <path>` | Path to config file |
| `--out-dir <path>` | Output directory |
| `--src-dir <path>` | Source directory |
| `--minify` | Minify output |
| `--target <target>` | Compilation target (node, bun, browser) |
| `--verbose` | Verbose output |

### Examples

```bash
# Build project
brite build

# Build and watch for changes
brite build --watch

# Build with custom config
brite build --config custom.toml

# Build with specific directories
brite build --src-dir src --out-dir dist
```

## `brite compile`

Compile individual Britescript (.bs) files to TypeScript.

```bash
brite compile <file> [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--out`, `-o <file>` | Output file |
| `--watch`, `-w` | Watch for file changes |
| `--target <target>` | Compilation target (node, bun, browser) |
| `--sourcemap` | Generate source maps |
| `--minify` | Minify output |
| `--verbose` | Verbose output |

### Examples

```bash
# Compile a file
brite compile src/main.bs

# Compile with custom output
brite compile src/main.bs -o dist/main.ts

# Compile and watch
brite compile src/main.bs --watch

# Compile with source maps
brite compile src/main.bs --sourcemap
```

## `brite run`

Execute Britescript files directly without manual compilation.

```bash
brite run <file> [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--watch`, `-w` | Watch for file changes and re-run |
| `--silent`, `-s` | Silent mode (no output except from the program) |
| `--debug`, `-d` | Debug mode (extra logging) |
| `--env <env>` | Environment variables (key=value) |

### Examples

```bash
# Run a file
brite run src/main.bs

# Run and watch for changes
brite run src/main.bs --watch

# Run in silent mode
brite run src/main.bs --silent

# Run with environment variables
brite run src/main.bs --env NODE_ENV=production
```

## `brite repl`

Start an interactive Britescript REPL (Read-Eval-Print Loop).

```bash
brite repl [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--typescript`, `-ts` | Show TypeScript output |
| `--no-color` | Disable colors |
| `--history <file>` | History file path |

### REPL Commands

- `.help` - Show help
- `.exit` - Exit REPL
- `.clear` - Clear screen
- `.ts` - Toggle TypeScript output
- `.version` - Show version

### Examples

```bash
# Start REPL
brite repl

# Start REPL with TypeScript output
brite repl --typescript

# Start REPL with custom history file
brite repl --history ~/.brite_history
```

## `brite help`

Show help information for the CLI or a specific command.

```bash
brite help [command]
```

### Examples

```bash
# Show general help
brite help

# Show help for a specific command
brite help compile
```

## `brite --version`

Show the installed CLI version.

```bash
brite --version
```

## Global Options

These options can be used with any command:

| Option | Description |
|--------|-------------|
| `--help`, `-h` | Show help |
| `--version`, `-v` | Show version |
| `--no-color` | Disable colors |
| `--quiet` | Quiet mode |