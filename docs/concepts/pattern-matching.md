# Pattern Matching

Pattern matching in Britescript provides a powerful way to destructure and match values against patterns. It's inspired by similar features in Rust and Elixir.

## Basic Syntax

Use the `match` expression to match a value against multiple patterns:

```typescript
let status = :success;

let message = match status {
  :success => "Operation completed successfully"
  :error => "An error occurred"
  :pending => "Operation in progress"
  _ => "Unknown status"
}
```

This compiles to the following TypeScript:

```typescript
const status = Symbol.for("success");

const message = (() => {
  const __match_value = status;
  if (__match_value === Symbol.for("success")) {
    return "Operation completed successfully";
  } else if (__match_value === Symbol.for("error")) {
    return "An error occurred";
  } else if (__match_value === Symbol.for("pending")) {
    return "Operation in progress";
  } else {
    return "Unknown status";
  }
  throw new Error("Non-exhaustive match");
})();
```

## Pattern Types

### Literal Patterns

Match against literal values:

```typescript
let code = 404;

let message = match code {
  200 => "OK"
  404 => "Not Found"
  500 => "Server Error"
  _ => "Unknown Code"
}
```

### Atom Patterns

Match against atoms:

```typescript
let status = :error;

let message = match status {
  :success => "All good!"
  :error => "Something failed"
  :pending => "Still working..."
  _ => "Unknown status"
}
```

### Variable Binding

Capture values with variable bindings:

```typescript
let value = 42;

let doubled = match value {
  x => x * 2
}

console.log(doubled); // 84
```

### Wildcard Pattern

Use `_` to match any value:

```typescript
let status = :unknown;

let message = match status {
  :success => "All good!"
  :error => "Something failed"
  _ => "Unrecognized status"
}
```

## Complex Patterns

### Object Patterns

Match against object properties:

```typescript
let user = { name: "Alice", role: :admin };

let greeting = match user {
  { role: :admin } => `Welcome, Administrator ${user.name}`
  { role: :user } => `Hello, ${user.name}`
  _ => "Who are you?"
}
```

### Array Patterns

Match against array elements:

```typescript
let point = [10, 20];

let description = match point {
  [0, 0] => "At the origin"
  [0, y] => `On the y-axis at ${y}`
  [x, 0] => `On the x-axis at ${x}`
  [x, y] => `At point (${x}, ${y})`
}
```

## Guard Clauses

Add conditions to patterns:

```typescript
let num = 42;

let description = match num {
  x if x < 0 => "Negative"
  x if x === 0 => "Zero"
  x if x % 2 === 0 => "Positive even"
  x => "Positive odd"
}
```

## Exhaustiveness Checking

Match expressions ensure all possible values are handled:

```typescript
enum Color { Red, Green, Blue }
let color = Color.Red;

let name = match color {
  Color.Red => "Red"
  Color.Green => "Green"
  Color.Blue => "Blue"
  // No default case needed - all enum values are covered
}
```

If a new enum value is added later, the compiler will warn about non-exhaustive matching.

## Best Practices

1. **Use pattern matching** for complex conditional logic
2. **Ensure exhaustiveness** by handling all possible cases
3. **Put more specific patterns first** and general patterns last
4. **Use guard clauses** for additional conditions
5. **Keep match expressions focused** on a single concern