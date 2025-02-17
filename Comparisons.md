# Comparisons in LLVM IR

In LLVM you can write comparisons that allow us to evaluate boolean expressions; for integers there is the `icmp` instruction, for floats and doubles we find `fcmp`. These comparisons will always return a boolean as a result, which is an integer.

We also have different comparison operators for signed and unsigned integers, such as:

```llvm
eq ; == Equal
ne ; != Not Equal
ugt ; > Unsigned Greater Than
uge ; >= Unsigned Greater Than or Equal
ult ; < Unsigned Less Than
ule ; <= Unsigned Less Than or Equal
sgt ; > Signed Greater Than
sge ; >= Signed Greater Than or Equal
slt ; < Signed Less Than
sle ; <= Signed Less Than or Equal
```

There are also floats and doubles:

```llvm
oeq ; Returns true if left == right and neither are NaN
oge ; Returns true if left >= right and neither are NaN
ogt ; Returns true if left > right and neither are NaN
ole ; Returns true if left <= right and neither are NaN
olt ; Returns true if left < right and neither are NaN
one ; Returns true if left != right and neither are NaN
ord ; Returns true if neither value is NaN
```

To build a conditional, for integers:

```llvm
; Syntax: icmp <condition> <type> <value one> <value two>

%0 = alloca i32, align 4 ; Allocate i32 type 
%1 = alloca i32, align 4 ; Allocate i32 type 

store i32 32, ptr %0, align 4 ; Store some value to them
store i32 32, ptr %1, align 4 ; Store some value to them

%2 = load i32, ptr %0, align 4 ; Load the value from memory
%3 = load i32, ptr %1, align 4 ; Load the value from memory

%cmp = icmp eq i32 %2, %3 ; Perfom the comparison
```

To build a conditional, for floats or doubles:

```llvm
; Syntax: fcmp <condition> <type> <value one> <value two>

%0 = alloca float, align 4 ; Allocate float type 
%1 = alloca float, align 4 ; Allocate float type 

store float 32.0, ptr %0, align 4 ; Store some value to them
store float 32.0, ptr %1, align 4 ; Store some value to them

%2 = load float, ptr %0, align 4 ; Load the value from memory
%3 = load float, ptr %1, align 4 ; Load the value from memory

%cmp = fcmp oeq float %2, %3 ; Perfom the comparison
```
