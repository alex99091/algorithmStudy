/*문제 설명
 경화는 과수원에서 귤을 수확했습니다. 경화는 수확한 귤 중 'k'개를 골라 상자 하나에 담아 판매하려고 합니다. 그런데 수확한 귤의 크기가 일정하지 않아 보기에 좋지 않다고 생각한 경화는 귤을 크기별로 분류했을 때 서로 다른 종류의 수를 최소화하고 싶습니다.
 
 예를 들어, 경화가 수확한 귤 8개의 크기가 [1, 3, 2, 5, 4, 5, 2, 3] 이라고 합시다. 경화가 귤 6개를 판매하고 싶다면, 크기가 1, 4인 귤을 제외한 여섯 개의 귤을 상자에 담으면, 귤의 크기의 종류가 2, 3, 5로 총 3가지가 되며 이때가 서로 다른 종류가 최소일 때입니다.
 
 경화가 한 상자에 담으려는 귤의 개수 k와 귤의 크기를 담은 배열 tangerine이 매개변수로 주어집니다. 경화가 귤 k개를 고를 때 크기가 서로 다른 종류의 수의 최솟값을 return 하도록 solution 함수를 작성해주세요. */

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    let counts = tangerine.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let uniqueCounts = Array(Set(tangerine)).compactMap { ($0, counts[$0]!) }
    let countsDict = Dictionary(uniqueKeysWithValues: uniqueCounts)
    var count = 0
    var sum = 0
    for (key, value) in countsDict.sorted(by: { $0.value > $1.value }) {
        print("key - \(key), value - \(value)")
        sum += value
        count += 1
        if sum >= k { break }
    }
    
    return count
}

func solution2(_ k:Int, _ tangerine:[Int]) -> Int {
    let countsDict = Dictionary(grouping: tangerine, by: { $0 })
        .mapValues { $0.count }
    let sortedCountsDict = countsDict.sorted(by: { $0.value > $1.value })
    
    var count = 0
    var sum = 0
    for (_, value) in sortedCountsDict {
        sum += value
        count += 1
        if sum >= k { break }
    }
    
    return count
}

func solution3 (_ k: Int, _ tangerine: [Int]) -> Int {
    return Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
        .reduce((0, 0)) { acc, array in acc.1 >= k ? acc : (acc.0 + 1, acc.1 + array.count) }
        .0
}

solution2(6, [1, 3, 2, 5, 4, 5, 2, 3])
