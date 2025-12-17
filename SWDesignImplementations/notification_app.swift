import Foundation
"""
My first self-implemented (with 0 help) swift app for notification that will push the data into an LLM API (blackboxapi). 
Issues had earlier: 
  1. Lack of visualization of structuring in Swift. I just have to correlate Swift with Python mentally to code. 
  2. Ensure that you use "func xyz() async -> ..." 
"""
struct NotificationData {
  let id: String
  let message: String
  let date: String
}

class SmartNotifier {
  var buffer: [NotificationData] = []
  var buffer_limit = 5
  func receive(id: String, message: String, date: String) {
    let msg = NotificationData(id: id, message: message, date: date)
    buffer.append(msg)
    if buffer.count > buffer_limit {
      buffer.removeLast()
    }
  }
  func blackboxapi(model: String, llm_messages: [[String: Any]]) async -> String {
    return "The api is implemented!"
  }
  func gen_summary() async -> String {
    guard !buffer.isEmpty else {
      return ""
    }
    let context: String = buffer.map { $0.message }.joined(separator: "\n")
    let llm_messages: [[String: Any]] = [["Role": "User", "Content": context], ["Role": "System", "Content": "Ok"]]
    let summarizer: String = await blackboxapi(model:"gpt-4o", llm_messages: llm_messages)
    print(summarizer)
    return summarizer
  }
}

var cls = SmartNotifier()
cls.receive(id: "1", message: "Yo, my name is John!", date: "2025/12/17")
cls.receive(id: "2", message: "Yo, my name is Pedro!", date: "2025/12/18")
cls.receive(id: "3", message: "Yo, my name is Yo!", date: "2025/12/19")
Task {
  await cls.gen_summary()
}
