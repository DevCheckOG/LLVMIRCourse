# Memory Management in LLVM IR

To put it into context, there are two different types of memory sections, the stack and the heap. 

## Stack

The **stack** is a section of memory that is freed when a function goes out of scope, moving the stack backward. This memory is used to define local variables in LLVM IR. It is used for data types whose exact size is known.

## Heap

The **heap** is considered a section of memory where any type of data can be used and stored throughout the program. It's much more flexible and capable than the stack but more positional, as it requires allocated memory to always be deallocated; otherwise, memory leaks occur.

## Memory Alignment

Memory alignment ensures data is stored at memory addresses divisible by a specific value (N). For instance, a 4-byte aligned datum must reside at addresses like 0, 4, 8, etc. This allows the CPU to access data more efficiently, as many architectures process aligned data in a single cycle, while unaligned data may require multiple accesses or trigger exceptions. In LLVM IR, alignment is specified in instructions like load or store (e.g., align 4) to guide the compiler in generating optimized code for the target hardware.

## Stack Usage

To use the stack, we must use the instruction called `alloca`, followed by the type to assign and the memory alignment.

The stack is actually much faster than the heap because it knows the maximum amount of memory size for a certain type or value, and it automatically frees itself after falling when reaching the end of the function or a return.

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
