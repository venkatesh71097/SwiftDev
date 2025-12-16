class Person {
  var name: String
  
  init(name: String) {
    self.name = name
    print("\(name) is initialized")
  }
  // don't use () for deinit
  deinit {
    print("\(name) is deinitialized")
  }
}

var a: Person? = Person(name: "John")
var b: Person? = a

// Let's deinitialize
a = nil
b = nil
