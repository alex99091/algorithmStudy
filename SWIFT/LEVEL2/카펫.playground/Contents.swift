import Foundation
import Darwin

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let dimension = brown + yellow
    var height = 3
    var answer = [Int]()
    while true {
        let width = dimension / height
        if width >= height{
            if (width - 2) * (height - 2) == yellow {
                answer.append(width)
                answer.append(height)
                break
            }
        } else {
            break
        }
        height += 1
    }
    return answer
}

solution(10, 2)
solution(8, 1)
solution(24, 24)
