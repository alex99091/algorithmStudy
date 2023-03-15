/* 정수 n, left, right가 주어집니다. 다음 과정을 거쳐서 1차원 배열을 만들고자 합니다.

n행 n열 크기의 비어있는 2차원 배열을 만듭니다.
i = 1, 2, 3, ..., n에 대해서, 다음 과정을 반복합니다.
1행 1열부터 i행 i열까지의 영역 내의 모든 빈 칸을 숫자 i로 채웁니다.
1행, 2행, ..., n행을 잘라내어 모두 이어붙인 새로운 1차원 배열을 만듭니다.
새로운 1차원 배열을 arr이라 할 때, arr[left], arr[left+1], ..., arr[right]만 남기고 나머지는 지웁니다.
정수 n, left, right가 매개변수로 주어집니다. 주어진 과정대로 만들어진 1차원 배열을 return 하도록 solution 함수를 완성해주세요. */

import Foundation

// 시간초과
func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    // (1). 2차원배열 생성
    var array2D = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    // (2). 2차원배열에 숫자넣기
    for i in 0..<n {
        for j in 0..<n {
            array2D[i][j] = i > j ? i + 1 : j + 1
        }
    }
    // (3). 1차원배열으로 변환
    let array1D = array2D.flatMap { $0 }
    // (4). left부터 right까지 자르기
    let slicedArray = Array(array1D[Int(left)...Int(right)])
    
    return slicedArray
}

func solution2(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let startRow = Int(left / Int64(n))
    let startCol = Int(left % Int64(n))
    let endRow = Int(right / Int64(n))
    let endCol = Int(right % Int64(n))
    
    var result: [Int] = []

    for i in startRow...endRow {
        for j in (i == startRow ? startCol : 0)...(i == endRow ? endCol : n-1) {
            result.append(max(i, j) + 1)
        }
    }

    return result
}

solution2(3, 2, 5)
solution2(4, 7, 14)
