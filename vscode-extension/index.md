# Britescript for VS Code

Beautiful language support for Britescript - the language with traits, structs, pipes, and JSX support that compiles to TypeScript.

## Features

### 🎨 **Syntax Highlighting**
- Complete syntax highlighting for Britescript keywords (`struct`, `trait`, `impl`, `let`)
- Special highlighting for pipe operators (`|>`) and pipe chains
- Full JSX/TSX syntax support for `.bsx` files
- Support for mixed Britescript + TypeScript/JavaScript code
- Custom color themes optimized for Britescript

### 📝 **Intelligent Code Completion**
- Auto-completion for Britescript keywords and constructs
- Pipe operator suggestions
- Common pipe function completions (`console.log`, `trim`, etc.)

### 🔧 **Built-in Commands**
- **Compile File** (`Ctrl+Shift+C`): Compile `.bs` and `.bsx` files to TypeScript
- **Run File** (`Ctrl+Shift+R`): Execute Britescript files directly
- **Build Project** (`Ctrl+Shift+B`): Build entire Britescript projects
- **New File**: Create new `.bs` or `.bsx` files with helpful templates

### 📦 **Code Snippets**
Accelerate development with pre-built snippets:
- `struct` - Create struct definitions
- `trait` - Create trait definitions  
- `impl` - Create implementation blocks
- `pipe` - Multi-line pipe chains
- `let` - Let bindings with pipes
- `rfc` - React functional components with Britescript structs
- `bsxcomp` - Complete Britescript JSX components
- `hook` - Custom React hooks with Britescript
- And many more...

### 🎯 **Project Integration**
- Auto-detection of Britescript projects
- Integration with `brite` CLI commands
- Workspace-aware build and run operations
- Support for `bunfig.toml` configuration
- Beautiful lightbulb icons for .bs and .bsx files

### ⚙️ **Customizable Settings**
- Auto-compile on save
- Show compiled TypeScript output
- Custom CLI executable path
- Format on save support

## Installation

1. Install the extension from the VS Code Marketplace
2. Install the Britescript CLI: `bun install -g @britescript/cli`
3. Start writing beautiful Britescript code with the iconic lightbulb! 💡🚀

## Quick Start

1. **Create a new Britescript file:**
   - Use `Ctrl+Shift+P` → "Britescript: New File"
   - Choose between `.bs` (regular) or `.bsx` (JSX) files
   - Or create a file with `.bs` or `.bsx` extension

2. **Write some Britescript code:**
   ```britescript
   struct User {
     name: string;
     email: string;
   }

   trait Greeter {
     greet(user: User): string;
   }

   impl Greeter for User {
     greet(user: User) {
       let message = "Hello, " + user.name + "!"
       message |> console.log
     }
   }
   ```

3. **Compile and run:**
   - Right-click → "Compile to TypeScript" 
   - Or press `Ctrl+Shift+C`

## Commands

| Command | Keybinding | Description |
|---------|------------|-------------|
| Britescript: Compile | `Ctrl+Shift+C` | Compile current .bs/.bsx file to TypeScript |
| Britescript: Run | `Ctrl+Shift+R` | Execute current .bs/.bsx file |
| Britescript: Build | `Ctrl+Shift+B` | Build entire project |
| Britescript: New File | - | Create new .bs or .bsx file with template |

## Themes

The extension includes two custom themes optimized for Britescript:
- **Britescript Dark** - Dark theme with vibrant Britescript syntax colors
- **Britescript Light** - Light theme with clear syntax distinction

Enable via `Preferences: Color Theme` → "Britescript Dark/Light"

## Language Features

### Syntax Support
- ✅ **Structs** - Data type definitions
- ✅ **Traits** - Interface contracts  
- ✅ **Impl blocks** - Method implementations
- ✅ **Let bindings** - Immutable variables
- ✅ **Pipe operations** - Functional composition
- ✅ **Generics** - Type parameters
- ✅ **Mixed syntax** - TypeScript/JavaScript interop

### Smart Features
- **Bracket matching** for `{}`, `[]`, `()`, `<>`
- **Auto-closing pairs** for quotes and brackets
- **Comment toggling** with `//` and `/* */`
- **Code folding** for blocks and regions
- **Indentation rules** for clean code structure

## Next Steps

- [Installation Guide](/vscode-extension/installation)
- [Feature Details](/vscode-extension/features)
- [Command Reference](/vscode-extension/commands)
- [Settings Reference](/vscode-extension/settings)
- [Theme Customization](/vscode-extension/themes)