import UIKit

//문제 설명
//정수를 담고 있는 배열 arr의 평균값을 return하는 함수, solution을 완성해보세요.

func solution(_ arr:[Int]) -> Double {
    var answer = 0
    for i in arr {
        answer += i
    }
    return  Double(answer) / Double(arr.count)
}

func solution2(_ arr:[Int]) -> Double {
    return  Double(arr.reduce(0,+)/Double(arr.count))
}
