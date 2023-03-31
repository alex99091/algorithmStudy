/* 전화번호 목록
문제 설명
전화번호부에 적힌 전화번호 중, 한 번호가 다른 번호의 접두어인 경우가 있는지 확인하려 합니다.
전화번호가 다음과 같을 경우, 구조대 전화번호는 영석이의 전화번호의 접두사입니다.

구조대 : 119
박준영 : 97 674 223
지영석 : 11 9552 4421
전화번호부에 적힌 전화번호를 담은 배열 phone_book 이 solution 함수의 매개변수로 주어질 때, 어떤 번호가 다른 번호의 접두어인 경우가 있으면 false를 그렇지 않으면 true를 return 하도록 solution 함수를 작성해주세요.

제한 사항
phone_book의 길이는 1 이상 1,000,000 이하입니다.
각 전화번호의 길이는 1 이상 20 이하입니다.
같은 전화번호가 중복해서 들어있지 않습니다.
입출력 예제
phone_book    return
["119", "97674223", "1195524421"]    false
["123","456","789"]    true
["12","123","1235","567","88"]    false
입출력 예 설명
입출력 예 #1
앞에서 설명한 예와 같습니다.

입출력 예 #2
한 번호가 다른 번호의 접두사인 경우가 없으므로, 답은 true입니다.

입출력 예 #3
첫 번째 전화번호, “12”가 두 번째 전화번호 “123”의 접두사입니다. 따라서 답은 false입니다. */

import Foundation

func solution(_ phone_book:[String]) -> Bool {
    // 최대 문자열 길이 찾기
    var maxLen = 0
    for str in phone_book {
        maxLen = max(maxLen, str.count)
    }
    
    // 가장 긴 문자열의 길이만큼의 해시 테이블 생성
    var hashTable = Array(repeating: "", count: maxLen+1)
    
    // 해시 테이블에 문자열 할당
    for str in phone_book {
        hashTable[str.count] = str
    }
    
    // 접두사 비교
    for i in 0..<phone_book.count {
        let phoneNum = phone_book[i]
        
        for j in 1..<phoneNum.count {
            let index = phoneNum.index(phoneNum.startIndex, offsetBy: j)
            let prefix = String(phoneNum[..<index])
            
            if !hashTable[prefix.count].isEmpty {
                if hashTable[prefix.count] == prefix {
                    // 접두사가 해시 테이블에 존재하면서, 일치하는 문자열이 있으면 false 반환
                    return false
                }
            }
        }
    }
    
    // 접두사가 해시 테이블에 존재하지 않거나 일치하는 문자열이 없으면 true 반환
    return true
}

solution(["12","123","1235","567","88"])
