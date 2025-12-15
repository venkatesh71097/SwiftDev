import Foundation
func missingNumber(_ nums: [Int]) -> Int {
    var n = nums.count
    var exp_sum = (n * (n+1)) / 2
    var cur_sum = nums.reduce(0, +)
    return exp_sum - cur_sum
}

var nums: [Int] = [3,0,1]
var out = missingNumber(nums)
print("Missing number is: \(out)")
