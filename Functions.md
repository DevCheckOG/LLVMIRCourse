# Functions in LLVM IR

To define the functions, we need to start with the keyword define.

```llvm
define 
```

Now we must define its return type, which indicates what the function should return. If nothing is returned, the primitive void type is used. For more information, see the introduction.

```llvm
define void
```

Now we are going to define its name, which by law must always start with the @ symbol; in this case, we are going to name it test.

```llvm
define void @test
```

Now we are going to define if it needs parameters, so if necessary, we are going to declare it in the following way, which always needs to start with the % symbol.

```llvm
; With parameters
define void @test(%size i64)

; Without parameters
define void @test()
```

Since we are defining a function, it always has to have its body, so we simply build it with {}:

```llvm
define void @test() {
    ...
}
```

In LLVM IR, even if it does not return anything, a function must always have a return type, which we construct with the keyword ret followed by its type, followed by its value in the case of nothing, in this case the void type.

```llvm
define void @test() {
    ret void
}
```

# Declaration of functions

To declare or prototype a function in LLVM IR, we must start with the keyword declare

```llvm
declare
```

Next, we use the same structure described above for functions, except that they will never have a body and will not contain identifiers for parameters, only types.

```llvm
declare void @test(i64) 
```

# Parameter overflow

In the case of functions, the "..." pattern is used when declaring function parameters. This tells the IR that the outer function can take many more arguments than declared.

```llvm
; Only when declaring functions
declare void @test(i64, ...)
```
