import gleam/io

pub type Option(a) {
  Some(a)
  None
}

pub fn main() {
  io.println("Running module diedie!")

  case True {
    True -> quit(None)
    False -> abort(Some("This should never Run"))
  }

  io.println("This should not output!")
}

fn quit(maybe_message: Option(String)) -> Nil {
  do_exit(0, maybe_message)
}

fn abort(maybe_message: Option(String)) -> Nil {
  do_exit(1, maybe_message)
}

if erlang {
  external fn do_exit(code: Int, maybe_message: Option(String)) -> Nil =
    "diedie_ffi" "exit"
}
