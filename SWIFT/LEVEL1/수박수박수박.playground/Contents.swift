import Foundation

//문제 설명
//길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.
//
//제한 조건
//n은 길이 10,000이하인 자연수입니다

func solution(_ n:Int) -> String {
    var answer = ""
    var count = n
    while count > 0 {
        if count == 1 {
            count = count - 1
            answer.append("수")
        } else {
            count = count - 2
            answer.append("수박")
        }
    }
    
    return answer
}
solution(0)
solution(1)
solution(2)
solution(3)

func solution2(_ n:Int) -> String {
    return (0..<n).map{($0 % 2 == 0) ? "수" : "박"}.reduce("", +)
}
solution2(3)
