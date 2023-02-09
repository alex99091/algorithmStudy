//소수 만들기
//문제 설명
//주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    let list = combThree(nums)
    var target = [Int]()
    for i in list { target.append(i.reduce(0,+)) }
    for i in target {
        if isPrime(i) == true {
            answer += 1
        }
    }
    return answer
}

// 3개로 조합해주는 함수
func combThree(_ target:[Int]) -> [[Int]] {
    var result = [[Int]]()
    if target.count < 3 { return result }
    
    func combination(_ index: Int, _ newCombi: [Int]) {
        if newCombi.count == 3 {
            result.append(newCombi)
            return
        }
        for i in index..<target.count {
            combination(i + 1, newCombi + [target[i]])
        }
    }
    combination(0, [])
    
    return result
}

// 소수인지 확인하는 함수
func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}
