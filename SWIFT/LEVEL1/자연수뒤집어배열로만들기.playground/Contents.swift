import UIKit

//문제 설명
//자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.

func solution(_ n:Int64) -> [Int] {
    var array: [Int] = []
    for i in String(n) {
        array.append(Int(String(i))!)
    }
    return array.reversed()
}
