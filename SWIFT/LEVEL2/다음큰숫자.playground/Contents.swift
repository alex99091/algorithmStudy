import Foundation

func solution2(_ n:Int) -> Int {
    var binary = String(n, radix: 2)
    let count = binary.filter{ $0 == "1"}.count
    var check = n
    while true {
        check += 1
        binary = String(check, radix: 2)
        if binary.filter({ $0 == "1"}).count == count {
            break
        }
    }
    return check
}


// 시간초과
func solution(_ n:Int) -> Int {
    let input = changeToBinary(n)
    var check = n
    var find = 0
    while true {
        check += 1
        let temp = changeToBinary(check)
        if temp[1] == input[1] {
            find = check
            break
        }
    }
    return find
}

// 2진수 변환: return [2진수, 1의 갯수]
func changeToBinary(_ n: Int) -> [String] {
    var result = ""
    var binArray = [String]()
    var oneCount = "0"
    if n < 2 {
        result = String(n)
    } else {
        var temp = n
        while temp >= 2 {
            binArray.append(String(temp % 2))
            temp /= 2
            if temp < 2 {
                binArray.append(String(temp))
            }
        }
        result = binArray.reversed().joined()
    }
    oneCount = String(result.filter{ $0 == "1"}.count)
    return [result, oneCount]
}

solution(78)
