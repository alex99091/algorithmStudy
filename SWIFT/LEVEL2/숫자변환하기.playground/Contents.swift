/* 숫자 변환하기
 문제 설명
 자연수 x를 y로 변환하려고 합니다. 사용할 수 있는 연산은 다음과 같습니다.
 
 x에 n을 더합니다
 x에 2를 곱합니다.
 x에 3을 곱합니다.
 자연수 x, y, n이 매개변수로 주어질 때, x를 y로 변환하기 위해 필요한 최소 연산 횟수를 return하도록 solution 함수를 완성해주세요. 이때 x를 y로 만들 수 없다면 -1을 return 해주세요. */

import Foundation


func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    let dividedNum = Double(y) / Double(x)
    
    if ceil(dividedNum) == dividedNum {
        let temp = gcd(Int(dividedNum), 6)
        print(temp)
    }
    
    let result = gcd(x,y)
    print(result)
    
    
    return 0
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var x = a
    var y = b
    while y != 0 {
        let r = x % y
        x = y
        y = r
    }
    return x
}


solution(10, 40, 5)
solution(10, 40, 30)
solution(2, 5, 4)
