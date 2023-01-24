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

문자열 my_string이 매개변수로 주어집니다.
my_string은 소문자, 대문자, 자연수로만 구성되어있습니다.
my_string안의 자연수들의 합을 return하도록 solution 함수를 완성해주세요.


//: [Next](@next)
