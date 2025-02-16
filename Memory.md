# Memory Management in LLVM IR

To put it into context, there are two different types of memory sections, the stack and the heap. 

## Stack

The **stack** is a section of memory that is freed when the function is out of scope. This memory is used to define local variables in LLVM IR. 

## Heap

The **heap** in LLVM IR is treated as a section of memory, where any type of data can be used and stored throughout the program. It can be used anywhere in the program, but it must be freed before it ends so as not to lose that section of used memory.

## Memory Alignment

Memory alignment tells the CPU that data in memory should point to multiples of N. It is mandatory in many use cases in LLVM IR.

## Stack Usage

To use the stack, we must use the instruction called `alloca`, followed by the type to assign and the memory alignment.

This instruction returns a memory-allocated pointer to a given memory address, represented by the primitive type `ptr`.

```llvm
; Syntax: alloca <type>, align <number>

%0 = alloca i64, align 4 
```

## Heap Usage

To use the heap, we must declare external functions, belonging to the C ABI, we can use malloc in this case.

This function returns a memory-allocated pointer to a given memory address, represented by the primitive type `ptr`.

To find out more information I recommend using the `man malloc` command in Linux or searching the internet for this function in C.

```llvm
; malloc declaration
declare ptr @malloc(i32)

; malloc usage
%0 = call ptr malloc(8)
```

## Loading values

To retrieve the value of the memory allocated from a pointer in LLVM IR, allocated on the stack or the heap, we must use the `load` instruction. This function retrieves the value contained in the memory address contained in the pointer.

```llvm
; Syntax: load <type>, <pointer>, align <number>

%0 = alloca i64, align 4 
%1 = load i64, ptr %0, align 8 
```

## Storing values

To store values ​​to pointers with a certain memory address, whether assigned in the stack or the heap, we must use the `store` instruction, which overwrites the value before the one provided.

```llvm
; Syntax: store <type>, <pointer>, align <number>

%0 = alloca i64, align 4 
store i64 0, ptr %0, align 4 
```
