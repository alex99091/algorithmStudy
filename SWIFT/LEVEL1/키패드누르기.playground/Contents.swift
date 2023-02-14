//스마트폰 전화 키패드의 각 칸에 다음과 같이 숫자들이 적혀 있습니다.
//
//이 전화 키패드에서 왼손과 오른손의 엄지손가락만을 이용해서 숫자만을 입력하려고 합니다.
//맨 처음 왼손 엄지손가락은 * 키패드에 오른손 엄지손가락은 # 키패드 위치에서 시작하며, 엄지손가락을 사용하는 규칙은 다음과 같습니다.
//
//엄지손가락은 상하좌우 4가지 방향으로만 이동할 수 있으며 키패드 이동 한 칸은 거리로 1에 해당합니다.
//왼쪽 열의 3개의 숫자 1, 4, 7을 입력할 때는 왼손 엄지손가락을 사용합니다.
//오른쪽 열의 3개의 숫자 3, 6, 9를 입력할 때는 오른손 엄지손가락을 사용합니다.
//가운데 열의 4개의 숫자 2, 5, 8, 0을 입력할 때는 두 엄지손가락의 현재 키패드의 위치에서 더 가까운 엄지손가락을 사용합니다.
//4-1. 만약 두 엄지손가락의 거리가 같다면, 오른손잡이는 오른손 엄지손가락, 왼손잡이는 왼손 엄지손가락을 사용합니다.
//순서대로 누를 번호가 담긴 배열 numbers, 왼손잡이인지 오른손잡이인 지를 나타내는 문자열 hand가 매개변수로 주어질 때, 각 번호를 누른 엄지손가락이 왼손인 지 오른손인 지를 나타내는 연속된 문자열 형태로 return 하도록 solution 함수를 완성해주세요.

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    let left = [1,4,7]
    let right = [3,6,9]
    var dict: [String : String] = ["L": "*", "R": "#"]
    var answer = ""
    
    for i in numbers {
        if left.contains(i) {
            answer.append("L")
            dict.updateValue(String(i), forKey: "L")
        } else if right.contains(i) {
            answer.append("R")
            dict.updateValue(String(i), forKey: "R")
        } else {
            let left = distance(String(i), dict["L"]!)
            let right = distance(String(i), dict["R"]!)
            if left < right {
                answer.append("L")
                dict.updateValue(String(i), forKey: "L")
            } else if right < left {
                answer.append("R")
                dict.updateValue(String(i), forKey: "R")
            } else {
                if hand == "left" {
                    answer.append("L")
                    dict.updateValue(String(i), forKey: "L")
                } else if hand == "right" {
                    answer.append("R")
                    dict.updateValue(String(i), forKey: "R")
                }
            }
            print("left: \(left), right: \(right), i: \(i)")
        }
    }
    return answer
}

func distance(_ a: String, _ b: String) -> Int {
    let keyPad = [["1","2","3"],["4","5","6"],["7","8","9"],["*","0","#"]]
    
    var count = 0
    
    if a == b {
        count = 0
    } else {
        var xy = [[Int]]()
        for i in 0...3 {
            for j in 0...2 {
                if keyPad[i][j] == a {
                    xy.append([i, j])
                } else if keyPad[i][j] == b {
                    xy.append([i, j])
                }
            }
        }
        count = abs(xy[0][0] - xy[1][0]) + abs(xy[0][1] - xy[1][1])
    }
    return count
}
// solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5],"right")
solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")
// solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0],"right")
