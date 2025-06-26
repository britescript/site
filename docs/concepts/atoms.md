# Atoms

Atoms in Britescript are immutable, unique symbols inspired by Elixir's atoms. They're perfect for representing constant values, status codes, and enum-like options.

## Basic Syntax

Define an atom using the colon prefix:

```typescript
let status = :ok
let error_type = :network_error
let state = :running
```

This compiles to the following TypeScript:

```typescript
const status = Symbol.for("ok");
const error_type = Symbol.for("network_error");
const state = Symbol.for("running");
```

## Use Cases

### Status Values

Atoms are perfect for representing status values:

```typescript
function processRequest() {
  // Simulate API call
  if (Math.random() > 0.5) {
    return :success;
  } else {
    return :error;
  }
}

let result = processRequest();

if (result === :success) {
  console.log("Request succeeded");
} else if (result === :error) {
  console.log("Request failed");
}
```

### Configuration Options

Use atoms for configuration options:

```typescript
struct Config {
  mode: symbol;
  logLevel: symbol;
}

let config: Config = {
  mode: :development,
  logLevel: :debug
}

if (config.mode === :production) {
  // Production-specific logic
}
```

### Enum-like Values

Atoms can be used like enums:

```typescript
let colors = {
  red: :red,
  green: :green,
  blue: :blue
}

function getColorName(color: symbol): string {
  if (color === colors.red) return "Red";
  if (color === colors.green) return "Green";
  if (color === colors.blue) return "Blue";
  return "Unknown";
}
```

## Pattern Matching with Atoms

Atoms work great with pattern matching:

```typescript
let status = :success;

let message = match status {
  :success => "Operation completed successfully"
  :error => "An error occurred"
  :pending => "Operation in progress"
  _ => "Unknown status"
}
```

## Comparing Atoms

Atoms with the same name are always equal:

```typescript
let a = :status;
let b = :status;

console.log(a === b); // true
```

## Atoms vs. Strings

While atoms might look similar to strings, they have important differences:

1. **Uniqueness**: Two atoms with the same name are always the same object
2. **Performance**: Comparing atoms is faster than comparing strings
3. **Immutability**: Atoms cannot be modified
4. **Intent**: Atoms clearly communicate that a value is a constant identifier

## Best Practices

1. **Use atoms for constants** that represent states, types, or options
2. **Keep atom names short** and descriptive
3. **Use snake_case** for multi-word atom names
4. **Avoid dynamic atom creation** from user input
5. **Use atoms with pattern matching** for clean control flow