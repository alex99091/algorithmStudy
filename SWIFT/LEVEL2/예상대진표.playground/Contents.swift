import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var a = a
    var b = b
    var count = 0
    
    while true {
        a = a % 2 == 0 ? a / 2 : (a + 1) / 2
        b = b % 2 == 0 ? b / 2 : (b + 1) / 2
        count += 1
        if a == b { break }
    }
    return count
}
solution(8,4,7)
