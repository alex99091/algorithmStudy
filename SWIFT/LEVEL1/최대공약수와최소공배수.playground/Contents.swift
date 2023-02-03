//최대공약수와 최소공배수
//문제 설명
//두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다. 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [GCD(n,m), LCM(n,m)]
}

// 최대공약수
// A = gcd * a, B = gcd * b
func GCD(_ a:Int, _ b:Int) -> Int {
    let maxN = max(a,b)
    let minN = min(a,b)
    var temp: [Int] = []
    
    for i in 1...minN {
        if minN % i == 0 {
            temp.append(i)
        }
    }
    
    var result = 1
    for i in temp {
        if maxN % i == 0 {
            if i > result {
                result = i
            }
        }
    }
    return result
}
// 최소공배수
// A = gcd * a, B = gcd * b -> LCM = gcd * a * b
func LCM(_ a:Int, _ b: Int) -> Int {
    return a * b / GCD(a,b)
}
solution(3,12)
solution(2,5)
solution(20,16)

