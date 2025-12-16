// protocol + struct is akin to ABC + Class in Python

protocol AgentTool {
  var name: String { get } // READ-ONLY Variable. Use { get set } if you want R/W
  func execute(args: [String: Any]) -> String 
} 

// guard let - basically is a gate check as compared to if let which executes the block. 
struct LightTool: AgentTool {
  var name: String = "Turn on Lights"
  func execute(args: [String:Any]) -> String {
    guard let brightness = args["brightness"] as? Int else {
      return "Brightness doesn't exist"
    }
    return "Brightness set to \(brightness)"
  }
}

struct MusicTool: AgentTool {
  var name: String = "Play the song"
  func execute(args: [String:Any]) -> String {
    guard let song = args["song"] as? String else {
      return "Song doesn't exist"
    }
    return "Song is \(song)"
  }
}

// Don't forget to put () for Structs while initializing in an array. 
let MyTools: [AgentTool] = [LightTool(), MusicTool()]

for tool in MyTools {
  print(tool.execute(args: ["brightness": 50, "song": "Lalala"]))
}
