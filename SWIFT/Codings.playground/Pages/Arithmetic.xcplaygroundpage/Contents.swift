//: [Previous](@previous)

import Foundation

func add(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2;
}

func subtract(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}

func multiply(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

func divide(_ num1: Int, _ num2: Int) -> Int {
    return Int(num1 / num2)
}

func divide2(_ num1: Int, _ num2: Int) -> Int {
    return Int(num1 % num2)
}

print(add(5,7))
print(divide(3,17))
print(divide(17,3))
print(divide2(17,9))

func angleSolution(_ angle: Int) -> Int {
    if angle > 0 && angle < 90 {
        return 1
    } else if angle == 90 {
        return 2
    } else if angle < 180 {
        return 3
    } else {
        return 4
    }
}

print(angleSolution(150))

func double(_ numbers:[Int]) -> [Int] {
    var answer: [Int] = []
    for idx in 0...(numbers.count - 1) {
        answer.append(numbers[idx] * 2)
    }
    return answer
}

// 정수 n이 주어질 때, n이하의 짝수를 모두 더한 값을 return 하도록 solution 함수를 작성해주세요.
// 1.
print("&*****&")
func addEvenNums(_ n: Int) -> Int {
    
    var sum: Int = 0
    
    for i in 1...n where i % 2 == 0 {
        sum += i
    }
    return sum
}
// 2.
func addEvenNums2(_ n: Int) -> Int { (0...n).filter { $0 % 2 == 0 }.reduce(0, +) }

print(addEvenNums(10))

//정수 배열 numbers가 매개변수로 주어집니다. numbers의 원소의 평균값을 return하도록 solution 함수를 완성해주세요.
//
//제한사항
//0 ≤ numbers의 원소 ≤ 1,000
//1 ≤ numbers의 길이 ≤ 100
//정답의 소수 부분이 .0 또는 .5인 경우만 입력으로 주어집니다.
//
//입출력 예
//numbers    result
//[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]    5.5
//[89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]    94.0

func averageNumbers(_ numbers: [Int]) -> Double {
    var sum: Int = 0
    for i in 0...(numbers.count - 1) {
        sum += numbers[i]
    }
    
    return Double(sum)/(Double(numbers.count))
}
print(averageNumbers([1,2,3,4,5,6,7,8,9,10,11,12]))

//: [Next](@next)
