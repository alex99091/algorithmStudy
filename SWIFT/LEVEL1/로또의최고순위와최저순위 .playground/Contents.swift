//로또 6/45(이하 '로또'로 표기)는 1부터 45까지의 숫자 중 6개를 찍어서 맞히는 대표적인 복권입니다. 아래는 로또의 순위를 정하는 방식입니다. 1
//
//순위    당첨 내용
//1    6개 번호가 모두 일치
//2    5개 번호가 일치
//3    4개 번호가 일치
//4    3개 번호가 일치
//5    2개 번호가 일치
//6(낙첨)    그 외
//로또를 구매한 민우는 당첨 번호 발표일을 학수고대하고 있었습니다. 하지만, 민우의 동생이 로또에 낙서를 하여, 일부 번호를 알아볼 수 없게 되었습니다. 당첨 번호 발표 후, 민우는 자신이 구매했던 로또로 당첨이 가능했던 최고 순위와 최저 순위를 알아보고 싶어 졌습니다.
//알아볼 수 없는 번호를 0으로 표기하기로 하고, 민우가 구매한 로또 번호 6개가 44, 1, 0, 0, 31 25라고 가정해보겠습니다. 당첨 번호 6개가 31, 10, 45, 1, 6, 19라면, 당첨 가능한 최고 순위와 최저 순위의 한 예는 아래와 같습니다.

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var cnt = 0
    var zero = 0
    for lotto in lottos {
        if lotto == 0 {
            zero += 1
        } else if win_nums.contains(lotto) {
            cnt += 1
        }
    }
    var answer: [Int] = []
    let temp = zero + cnt
    switch temp {
    case 2: answer.append(5)
    case 3: answer.append(4)
    case 4: answer.append(3)
    case 5: answer.append(2)
    case 6: answer.append(1)
    default: answer.append(6)
    }
    switch cnt {
    case 2: answer.append(5)
    case 3: answer.append(4)
    case 4: answer.append(3)
    case 5: answer.append(2)
    case 6: answer.append(1)
    default: answer.append(6)
    }
    return answer
}
solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25])

func solution2(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

    let zeroCount = lottos.filter { $0 == 0}.count
    let winCount: Int = win_nums.filter { lottos.contains($0) }.count


    return [min(7-winCount-zeroCount,6), min(7-winCount,6)]
}
