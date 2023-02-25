//문자열 다루기 기본
//문제 설명
//문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성돼있는지 확인해주는 함수, solution을 완성하세요. 예를 들어 s가 "a234"이면 False를 리턴하고 "1234"라면 True를 리턴하면 됩니다.

import Foundation

func solution(_ s:String) -> Bool {
    if Array(s).count == 4 || Array(s).count == 6 {
        if Int(s) != nil {
            return true
        }
    }
    return false
}

solution("a1234")
solution("1234")

func solution2(_ s:String) -> Bool {
    return Int(s) != nil && (s.count == 4 || s.count == 6) ? true : false
}

