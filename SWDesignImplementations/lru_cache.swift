import Foundation
/*
We are downloading images (or loading AI Models). We want to store them in memory so we don't re-download them. Constraint: We can only store 5 images. If we download a 6th one, delete the Least Recently Used (LRU) one to make space.
*/

struct ImageLoader {
  var id: String
  var image: String
  var time: String
}

class LRUManager {
  var buffer: [ImageLoader] = []
  var buffer_length = 5
  // Read and update the priority of the image
  func read(id: String) -> ImageLoader? {
    if let index = buffer.firstIndex(where: { $0.id == id }) {
      let cache = buffer[index]
      buffer.remove(at: index)
      buffer.append(cache)
      return cache
    }
    return nil
  }

  // Write the image
  func write(id: String, image: String, time: String) {
    if read(id: id) != nil {
      return
    }
    if buffer.count > buffer_length {
      buffer.removeFirst()
    }
    let msg = ImageLoader(id: id, image: image, time: time)
    buffer.append(msg)
  }
}

var mgr = LRUManager()
mgr.write(id: "1", image: "Image1", time: "Dec17")
let out = mgr.read(id: "1")
print(out!)
