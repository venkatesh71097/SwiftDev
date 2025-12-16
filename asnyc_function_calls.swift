import Foundation
// -> String can appear only after async - not before that! 
func func_a() async -> String {
  return "a"
}

func func_b() async -> String {
  return "b"
}

func loaddash() async {
  // If you don't use async (and just use await!), you're pretty much making it a blocking call before going to the next step!. 
  async let a = func_a()
  async let b = func_b()
  let (c, d) = await(a, b)
  print("C is: \(c) and D is: \(d)")
}
// Don't forget to use Task before calling loaddash() - it's a sync world and the function is async. 
Task {
  await loaddash()
}
