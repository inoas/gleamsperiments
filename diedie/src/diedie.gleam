import gleam/io

pub type Option(a) {
  Some(a)
  None
}

pub fn main() {
  io.println("Running module diedie!")

  case False {
    // _ -> exit(99, None)
    True -> quit(Some("This quits!"))
    False -> abort(Some("This aborts!"))
  }

  io.println("This should be never printed!")
}

pub fn quit(maybe_message: Option(String)) -> Nil {
  do_exit(0, maybe_message)
}

pub fn abort(maybe_message: Option(String)) -> Nil {
  do_exit(1, maybe_message)
}

pub fn exit(exit_code: Int, maybe_message: Option(String)) -> Nil {
  do_exit(exit_code, maybe_message)
}

if erlang {
  external fn do_exit(code: Int, maybe_message: Option(String)) -> Nil =
    "diedie_ffi" "exit"
}

if javascript {
  external fn do_exit(code: Int, maybe_message: Option(String)) -> Nil =
    "./diedie_ffi.mjs" "exit"
}
