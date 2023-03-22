/* 프렌즈4블록
 블라인드 공채를 통과한 신입 사원 라이언은 신규 게임 개발 업무를 맡게 되었다. 이번에 출시할 게임 제목은 "프렌즈4블록".
 같은 모양의 카카오프렌즈 블록이 2×2 형태로 4개가 붙어있을 경우 사라지면서 점수를 얻는 게임이다.
 
 만약 판이 위와 같이 주어질 경우, 라이언이 2×2로 배치된 7개 블록과 콘이 2×2로 배치된 4개 블록이 지워진다. 같은 블록은 여러 2×2에 포함될 수 있으며, 지워지는 조건에 만족하는 2×2 모양이 여러 개 있다면 한꺼번에 지워진다.
 
 블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채우게 된다.
 
 만약 빈 공간을 채운 후에 다시 2×2 형태로 같은 모양의 블록이 모이면 다시 지워지고 떨어지고를 반복하게 된다.
 위 초기 배치를 문자로 표시하면 아래와 같다.
 
 TTTANT
 RRFACC
 RRRFCC
 TRRRAA
 TTMMMF
 TMMTTJ
 
 각 문자는 라이언(R), 무지(M), 어피치(A), 프로도(F), 네오(N), 튜브(T), 제이지(J), 콘(C)을 의미한다
 
 입력으로 블록의 첫 배치가 주어졌을 때, 지워지는 블록은 모두 몇 개인지 판단하는 프로그램을 제작하라. */

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var newBoard = initBoard(board).0
    let checkBoard = initBoard(board).1
    
    var willBeRemoved = checkRemoved(m, n, newBoard)
    while willBeRemoved != [] {
        newBoard = updateCheckBoard(willBeRemoved, checkBoard, newBoard)
        newBoard = updateBoard(newBoard)
        willBeRemoved = checkRemoved(m, n, newBoard)
    }
    
    return newBoard.flatMap{ $0 }.filter{ $0 == "0" }.count
}

func initBoard(_ board:[String]) -> ([[String]], [[Int]:Bool]) {
    var boardIsInitiated: [[String]] = []
    var checkBoardIsInitiated: [[Int]:Bool] = [:]
    for (x, row) in board.enumerated() {
        var cellArray: [String] = []
        for (y, cell) in row.enumerated() {
            cellArray.append(String(cell))
            checkBoardIsInitiated[[x,y]] = false
        }
        boardIsInitiated.append(cellArray)
    }
    return (boardIsInitiated, checkBoardIsInitiated)
}

func checkRemoved(_ m: Int, _ n: Int, _ board: [[String]]) -> [[Int]] {
    var willBeRemoved: [[Int]] = []
    for i in 0...(m-2) {
        for j in 0...(n-2) {
            if board[i][j] != "0", board[i][j] == board[i][j+1] && board[i][j] == board[i+1][j] && board[i][j] == board[i+1][j+1] {
                willBeRemoved.append([i,j])
            }
        }
    }
    return willBeRemoved
}

func updateCheckBoard(_ willBeRemoved: [[Int]], _ checkBoard: [[Int] : Bool], _ board: [[String]]) -> [[String]] {
    var checkBoard = checkBoard
    var board = board
    willBeRemoved.forEach { xy in
        checkBoard[[xy[0],xy[1]]] = true
        checkBoard[[xy[0],xy[1]+1]] = true
        checkBoard[[xy[0]+1,xy[1]]] = true
        checkBoard[[xy[0]+1,xy[1]+1]] = true
    }
    for (key, value) in checkBoard {
        if value == true {
            board[key[0]][key[1]] = "0"
        }
    }
    return board
}

func updateBoard(_ board: [[String]]) -> [[String]] {
    var boardIsUpdated = board
    for y in 0..<boardIsUpdated[0].count {
        var stack: [String] = []
        for x in 0..<boardIsUpdated.count {
            if boardIsUpdated[x][y] != "0" {
                stack.append(boardIsUpdated[x][y])
                boardIsUpdated[x][y] = "0"
            }
        }
        var index = boardIsUpdated.count - 1
        while !stack.isEmpty {
            boardIsUpdated[index][y] = stack.popLast()!
            index -= 1
        }
    }
    return boardIsUpdated
}

solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
