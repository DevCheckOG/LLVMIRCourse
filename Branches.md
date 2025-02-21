# Branches in LLVM IR

Very similar to the labels that are used for keywords like `goto` in **C**, these completely change the flow of code from one place to another. These also exist in LLVM IR…

First the % symbol is used, followed by its identifier, and then the colon symbol:

```llvm
yes:
    ; goto no
no:
    unreacheable
```

If you are very attentive, you can already imagine that if there are labels, you must make an instruction that allows you to jump from label to label; that is why the instruction `br` exists.

```llvm
; Syntax: br <%branch>

yes:
    br %no
no:
    unreacheable
```

On the other hand, we can also use the `br` instruction to jump to a given boolean condition, allowing us to do something equivalent to it`if`.

```llvm
; Syntax: br <type> <%cmp>, <iftrue> <elsefalse>

    %0 = alloca i1, align 4
    store i1 true, ptr %0, align 4

    %1 = alloca i1, align 4
    store i1 true, ptr %1, align 4

    %2 = load i1, ptr %0, align 4
    %3 = load i1, ptr %1, align 4

    %cmp = icmp eq i1 %2, %3 

    br i1 %cmp label %true, label %false
true:
    ; TO-DO
false:
    unreacheable
```
