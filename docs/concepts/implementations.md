# Implementations

Implementations in Britescript allow you to add behavior to structs by implementing traits. This is similar to implementing interfaces in TypeScript, but with a cleaner syntax and more powerful features.

## Basic Syntax

Implement a trait for a struct using the `impl` keyword:

```typescript
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
```

This compiles to the following TypeScript:

```typescript
type User = {
  id: number;
  name: string;
  email: string;
}

interface Display {
  show(): string;
}

const UserDisplay = {
  show: (obj: User): string => {
    return `User #${obj.id}: ${obj.name}`;
  }
};
```

## Using Implementations

After implementing a trait, you can use the methods on instances of the struct:

```typescript
let user: User = {
  id: 1,
  name: "Alice",
  email: "alice@example.com"
};

// Call the implemented method
user.show() |> console.log;
```

## Multiple Trait Implementations

A struct can implement multiple traits:

```typescript
struct User {
  id: number;
  name: string;
  email: string;
}

trait Display {
  show(): string;
}

trait Serializable {
  serialize(): string;
  deserialize(data: string): User;
}

impl Display for User {
  show() {
    return `User #${this.id}: ${this.name}`;
  }
}

impl Serializable for User {
  serialize() {
    return JSON.stringify(this);
  }
  
  deserialize(data: string): User {
    return JSON.parse(data) as User;
  }
}
```

## Generic Implementations

You can implement traits for generic structs:

```typescript
struct Container<T> {
  value: T;
}

trait Display {
  show(): string;
}

impl<T> Display for Container<T> {
  show() {
    return `Container with value: ${this.value}`;
  }
}
```

## Conditional Implementations

You can implement traits conditionally based on type constraints:

```typescript
struct Container<T> {
  value: T;
}

trait Display {
  show(): string;
}

// Only implement Display for Container<string>
impl Display for Container<string> {
  show() {
    return `Container with string: ${this.value}`;
  }
}

// Only implement Display for Container<number>
impl Display for Container<number> {
  show() {
    return `Container with number: ${this.value.toFixed(2)}`;
  }
}
```

## Self Reference

You can use `this` within implementations to refer to the current instance:

```typescript
struct Counter {
  count: number;
}

trait Incrementable {
  increment(): void;
  reset(): void;
}

impl Incrementable for Counter {
  increment() {
    this.count += 1;
  }
  
  reset() {
    this.count = 0;
  }
}
```

## Best Practices

1. **Keep implementations focused** on a single trait
2. **Use descriptive method names** that reflect the behavior
3. **Avoid side effects** in trait methods when possible
4. **Document complex implementations** with comments
5. **Use generic implementations** for reusable behavior