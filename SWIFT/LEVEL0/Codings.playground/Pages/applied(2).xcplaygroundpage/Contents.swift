//: [Previous](@previous)

import Foundation

//  정수 n을 기준으로 n과 가까운 수부터 정렬하려고 합니다. 이때 n으로부터의 거리가 같다면 더 큰 수를 앞에 오도록 배치합니다. 정수가 담긴 배열 numlist와 정수 n이 주어질 때 numlist의 원소를 n으로부터 가까운 순서대로 정렬한 배열을 return하도록 solution 함수를 완성해주세요.

func findNearNumbers(_ numlist: [Int], _ n: Int) -> [Int] {
    var list = numlist.map { [$0, abs(n-$0)] }
    
    list = list.sorted {
        if $0[1] == $1[1] {
            return $0[0] > $1[0]
        }
        return $0[1] < $1[1]
    }
    
    return list.map{ $0[0] }
}

findNearNumbers([1, 2, 3, 4, 5, 6], 4)

// 3x 마을 사람들은 3을 저주의 숫자라고 생각하기 때문에
// 3의 배수와 숫자 3을 사용하지 않습니다. 3x 마을 사람들의 숫자는 다음과 같습니다.
// 정수 n이 매개변수로 주어질 때, n을 3x 마을에서 사용하는 숫자로 바꿔 return하도록 solution 함수를 완성해주세요.

func removeThreeX(_ n: Int) -> Int {
    var cnt = 0
    for _ in 1...n {
        cnt += 1
        while cnt % 3 == 0 || String(cnt).contains("3") {
            cnt += 1
        }
    }
    return cnt
}
removeThreeX(15)

//한 개 이상의 항의 합으로 이루어진 식을 다항식이라고 합니다.
//다항식을 계산할 때는 동류항끼리 계산해 정리합니다.
//덧셈으로 이루어진 다항식 polynomial이 매개변수로 주어질 때,
//동류항끼리 더한 결괏값을 문자열로 return 하도록 solution 함수를 완성해보세요.
//같은 식이라면 가장 짧은 수식을 return 합니다.

func calcPolynomal(_ polynomial: String) -> String {
    let array = polynomial.components(separatedBy: ["+", " "]).filter { $0 != "" }
    var cntX = 0
    var integer = 0
    for i in array {
        if i.contains("x") {
            cntX += i.count == 1 ? 1 : Int(String(i).split(separator: "x").map { String($0) }.joined())!
        } else {
            integer += Int(String(i))!
        }
    }
    if cntX == 0 { return "\(integer)" }
    if integer == 0 { return cntX == 1 ? "x" : "\(cntX)x"}
    
    return cntX == 1 ? "x + \(integer)" : "\(cntX)x + \(integer)"
}

calcPolynomal("3x + 7 + x")

// 등차수열 혹은 등비수열 common이 매개변수로 주어질 때, 마지막 원소 다음으로 올 숫자를 return 하도록 solution 함수를 완성해보세요.

func findNextElement(_ common:[Int]) -> Int {
    var ans = 0
    var diff = 0
    // 등차수열일 경우
    if (common[2] - common[1]) == (common[1] - common[0]) {
        diff = common[1] - common[0]
        ans = common[common.count - 1] + diff
    } else {
        // 등비수열일 경우
        diff = (common[2] - common[1]) / (common[1] - common[0])
        ans = common[common.count - 1] * diff
    }
    return ans
}

//지뢰는 2차원 배열 board에 1로 표시되어 있고 board에는 지뢰가 매설 된 지역 1과, 지뢰가 없는 지역 0만 존재합니다.
//지뢰가 매설된 지역의 지도 board가 매개변수로 주어질 때, 안전한 지역의 칸 수를 return하도록 solution 함수를 완성해주세요.


