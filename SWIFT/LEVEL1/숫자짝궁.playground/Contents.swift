//숫자 짝꿍
//문제 설명
//두 정수 X, Y의 임의의 자리에서 공통으로 나타나는 정수 k(0 ≤ k ≤ 9)들을 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라 합니다(단, 공통으로 나타나는 정수 중 서로 짝지을 수 있는 숫자만 사용합니다). X, Y의 짝꿍이 존재하지 않으면, 짝꿍은 -1입니다. X, Y의 짝꿍이 0으로만 구성되어 있다면, 짝꿍은 0입니다.
//
//예를 들어, X = 3403이고 Y = 13203이라면, X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 3, 0, 3으로 만들 수 있는 가장 큰 정수인 330입니다. 다른 예시로 X = 5525이고 Y = 1255이면 X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 2, 5, 5로 만들 수 있는 가장 큰 정수인 552입니다(X에는 5가 3개, Y에는 5가 2개 나타나므로 남는 5 한 개는 짝 지을 수 없습니다.)
//두 정수 X, Y가 주어졌을 때, X, Y의 짝꿍을 return하는 solution 함수를 완성해주세요.

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var list = [String]()
    for i in (0...9) {
        let xCount = X.filter{ String($0) == String(i)}.count
        let yCount = Y.filter{ String($0) == String(i)}.count
        list += Array(repeating: String(i), count: min(xCount, yCount))
    }
    
    return list.isEmpty ? "-1" : list.filter {$0 == "0"}.count == list.count ? "0" : list.sorted(by: >).joined()
}


// 시간초과 ㅡㅡ ;;
func solution2(_ X:String, _ Y:String) -> String {
    var common = [String]()
    var first = X
    var second = Y
    if first.count >= second.count {
        for x in first {
            if second.contains(x) {
                common.append(String(x))
                let idx = second.firstIndex(of: x)!
                second.remove(at: idx)
            }
        }
    } else {
        for y in second {
            if first.contains(y) {
                common.append(String(y))
                let idx = first.firstIndex(of: y)!
                first.remove(at: idx)
            }
        }
    }
    if !common.isEmpty && common.filter({ $0 == "0"}).count == common.count {
        common.removeAll()
        common.append("0")
    }
    
    return common.count == 0 ? "-1" : common.sorted(by: >).reduce("", +)
}
solution("100","123450")
