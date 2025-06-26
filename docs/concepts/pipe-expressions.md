# Pipe Expressions

Pipe expressions in Britescript allow you to chain function calls in a clean, readable way. They're inspired by similar features in languages like Elixir and F#.

## Basic Syntax

Use the pipe operator `|>` to pass the result of one expression as the first argument to the next function:

```typescript
let message = "  hello world  "
message |> trim |> toUpperCase |> console.log
```

This compiles to the following TypeScript:

```typescript
const message = "  hello world  ";
console.log(message.trim().toUpperCase());
```

## Multi-line Pipes

For better readability, you can split pipe expressions across multiple lines:

```typescript
let announcement = "  britescript is awesome  "
announcement 
  |> trim 
  |> toUpperCase 
  |> console.log
```

## Pipe with Function Arguments

You can pipe into functions with additional arguments:

```typescript
let numbers = [1, 2, 3, 4, 5]
numbers
  |> filter(n => n % 2 === 0)
  |> map(n => n * 2)
  |> reduce((sum, n) => sum + n, 0)
  |> console.log
```

This compiles to:

```typescript
const numbers = [1, 2, 3, 4, 5];
console.log(
  numbers
    .filter(n => n % 2 === 0)
    .map(n => n * 2)
    .reduce((sum, n) => sum + n, 0)
);
```

## Pipe with Method Calls

You can pipe into method calls:

```typescript
let user = { name: "Alice", email: "alice@example.com" }
user.name
  |> trim
  |> toUpperCase
  |> console.log
```

## Pipe with Custom Functions

You can define custom functions to use with pipes:

```typescript
function double(x: number): number {
  return x * 2;
}

function addOne(x: number): number {
  return x + 1;
}

let num = 5
num |> double |> addOne |> console.log // 11
```

## Pipe with Async Functions

Pipes work with async functions and Promises:

```typescript
async function fetchUser(id: number): Promise<User> {
  // Fetch user from API
}

async function processUser() {
  let userId = 123
  await userId
    |> fetchUser
    |> processUserData
    |> saveToDatabase
}
```

## Pipe with Error Handling

Combine pipes with try/catch for error handling:

```typescript
try {
  let data = "{ \"invalid\": json }"
  data
    |> JSON.parse
    |> processData
    |> saveResult
} catch (error) {
  error.message |> console.error
}
```

## Benefits of Pipe Expressions

1. **Readability**: Code reads from left to right, top to bottom
2. **Maintainability**: Easy to add, remove, or reorder steps
3. **Reduced nesting**: Avoids deeply nested function calls
4. **Focus on data flow**: Emphasizes the transformation pipeline

## Best Practices

1. **Keep pipe steps focused** on a single transformation
2. **Use multi-line formatting** for complex pipes
3. **Name intermediate variables** for clarity when needed
4. **Combine with pattern matching** for powerful data processing
5. **Use pipes for data transformations** rather than side effects