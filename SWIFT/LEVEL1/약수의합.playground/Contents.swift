import UIKit
//
//문제 설명
//정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.
//
//제한 사항
//n은 0 이상 3000이하인 정수입니다.

func solution(_ n:Int) -> Int {
    var answer = 0
    if n == 0 {
        answer == 0
    } else {
        for i in 1...n {
            answer += n % i == 0 ? i : 0
        }
    }
    return answer
}

func solution2(_ n:Int) -> Int {
    guard n != 0 else {
        return 0
    }
    return Array(1...n).filter{ n % 0 == 0}.reduce(0, +)
}
