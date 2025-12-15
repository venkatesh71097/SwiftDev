import Foundation

struct Message {
  let id: String
  let text: String
}

func yieldmsgs() -> AsyncStream <Message> {
  
  return AsyncStream(Message.self) { continuation in 
    Task {
      let cursor = db.makeCursor("SELECT * FROM msgs") // Assuming db exists!
      while let row = cursor.next() {
        msg = Message(id: row["id"], text: row["text"])
        continuation.yield(msg)
      }
      continuation.finish()
    }
  }
}

func startProcessing() async {
    let msgs = yieldmsgs()
    
    // FIXED: Added 'await' because the stream delivers data over time
    for await msg in msgs {
        // FIXED: Changed .txt to .text
        print("Processing \(msg.text)") 
    }
}

Task {
  await startProcessing()
}