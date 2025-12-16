/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // guard nums.count > 0 else { return nil }
        if nums.count == 0 {
            return nil
        }
        let mid = nums.count / 2
        var node: TreeNode = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        return node
    }
}
