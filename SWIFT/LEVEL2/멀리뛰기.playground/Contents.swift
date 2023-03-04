import Foundation

// 시간초과
func solution(_ n:Int) -> Int {
    let elements: [Int] = [1, 2]
    var count = 0
    
    var stack: [(remainingSum: Int, partial: [Int])] = []
    stack.append((remainingSum: n, partial: []))
    
    while !stack.isEmpty {
        let (remainingSum, partial) = stack.removeLast()
        
        if remainingSum == 0 {
            count += 1
        } else {
            for element in elements {
                if remainingSum - element >= 0 {
                    let newPartial = partial + [element]
                    stack.append((remainingSum - element, newPartial))
                }
            }
        }
    }
    return count % 1234567
}

solution(4)


// 시간초과
func solution2(_ n: Int) -> Int {
    var memo: [Int: Int] = [:]

    if let result = memo[n] {
        return result
    }
    
    if n == 0 {
        return 1
    }
    
    let elements: [Int] = [1, 2]
    var count = 0
    
    for element in elements {
        if n - element >= 0 {
            count += solution2(n - element) % 1234567
        }
    }
    
    memo[n] = count % 1234567
    
    return memo[n]!
}

solution2(4)
