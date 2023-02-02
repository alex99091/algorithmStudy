//내적
//문제 설명
//길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다. a와 b의 내적을 return 하도록 solution 함수를 완성해주세요.
//
//이때, a와 b의 내적은 a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 입니다. (n은 a, b의 길이)

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    for i in 0..<a.count {
        answer += a[i] * b[i]
    }
            
    return answer
}

func solution2(_ a:[Int], _ b:[Int]) -> Int {
    return (0..<a.count).map {a[$0] * b[$0]}.reduce(0, +)
}

func solution3(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
}

