# Loops in LLVM IR

In LLVM IR you can make loops by playing with labels, using the `br` instruction with comparisons either to integers `icmp` or floats or doubles like `fcmp`.

An example with a counter:

```llvm
%0 = alloca i64, align 4 ; Allocate the counter
store i64 0, ptr %0, align 4 ; Store in value to the counter
br %condition ; Unconditional jump

condition:
    %1 = load i64, ptr %0, align 4
    %cmp = icmp eq i64 %1, 1000
    br i1 %cmp label %exit, label %body
body:
    %2 = load i64, ptr %0, align 4
    %3 = add i64 %2, 1
    store i64 %3, ptr %0, align 4
    br %condition ; Unconditional jump
exit:
    ; TO-DO
    unreacheable
```

In this example, the counter will be increased until it equals 1000.

Equivalent C code:

```c
for (long a = 0; a == 1000; a++) {
    // TO-DO
}
```
