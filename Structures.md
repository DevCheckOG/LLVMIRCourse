# Structures in LLVM IR

Structures in LLVM IR can be defined using syntax similar to constructing the body of a function when it is defined. It can only contain unique types.

```llvm
{ i64, i32, ptr, [8 x i8] }
```

These structures can be used as return types when defining a function.

```llvm
define { i64, i32, ptr, [8 x i8] } @test() {
    ...
}
```
