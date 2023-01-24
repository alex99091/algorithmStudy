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

//문제 설명
//머쓱이네 양꼬치 가게는 10인분을 먹으면 음료수 하나를 서비스로 줍니다. 양꼬치는 1인분에 12,000원, 음료수는 2,000원입니다. 정수 n과 k가 매개변수로 주어졌을 때, 양꼬치 n인분과 음료수 k개를 먹었다면 총얼마를 지불해야 하는지 return 하도록 solution 함수를 완성해보세요.
//
//제한사항
//0 < n < 1,000
//n / 10 ≤ k < 1,000
//서비스로 받은 음료수는 모두 마십니다.
//입출력 예
//n    k    result
//10    3    124,000
//64    6    768,000
//입출력 예 설명
//입출력 예 #1
//
//10인분을 시켜 서비스로 음료수를 하나 받아 총 10 * 12000 + 3 * 2000 - 1 * 2000 = 124,000원입니다.
//입출력 예 #2
//
//64인분을 시켜 서비스로 음료수를 6개 받아 총 64 * 12000 + 6 * 2000 - 6 * 2000 =768,000원입니다.

func bills(_ n: Int, _ k: Int) -> Int {
    var sum: Int = 0
    sum += n * 12000
    sum += (k - (n / 10)) * 2000
    
    return sum
}
bills(10,3)
bills(64,6)

//머쓱이네 피자가게는 피자를 일곱 조각으로 잘라 줍니다.
//피자를 나눠먹을 사람의 수 n이 주어질 때, 모든 사람이 피자를 한 조각 이상 먹기 위해 필요한 피자의 수를
//return 하는 solution 함수를 완성해보세요.

func pizza1 (_ n: Int) -> Int {
    if n <= 7 {
            return 1
        } else if n % 7 == 0 {
            return n / 7
        } else {
            return n / 7 + 1
        }
}
func pizza2(_ n: Int) -> Int { n / 7 + (n % 7 > 0 ? 1 : 0) }
    
//머쓱이는 추운 날에도 아이스 아메리카노만 마십니다.
//아이스 아메리카노는 한잔에 5,500원입니다.
//머쓱이가 가지고 있는 돈 money가 매개변수로 주어질 때,
//머쓱이가 최대로 마실 수 있는 아메리카노의 잔 수와 남는 돈을 순서대로 담은 배열을 return 하도록 solution 함수를 완성해보세요.

func changes(_ money: Int) -> [Int] {
    
    return [(money / 5500), (money % 5500)]
}

print("-------------------")
// 어떤 자연수를 제곱했을 때 나오는 정수를 제곱수라고 합니다.
// 정수 n이 매개변수로 주어질 때, n이 제곱수라면 1을 아니라면 2를 return하도록 solution 함수를 완성해주세요.
func checkSquaredDouble(_ n: Int) -> Int {
    let rootNum = sqrt(Double(n))
    return rootNum - Double(Int(rootNum)) == 0 ? 1 : 2
}
//checkSquaredDouble(144)
checkSquaredDouble(976)