func findMine(_ board:[[Int]]) -> Int {
    var safeBoard = board
    let boardYSize = board.count
    let boardXSize = board[0].count
    var mineXY: [[Int]] = []
    
    for y in 0..<boardYSize {
        for x in 0..<boardXSize {
            if safeBoard[y][x] == 1 {
                mineXY.append([y, x])
            }
        }
    }
    
    let safeArea = [[-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0]]
    
    for mine in mineXY {
        for xy in safeArea {
            let y = mine[1] + xy[1]
            let x = mine[0] + xy[0]
            
            if (y >= 0 && y < boardYSize) && (x >= 0 && x < boardXSize) && safeBoard[x][y] != 1 {
                safeBoard[x][y] = 2
            }
        }
    }
    return safeBoard.reduce(0) { $0 + $1.filter { $0 == 0}.count }
}
findMine([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]])

//선분 3개가 평행하게 놓여 있습니다. 세 선분의 시작과 끝 좌표가 [[start, end], [start, end], [start, end]] 형태로 들어있는 2차원 배열 lines가 매개변수로 주어질 때, 두 개 이상의 선분이 겹치는 부분의 길이를 return 하도록 solution 함수를 완성해보세요.
//
//lines가 [[0, 2], [-3, -1], [-2, 1]]일 때 그림으로 나타내면 다음과 같습니다.

func findOverlappedValue(_ lines:[[Int]]) -> Int {
    let line = lines.map { $0.sorted() }.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    }
    var ans = 0
    
    for i in line[0][0]..<line[2][1] {
        var cnt = 0
        for j in line {
            if (j[0]..<j[1]).contains(i) { cnt += 1 }
        }
        
        if cnt >= 2 { ans += 1 }
    }
    return ans
}
findOverlappedValue([[3, 9], [2, 5], [0, 12]])

// 점 네 개의 좌표를 담은 이차원 배열  dots가 다음과 같이 매개변수로 주어집니다.
//
// [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]
// 주어진 네 개의 점을 두 개씩 이었을 때, 두 직선이 평행이 되는 경우가 있으면 1을 없으면 0을 return 하도록 solution 함수를 완성해보세요.

func checkDots(_ dots:[[Int]]) -> Int {
    // 평행조건 ax+by=c = 0 a1x + b1y = c1 = 0 일때, a=a1, b=b1, c!=c1
    func isParallel(_ a1: [Int], _ a2: [Int], _ b1: [Int], _ b2:[Int]) -> Bool {
        return abs(Double(a2[1] - a1[1]) / Double(a2[0] - a1[0])) == abs(Double(b2[1] - b1[1]) / Double(b2[0] - b1[0]))
    }
    // 각 점을잇는 경우의수: a,b,c,d -> (a,b), (a,c), (a,d)
    let points = dots.sorted { $0[0] < $1[0] }
    
    return isParallel(points[0], points[1], points[2], points[3]) || isParallel(points[0], points[2], points[1], points[3]) || isParallel(points[0], points[3], points[1], points[2]) ? 1 : 0
}
checkDots([[1, 4], [9, 2], [3, 8], [11, 6]])

//머쓱이는 태어난 지 6개월 된 조카를 돌보고 있습니다.
//조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음을 최대 한 번씩 사용해 조합한(이어 붙인) 발음밖에 하지 못합니다.
//문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.

func solution(_ babbling:[String]) -> Int {
    func check(_ word: String) -> Bool {
        let list:[String] = ["aya", "ye", "woo", "ma"]
        var wordList:[String] = []
        
        var ret = ""
        for i in word.map { String($0) } {
            ret += i
            if list.contains(ret) && wordList.last != ret {
                wordList.append(ret)
                ret = ""
            }
        }
        return ret == ""
    }
    return babbling.reduce(0) { check($1) ? $0 + 1 : $0 }
}
solution(["ayayee", "u"])
//solution(["aya", "yee", "u", "maa", "wyeoo"])
//solution(["ayaye", "uuuma", "ye", "yemawoo", "ayaa"])

//: [Next](@next)
