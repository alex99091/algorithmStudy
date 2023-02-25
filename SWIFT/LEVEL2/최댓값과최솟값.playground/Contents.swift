import Foundation

func solution(_ s:String) -> String {
    let array = s.components(separatedBy: " ")
    var numbers = [Int]()
    for arr in array {
        if let number = Int(arr) {
            numbers.append(number)
        }
    }
    return "\(numbers.min()!) \(numbers.max()!)"
}
solution("1 2 3 4")
