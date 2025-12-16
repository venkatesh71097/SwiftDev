// Making return type of Float optional - that way, we can return Float as well as Nil (Python's None)
func division(n: Float, factor: Float) -> Float? {
  guard factor != 0 else {
    print("Zero division error")
    return nil
  }
  return n / factor
}

var x = division(n: 10, factor: 2)
print("Output is \(x)")

// func division(n: Float, factor: Float) -> Float {
//   guard factor != 0 else {
//     return 0 // making it zero for ZeroDivisionError
//   }
//   return n / factor
// }

// var x = division(n: 10, factor: 2) 
// print("Output is \(x)")
