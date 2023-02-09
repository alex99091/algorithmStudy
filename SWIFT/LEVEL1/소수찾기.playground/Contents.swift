//소수 찾기
//1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
//
//소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
//(1은 소수가 아닙니다.)
//
//제한 조건
//n은 2이상 1000000이하의 자연수입니다.

import Foundation

func solution(_ n:Int) -> Int {
    var sum = 0
    for i in 2...n {
        if isPrime(i) == true {
            sum += 1
        }
    }
    return sum
}

// 소수인지 확인하려면 모든 2부터 sqrt(n)까지를 소수로 나누어 약수가 없어야한다.
func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}


func solution2(_ n:Int) -> Int {
    var isPrimeArray = Array(repeating: true, count: n + 1)
    var primeCount = 0

    isPrimeArray[0] = false
    isPrimeArray[1] = false
    for i in 0...n {
        if isPrimeArray[i] {
            for j in stride(from: i * 2, through: n, by: i) {
                isPrimeArray[j] = false
            }
            primeCount += 1
        }
    }

    return primeCount
}
