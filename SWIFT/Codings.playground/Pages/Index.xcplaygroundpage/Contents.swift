//: [Previous](@previous)

import Foundation

//정수 배열 array가 매개변수로 주어질 때,
//가장 큰 수와 그 수의 인덱스를 담은 배열을 return 하도록 solution 함수를 완성해보세요.

//func findBiggestNumAndIndex(_ array: [Int]) -> [Int] {
//    return [array.max()!, array.index(of: array.max()!)!]
//}
//findBiggestNumAndIndex([9, 10, 11, 8])

//정수가 담긴 배열 numbers와 문자열 direction가 매개변수로 주어집니다.
//배열 numbers의 원소를 direction방향으로 한 칸씩 회전시킨 배열을 return하도록 solution 함수를 완성해주세요.
func changeArraybyDirection(_ numbers: [Int], _ direction: String) -> [Int]{
    var answer = numbers
    if direction == "right" {
        answer.insert(answer.removeLast(), at: 0)
    } else {
        answer.insert(answer.removeFirst(), at: answer.count)
    }
    return answer
}
func changeArraybyDirection2(_ numbers: [Int], _ direction: String) -> [Int]{
    var answer = numbers
    direction == "right" ? answer.insert(answer.removeLast(), at: 0) : answer.insert(answer.removeFirst(), at: answer.count)
    return answer
}
changeArraybyDirection([1, 2, 3], "right")
changeArraybyDirection([1, 2, 3], "left")
//changeArraybyDirection([455, 6, 4, -1, 45, 6, 4], _direction: "left")

//우주여행을 하던 머쓱이는 엔진 고장으로 PROGRAMMERS-962 행성에 불시착하게 됐습니다.
//입국심사에서 나이를 말해야 하는데, PROGRAMMERS-962 행성에서는 나이를 알파벳으로 말하고 있습니다.
//a는 0, b는 1, c는 2, ..., j는 9입니다. 예를 들어 23살은 cd, 51살은 fb로 표현합니다.
//나이 age가 매개변수로 주어질 때 PROGRAMMER-962식 나이를 return하도록 solution 함수를 완성해주세요.

func translateAge(_ age: Int) -> String {
    var answer: String = ""
    //    let temp: String = "abyz"
    //     a : 97, z : 122
    //    for unit in temp.utf8 {
    //        print(Int(unit) - 96)
    //    }
    var changeArr: [Int] = []
    for i in String(age) {
        changeArr.append(Int(String(i))! + 97 )
    }
    for i in changeArr {
        if let i = UnicodeScalar(i){
            //            print(UnicodeScalar(i))
            answer.append(String(UnicodeScalar(i)))
        }
    }
    //    print(changeArr)
    
    return answer
}
func translateAge2(_ age: Int) -> String {
    var answer = ""
    let startAscii = Character("a").asciiValue!
    String(age).forEach {
        answer.append(String(UnicodeScalar(startAscii + UInt8(String($0))!)))
    }
    return answer
}
translateAge(23)
translateAge2(23)

//정수 배열 numbers가 매개변수로 주어집니다.
//numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.

//func findMaxNumber(_ numbers:[Int]) -> Int {
//    var numbers = numbers.sorted()
//
//    return max(numbers[0] * numbers[1], numbers[numbers.count-1] * numbers[numbers.count - 2])
//}

//문자열 my_string과 정수 num1, num2가 매개변수로 주어질 때,
//my_string에서 인덱스 num1과 인덱스 num2에 해당하는 문자를 바꾼
//문자열을 return 하도록 solution 함수를 완성해보세요.

func changeIdxString(_ my_string: String, _ num1: Int, _ num2: Int) -> String {
    var arr: [String] = []
    var answer: String = ""
    for i in my_string{
        arr.append(String(i))
    }
    let temp = arr[num1] // temp = "e"
    arr[num1] = arr[num2] // [h,e,l,l,o] -> [h,l,l,l,o]
    arr[num2] = temp // [h,l,l,l,o] -> [h,l,e,l,o]
    for i in arr{
        answer.append(i)
    }
    return answer
}
func changeIdxString2(_ my_string: String, _ num1: Int, _ num2: Int) -> String {
    var arr = ArraySlice(my_string)
    arr.swapAt(num1, num2)
    return arr.map { String($0) }.joined()
}
changeIdxString("hello", 1, 2)

//정수 n이 매개변수로 주어질 때,
//n의 약수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.
func findAliquotPart(_ n: Int) -> [Int] {
    var answer: [Int] = []
    for i in 1...n {
        if n % i == 0 {
            answer.append(i)
        }
    }
    return answer.sorted()
}
func findAliquotPart2(_ n: Int) -> [Int] { (1...n).filter { n % $0 == 0 } }
findAliquotPart(24)

//정수 num과 k가 매개변수로 주어질 때,
//num을 이루는 숫자 중에 k가 있으면 num의 그 숫자가 있는 자리 수를 return하고 없으면 -1을
//return 하도록 solution 함수를 완성해보세요.

func findCompoNum(_ num: Int, _ k: Int) -> Int {
    let array = ArraySlice(String(num))
    var answer = 0
    for i in 0...(array.count - 1){
        if String(array[i]) == String(k) {
            answer = i + 1
            break
        }
    }
    return answer == 0 ? -1 : answer
}
findCompoNum(213,1)
findCompoNum(156,7)

//: [Next](@next)
