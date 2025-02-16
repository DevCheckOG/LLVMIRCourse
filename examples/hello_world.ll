source_filename = "hello_world.c"

@hello_world = private constant [12 x i8] c"hello world\00"

define i32 @main() {
  %1 = call i32 @puts(ptr @hello_world)
  ret i32 0
}

declare i32 @puts(ptr)