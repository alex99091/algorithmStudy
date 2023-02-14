//옹알이 (2)
//문제 설명
//머쓱이는 태어난 지 11개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음과 네 가지 발음을 조합해서 만들 수 있는 발음밖에 하지 못하고 연속해서 같은 발음을 하는 것을 어려워합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.

import Foundation

func solution(_ babbling:[String]) -> Int {
    let canSay = ["aya", "ye", "woo", "ma"]
    var count = 0
    for i in babbling {
        var result = ""
        var lastWord = ""
        let split = ArraySlice(i)
        for s in split {
            result.append(s)
            if canSay.contains(result) && result != lastWord {
                lastWord = result
                result = ""
            }
        }
        if result.isEmpty {
            count += 1
        }
    }
    return count
}

solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])
