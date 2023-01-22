//: [Previous](@previous)

import Foundation

// 문자열 str1, str2가 매개변수로 주어집니다.
// str1 안에 str2가 있다면 1을 없다면 2를 return하도록 solution 함수를 완성해주세요.
func removeStr(_ str1: String, _ str2: String) -> Int{
    return str1.contains(str2) ? 1 : 2
}

removeStr("ab6CDE443fgh22iJKlmn1o", "6CD") // 1
removeStr("ppprrrogrammers", "pppp") // 2
//: [Next](@next)
