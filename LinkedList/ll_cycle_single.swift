import Foundation
//Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head?.next
    // Python : null, Swift : nil
    while slow != nil, fast != nil {
        // Practicing guard - guard helps avoid a truckload of nessting, hence trying out guard - more like gate-check for it to continue
        guard slow !== fast else {
            return true
        }
        slow = slow?.next
        fast = fast?.next?.next
        
        // Practicing if...
        // if slow !== fast {
        //     slow = slow?.next
        //     fast = fast?.next?.next
        // } else {
        //     return true
        // }
    }
    return false
    
}
