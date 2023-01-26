//: [Previous](@previous)

import Foundation

//머쓱이는 RPG게임을 하고 있습니다. 게임에는 up, down, left, right 방향키가 있으며 각 키를 누르면 위, 아래, 왼쪽, 오른쪽으로 한 칸씩 이동합니다. 예를 들어 [0,0]에서 up을 누른다면 캐릭터의 좌표는 [0, 1], down을 누른다면 [0, -1], left를 누른다면 [-1, 0], right를 누른다면 [1, 0]입니다. 머쓱이가 입력한 방향키의 배열 keyinput와 맵의 크기 board이 매개변수로 주어집니다. 캐릭터는 항상 [0,0]에서 시작할 때 키 입력이 모두 끝난 뒤에 캐릭터의 좌표 [x, y]를 return하도록 solution 함수를 완성해주세요.


func findPosition(_ keyinput:[String], _ board:[Int]) -> [Int] {
    let xMax = board[0]/2
    let xMin = -board[0]/2
    let yMax = board[1]/2
    let yMin = -board[1]/2
    var x: Int = 0
    var y: Int = 0
    
    for key in keyinput {
        switch key {
        case "up":
            y = y+1 > yMax ? yMax : y+1
        case "down":
            y = y-1 < yMin ? yMin : y-1
        case "left":
            x = x-1 < xMin ? xMin : x-1
        case "right":
            x = x+1 > xMax ? xMax : x+1
        default:
            continue
        }
    }
    return [x, y]
}
findPosition(["left", "right", "up", "right", "right"], [11,11])
findPosition(["down", "down", "down", "down", "down"], [7,9])

//머쓱이는 큰 종이를 1 x 1 크기로 자르려고 합니다.
//예를 들어 2 x 2 크기의 종이를 1 x 1 크기로 자르려면 최소 가위질 세 번이 필요합니다.
func minCutCount(_ M:Int, _ N:Int) -> Int {
    return M - 1 + (N - 1) * M
}

//2차원 좌표 평면에 변이 축과 평행한 직사각형이 있습니다.
//직사각형 네 꼭짓점의 좌표 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]가 담겨있는 배열 dots가
//매개변수로 주어질 때, 직사각형의 넓이를 return 하도록 solution 함수를 완성해보세요.
func getRectangleArea(_ dots:[[Int]]) -> Int {
    var list: [Double] = []
    
    for i in 1..<dots.count {
        let base = abs(dots[i][0] - dots[0][0])
        let height = abs(dots[i][1] - dots[0][1])
        
        list.append(sqrt(Double((base * base) + (height * height))))
    }
    return list.filter { $0 != list.max() }.reduce(1) { $0 * Int($1) }
}
getRectangleArea([[1, 1], [2, 1], [2, 2], [1, 2]])
getRectangleArea([[-1, -1], [1, 1], [1, -1], [-1, 1]])

//머쓱이는 프로그래머스에 로그인하려고 합니다. 머쓱이가 입력한 아이디와 패스워드가 담긴 배열 id_pw와 회원들의 정보가 담긴 2차원 배열 db가 주어질 때, 다음과 같이 로그인 성공, 실패에 따른 메시지를 return하도록 solution 함수를 완성해주세요.
//
//아이디와 비밀번호가 모두 일치하는 회원정보가 있으면 "login"을 return합니다.
//로그인이 실패했을 때 아이디가 일치하는 회원이 없다면 “fail”를, 아이디는 일치하지만 비밀번호가 일치하는 회원이 없다면 “wrong pw”를 return 합니다.

func login(_ id_pw:[String], _ db:[[String]]) -> String {
    var database = Dictionary<String, String>()
    for data in db {
        database[data[0]] = data[1]
    }
    for (key, value) in database {
        if key == id_pw[0] && value == id_pw[1] {
            return "login"
        } else if key == id_pw[0] && value != id_pw[1] {
            return "wrong pw"
        }
    }
    return "fail"
}

login(["meosseugi", "1234"], [["rardss", "123"], ["yyoom", "1234"], ["meosseugi", "1234"]])

