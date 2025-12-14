import Foundation

// Built a router enumerator to ensure it's classified in one of the 3 buckets: Local Proc, Cloud Proc, Rejected to Process

enum Route {
  case local
  case cloud
  case reject(reason: String)
}

"""
Program to route the cloud vs local processing of a model to determine if processing should be done on-device or cloud in the best interest of latency, performance, privacy (With redaction of PII data) etc. 
"""

func decideRoute(_ battery: Int, _ wifi: Bool, _ complexity: Float) -> Route {
  if battery < 10 {
    return .reject(reason: "Plug your device to the charger and wait until it becomes > 15% before you try again!")
  }
  if battery < 20 {
    return .local
  }

  if complexity > 0.8 {
    if wifi{
      return .cloud
    }
    else {
      return .reject(reason: "Needs Cloud Processing as it's a complex query")
    }
  }
  return .local
}

let val = decideRoute(30, true, 0.82)
print("The route taken by router: \(val)")