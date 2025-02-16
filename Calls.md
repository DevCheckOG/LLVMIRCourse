# Function calls in LLVM IR

The function call in LLVM IR is considered an instruction that can extract the value returned by a function defined or declared in LLVM IR. We use the `call` instruction.

```llvm
; We declare the function
declare i32 @test()

; We call the function
%0 = call i32 @test()
```

First you have to use the call instruction.

```llvm
%0 = call
```

Then we indicate the type that the function can return.

```llvm
%0 = call i32
```

We then use the very similar syntax after defining or declaring the parameters of a function.

```llvm
%0 = call i32 @test()
```