// 문제 설명
// 문자열 "hello"에서 각 문자를 오른쪽으로 한 칸씩 밀고 마지막 문자는 맨 앞으로 이동시키면 "ohell"이 됩니다. 이것을 문자열을 민다고 정의한다면 문자열 A와 B가 매개변수로 주어질 때, A를 밀어서 B가 될 수 있다면 밀어야 하는 최소 횟수를 return하고 밀어서 B가 될 수 없으면 -1을 return 하도록 solution 함수를 완성해보세요.

func combinationString(_ A:String, _ B:String) -> Int {
    if A == B { return 0 }
    var str = A
    for i in 0..<A.count {
        var arr = Array(str)
        arr.insert(arr.popLast()!, at: 0)
        str = arr.map{ String($0) }.joined()
        if str == B {
            return i + 1
        }
    }
    return -1
}
combinationString("hello", "ohell")

//덧셈, 뺄셈 수식들이 'X [연산자] Y = Z' 형태로 들어있는 문자열 배열 quiz가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.

func calc(_ numArr: Array<Substring>, _ operateArr:Array <Substring>) -> String {
    var result: Int = 0
    result = operateArr[0] == "+" ? Int(numArr[0])! + Int(numArr[1])! : Int(numArr[0])! - Int(numArr[1])!
    if result == Int(numArr[2])! {
        return "O"
    } else {
        return "X"
    }
}
func OXQuiz(_ quiz:[String]) -> [String] {
    var answer: [String] = []
    for str in quiz {
        let numArr = str.split(separator: " ").filter { $0 != "+" && $0 != "-" && $0 != "="}
        let operateArr = str.map { $0.isNumber ? " " : String($0) }.joined().split(separator: " ")
        answer.append(calc(numArr, operateArr))
    }
    return answer
}
OXQuiz(["3 - 4 = -3", "5 + 6 = 11"])
OXQuiz(["19 - 6 = 13", "5 + 66 = 71", "5 - 15 = 63", "3 - 1 = 2"])

func operateValidation(_ quiz: String) -> String {
    let array = quiz.components(separatedBy: ["=", " "]).filter { $0 != ""}
    if array[1] == "+" {
        return Int(array[0])! + Int(array[2])! == Int(array[3])! ? "O" : "X"
    } else {
        return Int(array[0])! - Int(array[2])! == Int(array[3])! ? "O" : "X"
    }
}

func OXQUIZ2(_ quiz:[String]) -> [String] {
    return quiz.map { operateValidation($0) }
}

//연속된 세 개의 정수를 더해 12가 되는 경우는 3, 4, 5입니다.
//두 정수 num과 total이 주어집니다. 연속된 수 num개를 더한 값이 total이 될 때,
//정수 배열을 오름차순으로 담아 return하도록 solution함수를 완성해보세요.

func consecutiveNums(_ num:Int, _ total:Int) -> [Int] {
    var answer: [Int] = []
    let median: Double = Double(total)/Double(num)
    for i in 0..<num {
        if num % 2 == 1 {
            answer.append(Int(median) - Int(trunc(Double(num/2))) + i)
        } else {
            answer.append(Int(median) - (num-1)/2 + i)
        }
    }
    
    return answer
}
consecutiveNums(1, 3)
consecutiveNums(3, 9)
consecutiveNums(5, 15)
consecutiveNums(2, 7)
consecutiveNums(4, 14)


//기약분수로 나타내었을 때, 분모의 소인수가 2와 5만 존재해야 합니다.
//두 정수 a와 b가 매개변수로 주어질 때, a/b가 유한소수이면 1을, 무한소수라면 2를 return하도록 solution 함수를 완성해주세요.

func checkInfinity(_ a:Int, _ b:Int) -> Int {
    func gcd(_ a:Int, _ b:Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a%b)
    }
    
    // 소인수분해
    func factorization(_ n: Int) -> [Int] {
        var numSet = Set<Int>()
        var num = n
        
        for i in 2...n {
            while num % i == 0 {
                num /= i
                numSet.insert(i)
            }
        }
        
        return Array(numSet)
    }
    
    let denom = b / gcd(a, b)
    if denom == 1 {
        return 1
    }
    for i in factorization(denom) {
        if i != 5 && i != 2 {
            return 2
        }
    }
    
    return 1
}

//: [Next](@next)
