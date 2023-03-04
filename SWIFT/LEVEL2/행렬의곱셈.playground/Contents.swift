import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    var temp = 0
    
    for index in 0..<arr1.count {
        result.append([])
        for i in 0..<arr2[0].count {
            temp = 0
            for j in 0..<arr2.count {
                temp += arr1[index][j] * arr2[j][i]
            }
            result[index].append(temp)
        }
    }
    return result
}

func solution3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in 0..<arr1.count {
        var temp: [Int] = []
        for j in 0..<arr2[0].count {
            var sum = 0
            for k in 0..<arr2.count {
                sum += arr1[i][k] * arr2[k][j]
            }
            temp.append(sum)
        }
        result.append(temp)
    }
    return result
}

func solution2(_ arr1:[[String]], _ arr2:[[String]]) -> [[String]] {
    var result: [[String]] = []
    for i in 0..<arr1.count {
        var temp: [String] = []
        for j in 0..<arr1[i].count {
            var sum = ""
            for k in 0..<arr2[j].count {
                sum += "\(arr1[i][k]) * \(arr2[k][j]) + "
            }
            temp.append(sum)
        }
        print(temp)
        result.append(temp)
    }
    return result
}
solution2([["a00", "a01"], ["a10", "a11"], ["a20", "a21"]], [["b00", "b01"], ["b10", "b11"]])
