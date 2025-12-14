import Foundation

func cosine(_ v1: [Float], _ v2: [Float]) -> Float{
  guard v1.count == v2.count, !v1.isEmpty else {
    return 0.0
  }

  var dotpdt: Float = 0.0
  var mag_a: Float = 0.0
  var mag_b: Float = 0.0

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


var v1: [Float] = [1.0,2.0,3.0,4.0,5.0]
var v2: [Float] = [5.0,6.0,7.0,8.0,9.0]

var val = cosine(v1, v2)
print("The cosine similarity is: \(val)")