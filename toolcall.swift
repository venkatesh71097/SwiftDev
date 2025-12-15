import Foundation

func turnOnLights(_ brightness: Int) -> String {
    return "Success: Lights set to \(brightness)%."
}

func playMusic(_ song: String) -> String {
    return "Success: Now playing '\(song)'."
}

func executeTool(jsonString: String) -> String {
  // Compiler errored out when I put as? in guard let jsonData - it's already a 'Data' type. No need to check
  guard let jsonData = jsonString.data(using: .utf8) else {
    return "Could not convert string to bytes"
  }
  // as? Type check helps the compiler understand the type, but you need to know when 'NOT' to use, as in above condn.
  guard let dict = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
    return "Invalid JSON"
  }
  guard let toolcall = dict["tool"] as? String else {
    return "Invalid Tool"
  }
  guard let args = dict["arguments"] as? [String: Any] else {
    return "Invalid Arguments"
  }

  // Switch case to go over each and every possibility of a toolcall! 
  // Don't forget to put else {} condition for if let. 
  switch toolcall {
  case "turn_on_lights":
    if let brightness = args["brightness"] as? Int {
      return turnOnLights(brightness)
    } else {
      return "Invalid turnonlights"
    }
  case "play_music":
    if let song = args["song"] as? String {
      return playMusic(song)
    } else {
      return "Invalid playmusic"
    }
  default: 
    return "Invalid..."
  }
}

// Testcases! 

print("--- TEST 1: Lights (Valid) ---")
// Note: We use triple quotes (""") for multi-line strings in Swift
let llmOutput1 = """
{
    "tool": "turn_on_lights",
    "arguments": { "brightness": 85 }
}
"""
print(executeTool(jsonString: llmOutput1))


print("\n--- TEST 2: Music (Valid) ---")
let llmOutput2 = """
{
    "tool": "play_music",
    "arguments": { "song": "Bohemian Rhapsody" }
}
"""
print(executeTool(jsonString: llmOutput2))


print("\n--- TEST 3: Hallucination (Invalid Tool) ---")
let llmOutput3 = """
{
    "tool": "make_coffee",
    "arguments": { "sugar": 2 }
}
"""
print(executeTool(jsonString: llmOutput3))


print("\n--- TEST 4: Type Mismatch (String instead of Int) ---")
let llmOutput4 = """
{
    "tool": "turn_on_lights",
    "arguments": { "brightness": "very bright" }
}
"""
print(executeTool(jsonString: llmOutput4))