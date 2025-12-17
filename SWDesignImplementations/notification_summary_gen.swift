import Foundation

struct Message {
  let title: String
  let isSensitive: Bool
  let message: String
}

class Manager {
  var buffer: [Message] = []
  let buffer_limit = 10

  func receive(title: String, isSensitive: Bool, message: String) {
    let msg = Message(title: title, isSensitive: isSensitive, message: message)
    buffer.append(msg)
    if buffer.count > buffer_limit { buffer.removeFirst() } // removing the oldest element in the list
  }

  func generate(context: String) async -> String {
    print(context)
    return "You have 3 messages from Alice and a high usage alert from your Bank."
  }

  func generate_summary() async -> String {
    guard !buffer.isEmpty else { return "" }
    var prompt: [String] = []
    for item in buffer {
      if item.isSensitive {
        prompt.append("[\(item.title)]: <REDACTED_MESSAGE>")
      } else {
        prompt.append("[\(item.title)]: \(item.message)")

      }
    }
    let context = prompt.joined(separator: "\n")
    // let content = buffer.map { "\($0.text)" }.joined(separator: "\n")
    return await generate(context: context)
  }
}

let mgr = Manager()
mgr.receive(
    title: "Messages",
    isSensitive: false,
    message: "Hey, are we still on for dinner?"
)

mgr.receive(
    title: "Chase Bank",
    isSensitive: true,
    message: "Your account ending in 1234 is overdrawn."
)

mgr.receive(
    title: "CNN",
    isSensitive: false,
    message: "Breaking news: Market hits all time high."
)

Task {    
    let summary = await mgr.generate_summary()
    print("Suggestions found: \(summary)")
}
