//문제 설명
//게임개발자인 "죠르디"는 크레인 인형뽑기 기계를 모바일 게임으로 만들려고 합니다.
//"죠르디"는 게임의 재미를 높이기 위해 화면 구성과 규칙을 다음과 같이 게임 로직에 반영하려고 합니다.
//게임 화면은 "1 x 1" 크기의 칸들로 이루어진 "N x N" 크기의 정사각 격자이며 위쪽에는 크레인이 있고 오른쪽에는 바구니가 있습니다. (위 그림은 "5 x 5" 크기의 예시입니다). 각 격자 칸에는 다양한 인형이 들어 있으며 인형이 없는 칸은 빈칸입니다. 모든 인형은 "1 x 1" 크기의 격자 한 칸을 차지하며 격자의 가장 아래 칸부터 차곡차곡 쌓여 있습니다. 게임 사용자는 크레인을 좌우로 움직여서 멈춘 위치에서 가장 위에 있는 인형을 집어 올릴 수 있습니다. 집어 올린 인형은 바구니에 쌓이게 되는 데, 이때 바구니의 가장 아래 칸부터 인형이 순서대로 쌓이게 됩니다. 다음 그림은 [1번, 5번, 3번] 위치에서 순서대로 인형을 집어 올려 바구니에 담은 모습입니다.

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var container: [Int] = []
    var remove: [Int] = []
    var changeBoard: [[Int]] = board
    var check = 0
    for move in moves {
        let line = move - 1
        for i in 0..<board.count {
            if changeBoard[i][line] != 0 {
                if check == changeBoard[i][line]{
                    remove.append(changeBoard[i][line])
                    remove.append(container.removeLast())
                    changeBoard[i][line] = 0
                } else {
                    container.append(changeBoard[i][line])
                    changeBoard[i][line] = 0
                }
                break
            }
        }
        if !container.isEmpty {
            check = container[container.count - 1]
        } else {
            check = 0
        }
        print("container: \(container), remove: \(remove), check: \(check)")
    }
    return remove.count
}
//solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])
solution([[0, 0, 0, 0], [0, 0, 0, 0], [0, 4, 4, 0], [1, 2, 2, 1]], [2, 3, 1, 4, 2, 3])
