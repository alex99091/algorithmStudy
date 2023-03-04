import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    for i in 0..<sorted.count {
        if i >= sorted[i] {
            return i
        }
    }
    return sorted.count
}


solution([3, 0, 6, 1, 5])
