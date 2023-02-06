import Foundation

//문제 설명
//어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 "AB"는 1만큼 밀면 "BC"가 되고, 3만큼 밀면 "DE"가 됩니다. "z"는 1만큼 밀면 "a"가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.

func solution(_ s:String, _ n:Int) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let alphabetUppercased = ArraySlice(alphabet.uppercased())
    let alphabetLowercased = ArraySlice(alphabet.lowercased())
    var answer = ""
    for i in s {
        if alphabetUppercased.contains(i) {
            var idx = alphabetUppercased.firstIndex(of: i)! + n
            idx = idx > (alphabetUppercased.count - 1) ? (idx - alphabetUppercased.count) : idx
            answer.append(alphabetUppercased[idx])
        } else if alphabetLowercased.contains(i) {
            var idx = alphabetLowercased.firstIndex(of: i)! + n
            idx = idx > (alphabetLowercased.count - 1) ? (idx - alphabetLowercased.count) : idx
            answer.append(alphabetLowercased[idx])
        } else {
            answer.append(" ")
        }
    }
    return answer
}
solution("a B z", 4)

func solution2(_ s:String, _ n:Int) -> String {
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}
