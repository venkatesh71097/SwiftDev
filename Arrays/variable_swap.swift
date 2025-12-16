func swapping<T>(_ first: inout T, _ second: inout T) {
  var temp = first
  first = second
  second = temp
}

var x = 5
var y = 10

var a = "Alice"
var b = "Bob"

swapping(&x, &y)
print("Swapped values of x and y: \(x) and \(y)")
swapping(&a, &b)
print("Swapped values of a and b: \(a) and \(b)")
