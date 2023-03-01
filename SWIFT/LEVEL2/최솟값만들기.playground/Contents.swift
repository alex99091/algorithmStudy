import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    var arrayA = A.sorted(by: >)
    var arrayB = B.sorted(by: <)
    for i in 0..<arrayA.count{
        ans += arrayA[i] * arrayB[i]
    }

    return ans
}
