import Foundation

func solution(_ n:Int) -> Int{
    var answer = 0
    var count = n
    while count > 0 {
        answer += count % 2
        count = count % 2 == 0 ? count / 2 : count - 1
    }

    return answer
}
solution(5000)
