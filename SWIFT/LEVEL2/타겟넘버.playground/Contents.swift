/* 문제 설명
 n개의 음이 아닌 정수들이 있습니다. 이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
 
 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3
 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요. */

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    // DFS 재귀: index : 현재 위치 , sum : 현재까지 더한 값
    func dfs(index: Int, sum: Int) {
        // 모든 원소를 다 돌았을 경우
        if index == numbers.count {
            // 현재까지 더한 값이 목표 값과 같을 경우
            if sum == target {
                // 경우의 수 카운트
                count += 1
            }
            return
        }
        // 다음 인덱스에서 원소를 더하거나 뺀 값으로 재귀적으로 dfs 함수 호출
        dfs(index: index+1, sum: sum + numbers[index])
        dfs(index: index+1, sum: sum - numbers[index])
    }
    // 초기화
    dfs(index: 0, sum: 0)
    
    return count
}

func solution2(_ numbers:[Int], _ target:Int) -> Int {
    var queue = [(index: 0, sum: 0)]
    var count = 0
    
    while !queue.isEmpty {
        let size = queue.count
        
        for _ in 0..<size {
            let node = queue.removeFirst()
            
            if node.index == numbers.count {
                if node.sum == target {
                    count += 1
                }
                continue
            }
            queue.append((index: node.index + 1, sum: node.sum + numbers[node.index]))
            queue.append((index: node.index + 1, sum: node.sum - numbers[node.index]))
        }
    }
    
    return count
}

solution([1,1,1,1,1], 3)
solution2([4,1,2,1], 4)
