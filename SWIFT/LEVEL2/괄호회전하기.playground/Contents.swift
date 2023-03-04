import Foundation

func solution(_ s:String) -> Int {
    var strStack: [String] = []
    var str = s
    for _ in 0..<s.count {
        str.append(str.removeFirst())
        strStack.append(str)
    }
    var count = 0
    for str in strStack {
        if check(str) == true {
            count += 1
        }
    }
    return count
}

func check(_ s: String) -> Bool {
    var stack: [Character] = []
    for c in s {
        switch c {
        case ")":
            if stack.isEmpty {
                return false
            } else {
                if stack.last == "(" {
                    stack.popLast()
                }
            }
        case "]":
            if stack.isEmpty {
                return false
            } else {
                if stack.last == "[" {
                    stack.popLast()
                }
            }
        case "}":
            if stack.isEmpty {
                return false
            } else {
                if stack.last == "{" {
                    stack.popLast()
                }
            }
        default:
            stack.append(c)
        }
    }
    return stack.isEmpty ? true : false
}
