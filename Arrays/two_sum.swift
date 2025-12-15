import Foundation

func twosum(_ nums: [Int], _ target: Int) -> [Int] {
  var dict = [Int: Int]()
  for (i, num) in nums.enumerated() {
      // If num is in dict already, hit the first block
      if let addent = dict[num] {
          return [addent, i]
      // If not, please create a new entry in the dict
      } else {
          dict[target - num] = i
      }
  }
  return []
}

var nums: [Int] = [2,7,11,15] // For list (ahem ahem, call it array man!), provide the dtypes for Static Typing...
var target: Int = 9
var val = twosum(nums, target)
print("Two sum value is: \(val)")
