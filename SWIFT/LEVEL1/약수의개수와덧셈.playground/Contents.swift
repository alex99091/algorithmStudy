//약수의 개수와 덧셈
//문제 설명
//두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    // 약수의 개수가 홀수이려면 숫자 n은 루트 n을 가지고 있어야한다: 제곱수가 아니면 전부 페어를 이룸
    var sum = 0
    for i in left...right {
        sum += trunc(sqrt(Double(i))) == sqrt(Double(i)) ? -i : +i
    }
    return sum
}
solution(13,17)
