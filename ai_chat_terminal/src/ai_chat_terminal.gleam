import gleam/io
import gleam/string

// TODO: Consider splitting into modules like ui.gleam, ai.gleam, app.gleam if the project grows.

pub fn main() -> Nil {
  io.println("Welcome to the AI Chat Terminal!")
  app_loop()
}

fn app_loop() -> Nil {
  io.print("> ")
  let input = io.read_line()

  case input {
    Ok(text) -> {
      let trimmed_text = string.trim(text)
      if trimmed_text == "quit" {
        io.println("Goodbye!")
      } else {
        // TODO: Add quit condition
        let ai_response = get_ai_response(trimmed_text)
        io.println("AI: " <> ai_response)
        app_loop() // Continue the loop
      }
    }
    Error(Nil) -> {
      // End of input, e.g. Ctrl+D
      io.println("\nGoodbye!")
    }
  }
}

// Placeholder for AI interaction
fn get_ai_response(user_input: String) -> String {
  "I am a placeholder AI. You said: \"" <> user_input <> "\""
}
