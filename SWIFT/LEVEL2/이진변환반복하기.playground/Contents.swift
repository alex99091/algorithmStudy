import Foundation

func solution(_ s:String) -> [Int] {
    var countZero = 0
    var executedCount = 0
    var result = s
    while true {
        if result == "1" {
            break
        }
        let resultArray = removeZeroAndCount(result)
        countZero += resultArray[1]
        result = changeToBinary(resultArray[0])
        executedCount += 1
        print("countZero: \(countZero), executedCount: \(executedCount)")
    }
    return [executedCount, countZero]
}

// removeZero함수 입력된 문자열의 return값: [0제거 후 길이, 0의 갯수]
func removeZeroAndCount(_ s: String) -> [Int] {
    return [Array(s).filter{ $0 != "0"}.count, Array(s).filter{ $0 == "0"}.count]
}

// 10진수를 2진수로 바꾸는 changeToBinary 함수 return값-> [String: 2진수]
func changeToBinary(_ number: Int) -> String {
    var result: [String] = []
    var binaryNumber = number
    
    if binaryNumber <= 1 {
        return String(binaryNumber)
    }
    
    while binaryNumber > 1 {
        result.append(String(binaryNumber % 2))
        binaryNumber = binaryNumber / 2
        if binaryNumber == 1 {
            result.append("1")
        }
    }
    // 역순으로 추가되므로 마지막에 뒤집는다
    return result.reversed().joined()
}

solution("110010101001")
