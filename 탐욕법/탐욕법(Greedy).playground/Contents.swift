// 거스름돈

import Foundation

let coinTypes: [Int] = [500, 100, 50, 10];

func calcChanges(_ n: Int) -> Int {
    var count = 0
    var remains = n
    
    for coin in coinTypes {
        count += remains / coin
        remains = remains % coin
    }
    
    return count
}

calcChanges(1260)

/* N이 1이 될때 까지 다음의 두 과정중 하나를 반복적으로 수행하려고 합니다.
 단, 두번째 연산은 N이 K로 나누어질 때만 선택할 수 있습니다.
 1. N에서 1을 뺍니다.
 2. N을 K로 나눕니다.
 N과 K가 주어질 때 N이 1이 될 때까지 1번 혹은 2번의 과정을 수행해야하는 최소 횟수 프로그램을 구현하시오 */

func calcCount(_ n: Int, _ k: Int) -> Int {
    var cnt = 0
    var n = n
    
    while n != 1 {
        if n % k != 0 {
            n -= 1
            cnt += 1
        } else {
            n /= k
            cnt += 1
        }
    }
    
    return cnt
}

calcCount(17, 4)
calcCount(25, 5)
calcCount(25, 3)

/* 각 자리가 숫자 (0부터 9)로만 이루어진 문자열 S가 주어질 때,
 왼쪽부터 오른쪽으로 하나씩 모든 숫자를 확인하며 숫자 사이에 "X" 혹은 "+"
 연산자를 넣어 결과적으로 만들어질 수 있는 가장 큰 수를 구하는 프로그램을 구현하시오.
 단, +보다 X를 먼저 계산하는 일반적인 방식과는 달리, 모든 연산은 왼쪽부터 순서대로 이루어진다고
 가정합니다.
 예를 들어, 02984라는 문자열로 만들수 있는 가장 큰 숫자는 (0+2)*9*8*4 =576 입니다.*/

func calcMaxNumByString(_ s: String) -> Int {
    var result = 1
    s.forEach { digit in
        if let num = Int(String(digit)) {
            if num >= 2 {
                result *= num
            } else {
                result += num
            }
        }
    }
    
    
    return result
}

calcMaxNumByString("02984")

/* 모험가 길드
 한 마을에 모험가가 N명 있습니다. 모험가 길드에서 N명의 모험가를 대상으로 '공포도'를 측정했는데, 공포도가 높은 모험가는 쉽게 공포를 느껴 위험 상황에서 제대로 대처할 능력이 떨어집니다.
 모험가 길드 장인 동빈이는 모험가 그룹을 안전하게 구성하고자 공포도가 X인 모험가는 반드시 X명 이상 으로 구성한 모험가 그룹에 참여해야 여행을 떠날 수 있도록 규정했습니다.
 동빈이는 최대 몇 개의 모험가 그룹을 만들 수 있는지 궁금합니다. N명의 모험가에 대한 정보가 주어졌을 때, 여행을 떠날 수 있는 그룹 수의 최댓갑을 구하는 프로그램을 작성하시오.
 */

func findMaxPeople(_ n: Int, _ x: [Int]) -> Int {
    var count = 0
    var peopleStack = x.sorted(by: >)
    
    while !peopleStack.isEmpty {
        if let maxN = peopleStack.first {
            var checkStack: [Int] = []
            for _ in 1...maxN {
                checkStack.append(peopleStack.removeFirst())
            }
            if checkStack.count == maxN {
                count += 1
            }
        }
    }
    
    return count
}

findMaxPeople(5, [2,3,1,2,2])

