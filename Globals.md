# Global Variables in LLVM IR

Global functions can be constants and called from anywhere in the program in LLVM IR. First, we must create their identifier, starting with the symbol @, followed by their name.

```llvm
@my_global
```

Then we must indicate its visibility, if it is accessible from outside, for use with the linker, or proprietary; in any case, we use the keywords `private` or `global` accordingly.

```llvm
@my_global private
```

Then we can indicate if it is a constant (it cannot be mutated), or if we do not put anything, it is mutable. For constants, we use the keyword;`constant` excuse the redundancy.

```llvm
@my_global private constant
```

Now we must indicate its type.

```llvm
@my_global private constant [12 x i8]
```

Now we must indicate its value.

```llvm
@my_global private constant [12 x i8] c"hello world\00"
```

We can specify its memory alignment, but if the value is different from 1, it is ignored by any LLVM/Clang tool when compiling.

```llvm
@my_global private constant [12 x i8] c"hello world\00", align 1
```
