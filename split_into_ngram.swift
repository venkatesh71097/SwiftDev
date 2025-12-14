import Foundation

func split_into_n_words(_ note: String, _ n: Int) -> [String] {
  guard !note.isEmpty, n > 0 else {
    return []
  }
  let words = note.split{$0.isWhitespace}
  var chunks: [String] = []
  for i in stride(from:0, to:words.count, by:n){
    let end = min(i+n, words.count)
    let chunk = words[i..<end]
    chunks.append(chunk.joined(separator: " "))
  }
  return chunks
}

let note = "Flight to Paris is at 5 PM on Sunday check in early"
let k = 5
let val = split_into_n_words(note, k)
print("Value is: \(val)") 