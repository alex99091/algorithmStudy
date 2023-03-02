import Foundation


func solution(_ n:Int) -> Int {
    return fabonacci2(n) % 1234567
}

// 재귀호출은 n이 50이상일때 런타임 에러가 발생 (재귀 호출할 수 있는 횟수 제한)
func fabonacci(_ n: Int) -> Int {
    if n >= 2 {
        return fabonacci(n - 1) + fabonacci(n - 2)
    }
    return n
}

// 캐쉬에 저장: 동적계획법
func fabonacci2(_ n: Int) -> Int {
    var cache: [Int] = [0, 1]
    for number in 2...n {
        let preventOverflow = (cache[number - 1] + cache[number - 2]) % 1234567
        cache.append(preventOverflow)
    }
    return cache[n] % 1234567
}

solution(70)
