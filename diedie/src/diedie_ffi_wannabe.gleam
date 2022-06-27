// Cause the JS FFI is so ugly I was curious, what it looked like if the FFI would be written in Gleam
import gleam/io
import gleam/string
import gleam/int
import gleam/option.{None, Option, Some}

pub fn exit(code: Int, maybe_message: Option(String)) {
  let code_string = int.to_string(code)
  case code, maybe_message {
    0, Some(message) ->
      io.println(string.concat(["Quit (", code_string, "): ", message]))
    code, Some(message) if code >= 1 ->
      io.println(string.concat(["Abort (", code_string, "): ", message]))
    code, None if code >= 1 -> io.println("Abort")
  }
  // system.exit(code)
}
