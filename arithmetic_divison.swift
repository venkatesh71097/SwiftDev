func division(n: Float, factor: Float) -> Float {
  guard factor != 0 else {
    return 0 // making it zero for ZeroDivisionError
  }
  return n / factor
}

var x = division(n: 10, factor: 2) 
print("Output is \(x)")
