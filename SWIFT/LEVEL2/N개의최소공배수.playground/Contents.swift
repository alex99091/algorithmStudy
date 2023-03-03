import Foundation

func solution(_ arr:[Int]) -> Int {
    var numArray = arr.sorted(by: <)
    var count = numArray.count
    while count > 1 {
        let a = numArray.popLast()!
        let b = numArray.popLast()!
        let gcdAB = gcd(a, b)
        numArray.insert(a * b / gcdAB, at: 0)
        count = numArray.count
        print("a: \(a), b: \(b), numArray: \(numArray)")
    }
    
    return numArray[0]
}

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a%b)
}

solution([2,6,8,14])
