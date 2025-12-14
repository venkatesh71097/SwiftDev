import Foundation

func cosine(_ v1: [Double], _ v2: [Double]) -> Double{
  guard v1.count == v2.count, !v1.isEmpty else {
    return 0.0
  }

  var dotpdt: Double = 0.0
  var mag_a: Double = 0.0
  var mag_b: Double = 0.0

  for i in 0..<v1.count{
    dotpdt += v1[i] * v2[i]
    mag_a += v1[i] * v1[i]
    mag_b += v2[i] * v2[i]
  }

  let denominator = sqrt(mag_a) * sqrt(mag_b)
  if denominator == 0{
    return 0.0
  }
  return dotpdt / denominator
}


var v1: Array = [1.0,2.0,3.0,4.0,5.0]
var v2: Array = [5.0,6.0,7.0,8.0,9.0]

var val = cosine(v1, v2)
print(val)