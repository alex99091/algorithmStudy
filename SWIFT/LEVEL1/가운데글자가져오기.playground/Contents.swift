import Foundation

//가운데 글자 가져오기
//문제 설명
//단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.
//
//재한사항
//s는 길이가 1 이상, 100이하인 스트링입니다.

func solution(_ s:String) -> String {
    let array = ArraySlice(s)
    let d = array.count
    var answer = ""
    if d % 2 == 1 {
        answer.append(array[Int(d/2)])
    } else {
        answer.append(array[Int(d/2-1)])
        answer.append(array[Int(d/2)])
    }
    return answer
}

func solution2(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    } else {
        return String(Array(s)[s.count/2])
    }
}
