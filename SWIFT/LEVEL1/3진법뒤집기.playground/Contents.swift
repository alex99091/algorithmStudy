import Foundation
//3진법 뒤집기
//문제 설명
//자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.

func solution(_ n:Int) -> Int {
    var str = ""
    var num = n
    var answer = 0
    while num != 0 {
        if num < 3 {
            str.append(String(num % 3))
            break
        } else {
            str.append(String(num % 3))
            num = num / 3
        }
    }
    let array = ArraySlice(str)
    print(array)
    for i in 0..<array.count {
        answer += Int(String(array[i]))! * Int(pow(Double(3),Double(array.count - i - 1)))
    }
    return answer
}
solution(0)
solution(1)
solution(2)
solution(3)

func solution2(_ n:Int) -> Int {
    let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer
    
}


