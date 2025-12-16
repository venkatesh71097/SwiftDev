
class Node {
  var key: Int, val: Int
  var prev: Node? var next: Node?
  init(_ k: Int, _ v: Int) {
    key=k 
    val = v
  }
}

"""
Mindmap: 

(EXIT)                                                   (ENTRANCE)
[HEAD] <---> [Oldest] <---> [Middle] <---> [Newest] <---> [TAIL]
               ^                              ^
               |                              |
        Get kicked out                Gets added here
        if full (LRU)                     (MRU)
"""
class LRUCache {
  var cap: Int
  var map = [Int: Node]()
  // Sentinel nodes...
  var head = Node(0,0)
  var tail = Node(0,0)

  init(_ capacity: Int) {
    cap = capacity
    head.next = tail
    tail.prev = head
  }

  // We need 4 functions... a) insert , b ) remove , c) put , d) get
  // head - [n] - tail 
  // you need to basically do the control transfer by unlinking the node n itself
  func remove(_ n: Node) {
    n.prev?.next = n.next
    n.next?.prev = n.prev
  }

  func insert(_ n: Node) {
    // head - ..... - tail
    // I need to insert it close to the tail - so all transformations near tail 
    // you get the final real element and store it as prev. The next element of final real will make the new element as final element
    // Since it's a DLL, you need to point backward too... at the same time, you need to do n.next and tail.prev too! Pretty much same DLL
    let prev = tail.prev!
    // Pair
    prev.next = n
    n.prev = prev
    // Pair
    n.next = tail
    tail.prev = n
  }

  func get(_ key: Int, _ val: Int) -> Int {
    // When you retrieve, you have to put it as the latest node as you just retrieved. 
    // All the mapping of key-value is stored in map cache. Once you try to retrieve something, you're gonna make it as the most recently used (near head)
    // So, removal happens from the end, insertion happens from the start - so you're good! 
    if let n = map[key] {
      remove(n)
      insert(n)
      return n.val
    }
    return -1
  }

  func put(_ key: Int, val: Int) {
    // I need to put an element now - if it already exists, just delete the existing element. Even otherwise, continue with following steps: 
    // instantiate a node and then insert into the map as well as near the tail 
    // you need to be cognizant of the capacity. If the capacity is crossed by map count, then you need to remove the element right after the dummy first element which is head
    // Just point the deleted entry to nil! 
    if let n = map[key] {
      remove(n)
    }
    let n = Node(key, val) 
    // map is the cache map!
    map[key] = n
    insert(n)
    if map.count > cap {
      let lru = head.next! // Least recently used element
      remove(lru)
      map[lru.key] = nil
    }
  }
}
