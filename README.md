<p align="center">
  <img src= "https://github.com/DevCheckOG/LLVMIRCourse/blob/master/assets/LLVMlogo.png" alt= "logo" style= "width: 1hv; height: 1hv;"> </img>
</p>

# First things first, LLVM.

## ¿What is LLVM?

**LLVM** (Low-Level Virtual Machine) is a set of tools and libraries that 
facilitate the creation of compilers and other code manipulation-related
 tools. It provides a modular infrastructure for intermediate 
representation (IR), code optimization, machine code generation, and 
execution.

## ¿What is intermediate representation (IR)?

Intermediate representation generally refers to a language that is independent of source code and sub-objective, as it is the midpoint between two major phases, from inception to completion.

## ¿What is LLVM IR?

**LLVM IR** is an intermediate representation created by the **LLVM project**, which has the same concept as above but tries to be extremely versatile and capable of being very optimizable to generate either assembly code for different architectures.

# Let's get to the point.

### Simple "Hello world" in LLVM IR.

```llvm
source_filename = "hello_world.c"

@hello_world = private constant [12 x i8] c"hello world\00"

define i32 @main() {
  %1 = call i32 @puts(ptr @hello_world)
  ret i32 0
}

declare i32 @puts(ptr)
```

**source_filename** represents the name of the file from which the IR generated by the compiler comes, in this case clang.

As you know, a string is represented by an array of characters. In LLVM IR, it is the same thing; the difference is that there is a tendency to generate global variables as constants, since it is not a dynamic, mutable string, so to speak.

`define i32 main`, which represents the entry point, which is a function that serves as the start gate for the execution of the program, since it indicates to the operating system where the program should start. This, as is customary, returns 0, since it is a signal to the operating system that the execution of the program was successful.

After that, there is a call to the puts function, which belongs to the C standard library, a bridge function to the write system call, on x86_64 architectures and the Linux kernel.

Finally, the `puts` function is prototyped or declared, since it must be available externally so that the linker can search for it in a certain library and link it to the resulting executable.

### Primitive types in LLVM IR

LLVM IR features primitive types, if you can say so, as these are types that are fully integrated into the language. They range from floating-point types, doubles, 8-bit, 16-bit, 32-bit, and 64-bit integers to types that return nothing or are simply the living equivalent of generic types, which can hold any other type other than void, respectively.

```llvm
float
double

i64
i32
i16
i8
void
ptr
```

Arrays with a predefined size at compile time are defined as follows:

```llvm
[SIZE x TYPE]

; Example
[8 x i8]
```

## Deeper.

You can now see LLVM IR in more detail in the corresponding files: 

- Functions.md 
- Structures.md 
- Calls.md
- Memory.md
- Arithmetic.md
- Globals.md
