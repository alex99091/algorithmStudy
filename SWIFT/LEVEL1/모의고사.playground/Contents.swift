//수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
//
//1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
//2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
//3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
//

//1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
//제한 조건
//시험은 최대 10,000 문제로 구성되어있습니다.
//문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
//가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let student1 = [1,2,3,4,5]
    let student2 = [2,1,2,3,2,4,2,5]
    let student3 = [3,3,1,1,2,2,4,4,5,5]
    // 학생의 번호와 정답 수를 관리하기 위한 key, value 형태의 Dictionary
    var dic: [Int: Int] = [:]
    
    // 각 학생들의 패턴과 최종 정답과 패턴의 수를 각 패턴의 수만큼 고려하여 하나씩 비교
    for i in 0..<answers.count {
        // 정답과 패턴의 수가 같을 경우 해당 학생 Dictionary의 value 값을 1 증가
        if answers[i] == student1[i%student1.count] { dic[1] = (dic[1] ?? 0) + 1 }
        if answers[i] == student2[i%student2.count] { dic[2] = (dic[2] ?? 0) + 1 }
        if answers[i] == student3[i%student3.count] { dic[3] = (dic[3] ?? 0) + 1 }
    }
    
    // 모든 학생들의 Dictionary의 최대 값을 가져옴
    let max = dic.values.max()!
    
    // max값과 같은 값을 가지는 객체들만 추려서(필터링) 가져옴(filter)
    // 여러 개일 경우를 고려하여 오름차순 정렬을 실행
    let result = dic.filter { $0.value == max }.keys.sorted()
    
    return result
}
