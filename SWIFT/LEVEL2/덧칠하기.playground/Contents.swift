import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var check: [Int] = []
    for num in section {
        if check.last == nil {
            check.append(num)
        } else {
            if let endPoint = check.last {
                if num >= endPoint + m {
                    check.append(num)
                }
            }
        }
    }
    
    return check.count
}
solution(8,4, [2,3,6])
solution(5,4, [1,3])
solution(4, 1, [1,2,3,4])
