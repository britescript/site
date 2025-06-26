# Getting Started

This guide will help you get started with Britescript. We'll cover installation, creating your first project, and running your first Britescript file.

## Prerequisites

Before you begin, make sure you have one of the following installed:

- [Node.js](https://nodejs.org/) (v16 or later)
- [Bun](https://bun.sh/) (recommended for best performance)

## Installation

Install the Britescript CLI globally:

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

## Creating a New Project

Create a new Britescript project:

```bash
brite init my-first-project
cd my-first-project
```

This will create a new directory with the following structure:

```
my-first-project/
├── node_modules/
├── src/
│   └── main.bs
├── package.json
└── bunfig.toml
```

## Your First Britescript File

The `src/main.bs` file contains a simple "Hello World" example:

```typescript
// src/main.bs
struct Greeting {
  message: string;
}

let greeting: Greeting = {
  message: "Hello, Britescript!"
}

greeting.message |> console.log
```

## Running Your Code

Run your Britescript file:

```bash
brite run src/main.bs
```

You should see the output:

```
Hello, Britescript!
```

## Compiling to TypeScript

Compile your Britescript file to TypeScript:

```bash
brite compile src/main.bs
```

This will create a `src/main.ts` file with the compiled TypeScript code:

```typescript
// src/main.ts
type Greeting = {
  message: string;
};

const greeting: Greeting = {
  message: "Hello, Britescript!"
};

console.log(greeting.message);
```

## Building Your Project

Build your entire project:

```bash
brite build
```

This will compile all Britescript files in your project and output them to the `build` directory.

## Next Steps

Now that you have a basic Britescript project up and running, you can:

1. Learn about [Structs](/docs/concepts/structs) and [Traits](/docs/concepts/traits)
2. Explore [Pattern Matching](/docs/concepts/pattern-matching) and [Pipe Expressions](/docs/concepts/pipe-expressions)
3. Set up the [VS Code Extension](/vscode-extension/) for a better development experience
4. Integrate Britescript with [Vite](/vite-config/) for web projects