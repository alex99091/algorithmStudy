import Foundation

func solution(_ s:String) -> String {
    var result = ""
    var isFirst = true
    var jadonArray: [String] = []
    for c in s {
        if c != " " {
            isFirst = result == "" ? true : false
            result += isFirst == true ? c.uppercased() : c.lowercased()
        } else {
            if result != "" {
                let firstLetter = result.removeFirst().uppercased()
                result = firstLetter + result
                jadonArray.append(result)
                result = ""
            }
        }
    }
    // 남아있는 result 값 확인
    if result != "" {
        jadonArray.append(result)
    }
    for i in 0..<jadonArray.count {
        print("\(i) : \(jadonArray[i])")
    }
    return jadonArray.joined(separator: " ")
}

solution("  3people    unFollowed    me   ")
solution("  A B C D E a s d f   ")
solution(" asdf dfef g")
solution(" asdf efw    gh")
solution(" asdf efw    gh     ")

func solution2(_ s:String) -> String {
    var reset = true
    var charArr = [Character]()
    for c in s {
        if c == " " {
            reset = true
            charArr.append(c)
        } else {
            if(reset){
                charArr.append(Character(String(c).uppercased()))
                reset = false
            }else{
                charArr.append(Character(String(c).lowercased()))
            }
        }
    }
    return String(charArr)
}
