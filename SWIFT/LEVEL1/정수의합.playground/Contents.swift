import Foundation

//문제 설명
//두 정수 a, b가 주어졌을 때 a와 b 사이에 속한 모든 정수의 합을 리턴하는 함수, solution을 완성하세요.
//예를 들어 a = 3, b = 5인 경우, 3 + 4 + 5 = 12이므로 12를 리턴합니다.

func solution(_ a:Int, _ b:Int) -> Int64 {
    var answer = 0
    for i in (a>b ? b...a : a...b) {
        answer += i
    }
    return Int64(answer)
}

func solution2(_ a:Int, _ b:Int) -> Int64 {
    return Int64((a>b ? b...a : a...b).reduce(0, +))
}
