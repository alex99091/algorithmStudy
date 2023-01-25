//: [Previous](@previous)

import Foundation

//문자열 s가 매개변수로 주어집니다.
//s에서 한 번만 등장하는 문자를 사전 순으로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요.
//한 번만 등장하는 문자가 없을 경우 빈 문자열을 return 합니다.

func checkAppearedOnce(_ s: String) -> String {
    let array = ArraySlice(s).sorted()
    var dict: [String: Int] = [:]
    for i in array {
        if !dict.keys.contains(String(i)) {
            dict.updateValue(1, forKey: String(i))
        } else {
            let currentValue = dict[String(i)]
            dict.updateValue(currentValue! + 1, forKey: String(i))
        }
    }
    var answer: String = ""
    let sortedKeys = Array(dict.keys).sorted(by: <)
    for i in sortedKeys {
        if dict[i] == 1 {
            answer.append(i)
        }
    }
    return answer
}
checkAppearedOnce("abcabcadc")
checkAppearedOnce("abdc")
checkAppearedOnce("hello")

func checkAppearedOnce2(_ s: String) -> String {
    var dict: [String: Int] = [:]
    for str in s {
        if dict[String(str)] == nil {
            dict[String(str)] = 1
        } else {
            dict[String(str)]! += 1
        }
    }
    
    return dict.filter{$0.value == 1}.keys.map{String($0)}.sorted(by: <).joined()
}

//문자열 my_string이 매개변수로 주어집니다.
//my_string은 소문자, 대문자, 자연수로만 구성되어있습니다.
//my_string안의 자연수들의 합을 return하도록 solution 함수를 완성해주세요.

func findNumAndSum(_ my_string: String) -> Int {
    return my_string.split(whereSeparator: { !$0.isNumber }).reduce(0) { $0 + Int($1)! }
}
findNumAndSum("a1B2c34p")

// 이진수를 의미하는 두 개의 문자열 bin1과 bin2가 매개변수로 주어질 때,
// 두 이진수의 합을 return하도록 solution 함수를 완성해주세요.

func sumBinaryNum(_ bin1: Int, _ bin2: Int) -> Int {
    func binToTen(_ n: Int) -> Int {
        let array = ArraySlice(String(n))
        var result: Int = 0
        for i in 0...(array.count-1) {
            result += Int(String(array[i]))! * Int(pow(Double(2), Double(array.count - 1 - i)))
        }
        return result
    }
    func tenToBin(_ n: Int) -> Int {
        var i = n
        var str: String = ""
        while true {
            str.append(Character(String(i % 2)))
            i /= 2
            if(i == 1 || i == 0){
                str.append(Character(String(i % 2)))
                break
            }
        }
        return Int(String(str.reversed()))!
    }
    return Int(tenToBin(binToTen(bin1) + binToTen(bin2)))
}
sumBinaryNum(10, 11) // 101
sumBinaryNum(1001, 1111) // 11000

func sumBinaryNum2(_ bin1: String, _ bin2: String) -> String {
    
    func binToTen(_ n: Int) -> Int {
        let array = ArraySlice(String(n))
        var result: Int = 0
        for i in 0...(array.count-1) {
            result += Int(String(array[i]))! * Int(pow(Double(2), Double(array.count - 1 - i)))
        }
        return result
    }
    
    func tenToBin(_ n: Int) -> Int {
        var i = n
        var str: String = ""
        while true {
            str.append(Character(String(i % 2)))
            i /= 2
            if(i == 1 || i == 0){
                str.append(Character(String(i % 2)))
                break
            }
        }
        return Int(String(str.reversed()))!
    }
    
    let n1 = Int(bin1)!
    let n2 = Int(bin2)!
    let answer = tenToBin(binToTen(n1) + binToTen(n2))
    
    return String(answer)
}

//머쓱이는 행운의 숫자 7을 가장 좋아합니다. 정수 배열 array가 매개변수로 주어질 때,
//7이 총 몇 개 있는지 return 하도록 solution 함수를 완성해보세요.

func countSeven(_ array:[Int]) -> Int {
    return array.map{ String($0) }.joined().filter{$0 == "7"}.count
}




//: [Next](@next)
