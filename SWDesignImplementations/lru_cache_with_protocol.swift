import Foundation
/*
We are downloading images (or loading AI Models). We want to store them in memory so we don't re-download them. Constraint: We can only store 5 images. If we download a 6th one, delete the Least Recently Used (LRU) one to make space.
*/

// Why protocol? 

// In case you wanna test out a dummy class with the existing schema of class, you really shouldn't play around with the existing class. Create a test class and do all your experiments there. For that, you need to ensure that you let the loader
// know that it's any of the class that belongs to LRUTemplate Protocol. That way, while loading my LoadImage class, I passed cache it should use. That's why I even defined the init thingy! 

struct Image {
  var id: String
  var image: String
  var time: String
}

protocol LRUTemplate {
  func read(id: String) -> Image?
  func write(id: String, image: String, time: String) 
}

class LRUManager: LRUTemplate {
  var buffer: [Image] = []
  var buffer_length = 5
  // Read and update the priority of the image
  func read(id: String) -> Image? {
    if let index = buffer.firstIndex(where: { $0.id == id }) {
      let cache = buffer[index]
      buffer.remove(at: index)
      buffer.append(cache)
      return cache
    }
    print("Data not found in cache!!!")
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
    let msg = Image(id: id, image: image, time: time)
    buffer.append(msg)
  }
}


class TestLRUManager: LRUTemplate {
  var buffer: [Image] = []
  var buffer_length = 5
  // Read and update the priority of the image
  func read(id: String) -> Image? {
    print("You're in test dude!")
    return nil
    }

  // Write the image
  func write(id: String, image: String, time: String) {
    print("Write-uh!")
    return
  }
}

class LoadImage {
  let cache: LRUTemplate
  init(cache: LRUTemplate) {
    self.cache = cache
  }
  func disp_data(id: String) {
    if let data = cache.read(id: id) {
      print(data)
    }
    else {
      print("Data unfortunately not found my boy!")
    }
  }
}

var a = LoadImage(cache: LRUManager())
a.disp_data(id: "1")
