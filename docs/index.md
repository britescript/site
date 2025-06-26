# Britescript

Britescript - *means "bright script"* - is a modern language that compiles to TypeScript. It supports both Britescript-specific syntax and regular TypeScript/JavaScript code in the same file.

```typescript
import { Britescript } from '@britescript/core'
const code = `
struct User {
  id: number;
  name: string;
}
`
const compiled = Britescript.compile(code)
console.log(compiled)
```

## Quick Start

Just run this:

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

## Features

- **Ultrafast** 🚀 - The compiler is optimized for speed. Compiles thousands of lines in milliseconds.
- **Lightweight** 🪶 - The runtime is tiny. No dependencies, just pure TypeScript.
- **Multi-platform** 🌍 - Works with any TypeScript project. Integrates with Vite, React, Node.js, Bun, and more.
- **Batteries Included** 🔋 - CLI tools, VS Code extension, Vite plugin, and more. Everything you need to be productive.
- **Delightful DX** 😃 - Super clean APIs. First-class TypeScript support. Now, we've got "Types".

## Use-cases

Britescript is a language that compiles to TypeScript, making it perfect for:

- Building web applications with React, Vue, or any other framework
- Creating Node.js applications and libraries
- Developing Bun applications
- Writing clean, maintainable code with powerful abstractions
- Enhancing existing TypeScript projects with new language features

## Who is using Britescript?

| Project | Platform | What for? |
| --- | --- | --- |
| [Example Project 1](https://example.com) | React | Web application with Britescript components |
| [Example Project 2](https://example.com) | Node.js | Backend API with Britescript models |
| [Example Project 3](https://example.com) | Bun | CLI tools built with Britescript |

## Britescript in 1 minute

A demonstration to create an application with Britescript.

```typescript
// Define your data structures
struct User {
  id: number;
  name: string;
  email: string;
}

// Define your interfaces
trait Displayable {
  display(): string;
}

// Implement interfaces for your data structures
impl Displayable for User {
  display() {
    return `User: ${this.name} (${this.email})`;
  }
}

// Create instances
let user: User = {
  id: 1,
  name: "Alice",
  email: "alice@example.com"
};

// Use pipe operators for clean function chains
user.name
  |> trim
  |> toUpperCase
  |> console.log

// Pattern matching for control flow
let status = :success;
let message = match status {
  :success => "Operation completed successfully"
  :error => "An error occurred"
  :pending => "Operation in progress"
  _ => "Unknown status"
}
```