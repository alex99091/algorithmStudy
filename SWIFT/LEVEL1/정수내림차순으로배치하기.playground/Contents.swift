//문제 설명
//함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.

import Foundation

func solution(_ n:Int64) -> Int64 {
    var array = ArraySlice(String(n))
    array.sort(by: >)
    var answer = ""
    for i in array {
        answer.append(i)
    }
    return Int64(answer)!
}

func solution2(_ n:Int64) -> Int64 {
    return Int64(String(Array(String(n)).sorted {$0 > $1}))!
}

solution(118372)
solution2(12345)
