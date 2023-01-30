//: [Previous](@previous)

import Foundation

//중앙값은 어떤 주어진 값들을 크기의 순서대로 정렬했을 때 가장 중앙에 위치하는 값을 의미합니다.
//예를 들어 1, 2, 7, 10, 11의 중앙값은 7입니다.
//정수 배열 array가 매개변수로 주어질 때, 중앙값을 return 하도록 solution 함수를 완성해보세요.
func getMedian(_ array: [Int]) -> Int {
    let arr = array.sorted(by: <)
    return arr[arr.count / 2]
}

getMedian([1, 2, 7, 10, 11])

//최빈값은 주어진 값 중에서 가장 자주 나오는 값을 의미합니다.
//정수 배열 array가 매개변수로 주어질 때, 최빈값을 return 하도록 solution 함수를 완성해보세요.
//최빈값이 여러 개면 -1을 return 합니다.
func getFrequent(_ array: [Int]) -> Int {
    let sorted = Dictionary(grouping: array) { $0 }.sorted { $0.value.count > $1.value.count }
    return sorted.count > 1 && sorted[0].value.count == sorted[1].value.count ? -1 : sorted[0].key
}

func getFrequent2(_ array:[Int]) -> Int {
    var counter: [Int: Int] = [:]
    array.forEach { counter[$0] = (counter[$0] ?? 0) + 1 }
    
    let result = counter.filter { $0.value == counter.values.max() }
    return result.count == 1 ? result.first!.key : -1
}

getFrequent([1, 2, 3, 3, 3, 4])
getFrequent([1, 1, 2, 2])
getFrequent([1])

//머쓱이네 옷가게는 10만 원 이상 사면 5%, 30만 원 이상 사면 10%, 50만 원 이상 사면 20%를 할인해줍니다.
//구매한 옷의 가격 price가 주어질 때, 지불해야 할 금액을 return 하도록 solution 함수를 완성해보세요.
func discountPrice(_ price:Int) -> Int {
    if price >= 500000 {
        return Int((Double(price) * Double(0.8)))
    } else if price >= 300000 {
        return Int((Double(price) * Double(0.9)))
    } else if price >= 100000 {
        return Int((Double(price) * Double(0.95)))
    } else {
        return price
    }
}
discountPrice(150000)
discountPrice(580000)

// 두 배열이 얼마나 유사한지 확인해보려고 합니다.
// 문자열 배열 s1과 s2가 주어질 때 같은 원소의 개수를 return하도록 solution 함수를 완성해주세요.
func findSimilarity(_ s1: [String], _ s2: [String]) -> Int {
    return s1.filter{s2.contains($0)}.count
}

findSimilarity(["a", "b", "b", "c"], ["com", "b", "d", "p", "c"])
//findSimilarity(["n", "omg"], ["m", "dot"])

// 순서쌍이란 두 개의 숫자를 순서를 정하여 짝지어 나타낸 쌍으로 (a, b)로 표기합니다.
// 자연수 n이 매개변수로 주어질 때 두 숫자의 곱이 n인 자연수 순서쌍의 개수를 return하도록 solution 함수를 완성해주세요.
func getPairNumber(_ n: Int) -> Int {
    var n2 = 0
    for i in 1...n {
        if n % i == 0 {
            n2 += 1
        }
    }
    return n2
}
getPairNumber(20)
func getPairNumber2(_ n: Int) -> Int { (1...n).filter { n % $0 == 0 }.count }

func getPairNumber3(_ n:Int) -> Int {
    let root = Int(sqrt(Double(n)))
    var answer = (1...root).filter { n % $0 == 0 }.count
    answer *= 2
    if root * root == n {
        answer -= 1
    }
    return answer
}

// 정수 n이 매개변수로 주어질 때 n의 각 자리 숫자의 합을 return하도록 solution 함수를 완성해주세요
func addEachNum(_ n: Int) -> Int {
    var input = n
    var answer = 0
    
    while input > 0 {
        answer += input % 10
        input /= 10
    }
    return answer
}
addEachNum(1234)

func addEachNum2(_ n: Int) -> Int {
    let array = Array(String(n))
    return array.reduce(0) { Int(String($0))! + Int(String($1))!}
}

//머쓱이는 구슬을 친구들에게 나누어주려고 합니다.
//구슬은 모두 다르게 생겼습니다.
//머쓱이가 갖고 있는 구슬의 개수 balls와 친구들에게 나누어 줄 구슬 개수 share이 매개변수로 주어질 때,
//balls개의 구슬 중 share개의 구슬을 고르는 가능한 모든 경우의 수를 return 하는 solution 함수를 완성해주세요.

func findprob(_ balls: Int, _ share: Int) -> Int {
    func factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }
    let numer = factorial(balls)
    let denom = factorial(balls - share) * factorial(share)
    
    return denom != 0 && balls > share ? numer / denom : 1
}

func findprob2(_ balls: Int, _ share: Int) -> Int {
    func dfs(_ n : Int, _ r: Int) -> Int {
        if n == r { return 1 }
        
        if r == 1 { return n }
        
        return dfs(n-1, r-1) + dfs(n-1, r)
    }
    return dfs(balls, share)
}

//정수 배열 emergency가 매개변수로 주어질 때
//응급도가 높은 순서대로 진료 순서를 정한 배열을 return하도록 solution 함수를 완성해주세요.

func findPriority(_ emergency:[Int]) -> [Int] {
    let arr = emergency.sorted(by: >)
    print(arr)
    var answer: [Int] = []
    for i in 0...(emergency.count - 1){
        print("i: \(emergency[i]) arr[i]: \(arr.firstIndex(of: emergency[i])!)")
        answer.append( Int( arr.firstIndex(of: emergency[i])! ) + 1)
    }
    return answer
}

func findPriority2(_ emergency:[Int]) -> [Int] {
    var answer: [Int] = []
    
    for tmp in emergency {
        answer.append(emergency.filter { $0 > tmp }.count + 1)
    }
    
    return answer
}

//findPriority([1, 2, 3, 4, 5, 6, 7])
findPriority([10, 76, 24])

// 머쓱이는 친구들과 동그랗게 서서 공 던지기 게임을 하고 있습니다. 공은 1번부터 던지며 오른쪽으로 한 명을 건너뛰고 그다음 사람에게만 던질 수 있습니다. 친구들의 번호가 들어있는 정수 배열 numbers와 정수 K가 주어질 때, k번째로 공을 던지는 사람의 번호는 무엇인지 return 하도록 solution 함수를 완성해보세요.

func checkNumber(_ numbers: [Int], _ k: Int) -> Int {
    var idx: Int = 2 * (k - 1)
    if idx > numbers.count {
        let denom = idx / numbers.count
        idx = idx - (numbers.count * denom)
    }
    
    return numbers[idx]
}
checkNumber([1,2,3,4,5], 1)
checkNumber([1,2,3,4,5], 2)
checkNumber([1,2,3,4,5], 3)
checkNumber([1,2,3,4,5], 4)
checkNumber([1,2,3,4,5], 5)
checkNumber([1,2,3,4,5], 6)


//: [Next](@next)
