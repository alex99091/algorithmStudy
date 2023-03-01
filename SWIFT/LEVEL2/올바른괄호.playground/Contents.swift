import Foundation

func solution(_ s:String) -> Bool {
    var check =  [Character]()
    for c in s {
        if c == ")" {
            if check.popLast() == "(" {
            } else {
                return false
            }
        } else {
            check.append(c)
        }
    }
    
    return check.isEmpty ? true : false
}

solution("()()")
solution("(())()")
solution(")()(")
solution("(()(")
