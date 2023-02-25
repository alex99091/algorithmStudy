import Foundation

func solution(_ s:String) -> Int{
    var temp: [String] = []
    let array = ArraySlice(s)
    for i in array {
        if temp.last == String(i) {
            temp.removeLast()
        } else {
            temp.append(String(i))
        }
    }
    
    return temp.isEmpty ? 1 : 0
}
solution("baabaa")
solution("cdcd")
