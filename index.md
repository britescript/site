---
layout: home

hero:
  name: "Britescript"
  text: "Modern language that compiles to TypeScript"
  tagline: Fast, lightweight, with traits, structs, pipes, and JSX support. Works with any TypeScript project.
  image:
    src: /logo.svg
    alt: Britescript
  actions:
    - theme: brand
      text: Get Started
      link: /docs/
    - theme: alt
      text: View on GitHub
      link: https://github.com/britescript/britescript
    - theme: alt
      text: Install Now
      link: "#quick-install"

features:
  - icon: 🚀
    title: Ultrafast & Lightweight
    details: The compiler is optimized for speed. The runtime is tiny. Using only Web Standard APIs and TypeScript.
  - icon: 🔧
    title: Modern Syntax
    details: Enjoy the best of Rust, Elixir, and TypeScript with structs, traits, pattern matching, and pipe operators.
  - icon: 🌍
    title: Multi-platform
    details: Works with any TypeScript project. Integrates with Vite, React, Node.js, Bun, and more.
  - icon: 🔋
    title: Batteries Included
    details: CLI tools, VS Code extension, Vite plugin, and more. Everything you need to be productive.
---

<div class="code-example">

```britescript
// Britescript code example
struct User {
  id: number;
  name: string;
  email: string;
}

trait Display {
  show(): string;
}

impl Display for User {
  show() {
    return `User #${this.id}: ${this.name}`;
  }
}

let user = {
  id: 1,
  name: "Alice",
  email: "alice@example.com"
}

let message = "Hello, "
message |> concat(user.name) |> console.log
```

</div>

## Why Britescript?

Britescript brings powerful language features to the TypeScript ecosystem:

- **Structs** - Define data structures with clean syntax
- **Traits** - Create interfaces with trait declarations
- **Implementations** - Implement traits for your structs
- **Atoms** - Use Elixir-style atoms for immutable constants
- **Pattern Matching** - Powerful pattern matching inspired by Rust and Elixir
- **Pipe Expressions** - Chain function calls with the pipe operator
- **Mixed Code** - Use regular JavaScript/TypeScript alongside Britescript

# Quick Install {#quick-install}

<div class="install-container">
  <div class="install-step">
    <h3>1. Install Britescript</h3>
    <div class="code-tabs">
      <div class="tab active" data-tab="bash">macOS/Linux</div>
      <div class="tab" data-tab="powershell">Windows</div>
      <div class="tab" data-tab="npm">npm</div>
    </div>
    <div class="tab-content active" id="bash">
      <button class="copy-button" onclick="copyToClipboard('curl -fsSL https://britescript.com/install | bash')">Copy</button>
      <pre><code>curl -fsSL https://britescript.com/install | bash</code></pre>
    </div>
    <div class="tab-content" id="powershell">
      <button class="copy-button" onclick="copyToClipboard('irm britescript.com/install.ps1 | iex')">Copy</button>
      <pre><code>irm britescript.com/install.ps1 | iex</code></pre>
    </div>
    <div class="tab-content" id="npm">
      <button class="copy-button" onclick="copyToClipboard('bun install -g @britescript/cli')">Copy</button>
      <pre><code>bun install -g @britescript/cli</code></pre>
    </div>
  </div>
  
  <div class="install-step">
    <h3>2. Create a project</h3>
    <button class="copy-button" onclick="copyToClipboard('brite init my-app\ncd my-app')">Copy</button>
    <pre><code>brite init my-app
cd my-app</code></pre>
  </div>
  
  <div class="install-step">
    <h3>3. Run your code</h3>
    <button class="copy-button" onclick="copyToClipboard('brite run main.bs')">Copy</button>
    <pre><code>brite run main.bs</code></pre>
  </div>
</div>

<style>
.install-container {
  background-color: var(--vp-c-bg-soft);
  border-radius: 8px;
  padding: 20px;
  margin: 20px 0;
}
.install-step {
  margin-bottom: 20px;
}
.code-tabs {
  display: flex;
  margin-bottom: 10px;
}
.tab {
  padding: 8px 16px;
  cursor: pointer;
  border-radius: 4px 4px 0 0;
  background-color: var(--vp-c-bg);
  margin-right: 4px;
}
.tab.active {
  background-color: var(--vp-c-brand);
  color: white;
}
.tab-content {
  display: none;
  position: relative;
}
.tab-content.active {
  display: block;
}
.copy-button {
  position: absolute;
  top: 8px;
  right: 8px;
  background-color: var(--vp-c-brand);
  color: white;
  border: none;
  border-radius: 4px;
  padding: 4px 8px;
  cursor: pointer;
  font-size: 12px;
}
.copy-button:hover {
  background-color: var(--vp-c-brand-dark);
}
pre {
  margin: 0;
  padding: 16px;
  background-color: var(--vp-c-bg);
  border-radius: 4px;
  overflow-x: auto;
}
</style>

<script>
// Only run in browser environment
if (typeof window !== 'undefined') {
  window.addEventListener('DOMContentLoaded', function() {
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach(tab => {
      tab.addEventListener('click', function() {
        // Remove active class from all tabs
        tabs.forEach(t => t.classList.remove('active'));
        // Add active class to clicked tab
        this.classList.add('active');
        
        // Hide all tab contents
        const tabContents = document.querySelectorAll('.tab-content');
        tabContents.forEach(content => content.classList.remove('active'));
        
        // Show the corresponding tab content
        const tabId = this.getAttribute('data-tab');
        document.getElementById(tabId).classList.add('active');
      });
    });
  });

  // Define copyToClipboard function in global scope
  window.copyToClipboard = function(text) {
    navigator.clipboard.writeText(text).then(() => {
      alert('Copied to clipboard!');
    }).catch(err => {
      console.error('Failed to copy: ', err);
    });
  };
}
</script>

## Ecosystem

<div class="custom-button-container">
  <a href="/docs/" class="custom-button">Documentation</a>
  <a href="/cli/" class="custom-button">CLI Tools</a>
  <a href="/vite-config/" class="custom-button">Vite Plugin</a>
  <a href="/vscode-extension/" class="custom-button">VS Code Extension</a>
</div>