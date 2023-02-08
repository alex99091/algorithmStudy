//문자열 내 마음대로 정렬하기
//문제 설명
//문자열로 구성된 리스트 strings와, 정수 n이 주어졌을 때, 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬하려 합니다. 예를 들어 strings가 ["sun", "bed", "car"]이고 n이 1이면 각 단어의 인덱스 1의 문자 "u", "e", "a"로 strings를 정렬합니다.

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    let index = strings[0].index(strings[0].startIndex, offsetBy: n)
    
    let result = strings.sorted(by: {(s1: String, s2: String) -> Bool in
        if s1[index] == s2[index] {
            return s1 < s2
        }
        else {
            return s1[index] < s2[index]
        }
    })
    
    return result
    
}

func solution2(_ strings:[String], _ n:Int) -> [String] {
    let answer: [String] = strings.sorted {
        let left: Character = $0[$0.index($0.startIndex, offsetBy: n)]
        let right: Character = $1[$1.index($1.startIndex, offsetBy: n)]

        if left == right {
            return $0 < $1
        } else {
            return left < right
        }
    }

    return answer
}

solution(["sun", "bed", "car"],1)
