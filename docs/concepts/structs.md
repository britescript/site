# Structs

Structs in Britescript provide a clean way to define data structures that compile to TypeScript types.

## Basic Syntax

Define a struct using the `struct` keyword:

```typescript
struct User {
  id: number;
  name: string;
  email: string;
}
```

This compiles to the following TypeScript:

```typescript
type User = {
  id: number;
  name: string;
  email: string;
}
```

## Generic Structs

Structs can use generic type parameters:

```typescript
struct Container<T> {
  value: T;
}

struct Result<T, E> {
  success: boolean;
  data?: T;
  error?: E;
}
```

Compiled TypeScript:

```typescript
type Container<T> = {
  value: T;
}

type Result<T, E> = {
  success: boolean;
  data?: T;
  error?: E;
}
```

## Optional Properties

You can define optional properties using the `?` syntax:

```typescript
struct User {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
}
```

## Nested Structs

Structs can be nested within each other:

```typescript
struct Address {
  street: string;
  city: string;
  zipCode: string;
}

struct User {
  id: number;
  name: string;
  email: string;
  address: Address;
}
```

## Using Structs

Once defined, structs can be used as type annotations:

```typescript
let user: User = {
  id: 1,
  name: "Alice",
  email: "alice@example.com"
}

function createUser(name: string, email: string): User {
  return {
    id: Date.now(),
    name,
    email
  }
}
```

## Structs with Traits

Structs can be used with traits to define behavior:

```typescript
struct User {
  id: number;
  name: string;
  email: string;
}

trait Displayable {
  display(): string;
}

impl Displayable for User {
  display() {
    return `User: ${this.name} (${this.email})`;
  }
}

// Usage
let user: User = createUser("Alice", "alice@example.com");
user.display() |> console.log;
```

## Struct Composition

You can compose structs together:

```typescript
struct Timestamp {
  createdAt: number;
  updatedAt: number;
}

struct Metadata {
  author: string;
  version: string;
}

struct Document {
  id: number;
  title: string;
  content: string;
  timestamp: Timestamp;
  metadata: Metadata;
}
```

## Best Practices

1. **Use PascalCase** for struct names
2. **Keep structs focused** on a single responsibility
3. **Use generics** for reusable data structures
4. **Combine with traits** for behavior
5. **Document complex structs** with comments