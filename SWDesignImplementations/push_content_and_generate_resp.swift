struct Message {
  let sender: String
  let text: String
}

class OnDeviceLLM {
  func generate(context: String) async -> String {
    return ["Yes", "No", "Maybe"]
}

}
class Manager {
  var buffer: [Message] = []
  let llm: OnDeviceLLM = OnDeviceLLM()
  func receive(sender: String, text: String) {
    let msg = Message(sender: sender, text: text)
    buffer.append(msg)
    if buffer.count > 5 { buffer.removeFirst() } // removing the oldest element in the list
  }
  func generate_sugs() async -> String {
    guard !buffer.isEmpty else { return "" }
    let content = buffer.map { "\($0.sender): \($0.text)" }.joined(separator: "\n")
    return await llm.generate(context: content)
  }
}

let mgr = Manager()
mgr.receive(sender: "Alice", text: "Hey, are you free for lunch")
mgr.receive(sender: "Alice", text: "I'm in a meeting right now")
mgr.receive(sender: "Alice", text: "Okay, what about dinner")

Task {    
    // Await the result because it takes time
    let suggestions = await mgr.generate_sugs()
    print("Suggestions found: \(suggestions)")
}
