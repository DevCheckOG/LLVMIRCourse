# Basic Arithmetic in LLVM IR

In LLVM IR we can do basic arithmetic if we use instructions like `mul`, `add`, `sub` and `sdiv` , `udiv`, `fdiv`.

## Addition (+)

```llvm
%variable = alloca i64, align 4
store i64 10, ptr %variable, align 4
%value = load i64, ptr %variable, align 4

%resultado = add i64 %value, i64 10 ; 10 + 10 = 20
store i64 %resultado, ptr %variable, align 4
```

## Multiplication (*)

```llvm
%variable = alloca i64, align 4
store i64 10, ptr %variable, align 4
%value = load i64, ptr %variable, align 4

%resultado = mul i64 %value, i64 10 ; 10 x 10 = 100
store i64 %resultado, ptr %variable, align 4
```

## Subtraction (-)

```llvm
%variable = alloca i64, align 4
store i64 10, ptr %variable, align 4
%value = load i64, ptr %variable, align 4

%resultado = sub i64 %value, i64 10 ; 10 - 10 = 0
store i64 %resultado, ptr %variable, align 4
```

## Signed Integer Division (-N) (/)

```llvm
%variable = alloca i64, align 4
store i64 10, ptr %variable, align 4
%value = load i64, ptr %variable, align 4

%resultado = sdiv i64 %value, i64 10 ; 10 / 10 = 0
store i64 %resultado, ptr %variable, align 4
```

## Unsigned Integer Division (N) (/)

```llvm
%variable = alloca i64, align 4
store i64 10, ptr %variable, align 4
%value = load i64, ptr %variable, align 4

%resultado = udiv i64 %value, i64 10 ; 10 / 10 = 0
store i64 %resultado, ptr %variable, align 4
```

## Floating-Point Division (N.N) (/)

```llvm
%variable = alloca float, align 4
store float 10.0, ptr %variable, align 4
%value = load float, ptr %variable, align 4

%resultado = fdiv float %value, float 10.0 ; 10.0 / 10.0 = 0
store float %resultado, ptr %variable, align 4
```