/* 상화좌우: 문제설명
 여행가 A는 N x N 크기의 정사각형 공간 위에 서있습니다. 이 공간은 1x1 크기의 정사각형으로 나누어져 있습니다. 가장 왼쪽 위 좌표는 (1,1)이며, 가장 오른쪽 좌표는 (N,N)에 해당합니다. 여행가 A는 상,하,좌,우 방향으로 이동할 수 있고 시작 좌표는 항상 (a,a)입니다.
 우리 앞에는 여행가 A가 이동할 계획이 적힌 계획서가 놓여져있습니다.
 계획서에는 하나의 줄에 띄어쓰기를 기준으로 하여, L, R, U, D 중 하나의 문자가 반복적으로 적혀 있습니다.
 각 문자의 의미는 다음과 같습니다.
 L: 왼쪽으로 한칸 이동
 R: 오른쪽으로 한칸 이동
 U: 위로 한칸 이동
 D: 아래로 한칸 이동
 이 때 여행가 A가 N x N 크기의 정사각형 공간을 벗어나는 움직임은 무시됩니다. 예를들어 (1,1) 위치에서 L혹은 U를 만나면 무시됩니다. 다음은 N = 5 인 지도와 계획서입니다.
 */


func findXY(_ n: Int, _ direction: String) -> [Int] {
    var currentPosition: [Int] = [1,1]
    let commands: [String] = direction.components(separatedBy: " ")
    commands.forEach { command in
        switch command {
        case "L":
            if currentPosition[0] > 1 {
                currentPosition[0] -= 1
            }
        case "R":
            if currentPosition[0] < n {
                currentPosition[0] += 1
            }
        case "U":
            if currentPosition[1] > 1 {
                currentPosition[1] -= 1
            }
        case "D":
            if currentPosition[1] < n {
                currentPosition[1] += 1
            }
        default:
            print("error")
        }
        print(currentPosition)
    }
    
    return currentPosition
}

findXY(5, "R R R U D D")


/* 시각: 문제 설명
 정수 N이 입력되면 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는 모든 경우의 수를 구하는 프로그램을 작성하시오. 예를 들어 1을 입력했을 때, 다음은 3이 하나라도 포암되어 있으므로 세어야하는 시각입니다.
 00시 00분 03초
 00시 13분 30초 */

func specificTimePossibility(_ n: Int) -> Int {
    var count = 0
    
    for hour in 0...n {
        for minute in 0..<60 {
            for second in 0..<60 {
                let timeString = String(hour) + String(format: "%02d", minute) + String(format: "%02d", second)
                if timeString.contains("3") {
                    count += 1
                }
            }
        }
    }
    
    return count
}

specificTimePossibility(5)


/* 왕실의 나이트
 행복 왕국의 왕실 정원은 체스판과 같은 8x8 좌표 평면 입니다. 왕실 정원의 특정한 한 칸의 나이트가 서있습니다. 나이트는 매우 충성스러운 신하로서 매일 무술을 연마합니다.
 나이트는 말을 타고 있기 때문에 이동을 할 때는 L자 형태로만 이동할 수 있으며, 정원 밖으로는 나갈 수 없습니다.
 나이트는 특정 위치에서 다음과 같은 2가지 경우로 이동할 수 있습니다.
 1. 수평으로 두칸 이동한 뒤에 수직으로 한칸 이동하기
 2. 수직으로 두칸 이동한 뒤에 수평으로 1칸 이동하기 */

func knightMovablePossibility(_ position: String) -> Int {
    let dict: [String:Int] = ["a":1,"b":2,"c":3,"d":4,"e":5,"f":6,"g":7,"h":8]
    
    
    let currentPosition = ArraySlice(position)
    var row = dict[currentPosition[0].lowercased()]
    var column = Int(String(currentPosition[1]))
    
    let steps = [[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1],[1,2],[-1,2],[-2,1]]
    var count = 0
    for step in steps {
        if let x = row,
           let y = column {
            if x + step[0] > 0 && x + step[0] <= 8 && y + step[1] > 0 && y + step[1] <= 8 {
                count += 1
            }
        }
    }
    
    return count
}

knightMovablePossibility("a1")
