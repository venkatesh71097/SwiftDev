import Foundation

struct SearchResult{
  let id: Int
  let score: Double
}
//Top k values - key value 
func sort_score(_ vals: [SearchResult], _ k: Int) -> [(Int, Double)] {
  let sorted_vals = vals.sorted {$0.score > $1.score}
  let top_k = Array(sorted_vals.prefix(k))
  //   return top_k.map { $0.id } - If you need only IDs to be printed -> Change return type to [Int]
  //   return top_k.map { $0.score } - If you need only Scores to be printed/returned -> Change return type to [Double]

  return top_k.map { ($0.id, $0.score) } 
}
let data = [
  SearchResult(id: 1, score: 90),
  SearchResult(id: 2, score: 78), 
  SearchResult(id: 3, score: 95),
  SearchResult(id: 4, score: 98),
]

let val = sort_score(data, 3)
print("Val is: \(val)")
