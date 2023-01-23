//: [Previous](@previous)

import Foundation

// 문자열 str1, str2가 매개변수로 주어집니다.
// str1 안에 str2가 있다면 1을 없다면 2를 return하도록 solution 함수를 완성해주세요.
func removeStr(_ str1: String, _ str2: String) -> Int{
    return str1.contains(str2) ? 1 : 2
}

removeStr("ab6CDE443fgh22iJKlmn1o", "6CD") // 1
removeStr("ppprrrogrammers", "pppp") // 2
//: [Next](@next)


//문자열 my_string이 매개변수로 주어집니다.
//my_string안의 모든 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
func addallstrings(_ my_string: String) -> Int {
    var intArr: [Int?] = []
    var result: Int = 0
    for i in my_string {
        intArr.append(Int(String(i)))
    }
    for i in intArr {
        if let i = i {
            result += i
        }
    }
    print(intArr)
    return result
}

func addallstrings2(_ my_string: String) -> Int {
    return my_string.compactMap { Int(String($0)) }.reduce(0) { $0 + $1 }
}
addallstrings("aAb1B2cC34oOp")
addallstrings2("aAb1B2cC34oOp")

// 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다.
// 문자열 my_string이 매개변수로 주어질 때 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.
func removeVowel(_ my_string: String) -> String {
    return my_string.components(separatedBy: ["a","e","i","o","u"]).joined()
}
removeVowel("nice to meet you")

//개미 군단이 사냥을 나가려고 합니다.
//개미군단은 사냥감의 체력에 딱 맞는 병력을 데리고 나가려고 합니다.
//장군개미는 5의 공격력을, 병정개미는 3의 공격력을 일개미는 1의 공격력을 가지고 있습니다.
//예를 들어 체력 23의 여치를 사냥하려고 할 때, 일개미 23마리를 데리고 가도 되지만,
//장군개미 네 마리와 병정개미 한 마리를 데리고 간다면 더 적은 병력으로 사냥할 수 있습니다.
//사냥감의 체력 hp가 매개변수로 주어질 때,
//사냥감의 체력에 딱 맞게 최소한의 병력을 구성하려면 몇 마리의 개미가 필요한지를
//return하도록 solution 함수를 완성해주세요.

func antHunting(_ hp: Int) -> Int {
    var answer: Int = 0
    answer += hp / 5
    answer += hp % 5 / 3
    answer += hp % 5 % 3
    return answer
}

//어떤 세균은 1시간에 두배만큼 증식한다고 합니다.
//처음 세균의 마리수 n과 경과한 시간 t가 매개변수로 주어질 때
//t시간 후 세균의 수를 return하도록 solution 함수를 완성해주세요.

func countBackteria(_ n: Int, _ t: Int) -> Int {
    return n * Int(pow(Float(2), Float(t)))
}
countBackteria(2, 10)

//정수 n과 정수 배열 numlist가 매개변수로 주어질 때,
//numlist에서 n의 배수가 아닌 수들을 제거한 배열을 return하도록 solution 함수를 완성해주세요.

func findNumlist(_ n: Int, _ numlist: [Int]) -> [Int] {
    var answer: [Int] = []
    for i in numlist {
        if i % n == 0 {
            answer.append(i)
        }
    }
    return answer
}

func findNumlist2(_ n: Int, _ numlist: [Int]) -> [Int] {
    return numlist.filter { $0 % n == 0 }
}

//문자열 my_string이 매개변수로 주어질 때,
//대문자는 소문자로 소문자는 대문자로 변환한 문자열을
//return하도록 solution 함수를 완성해주세요.
func changeUpperLowercased(_ my_string: String) -> String {
    var answer = ""
    for i in my_string {
        if i.isUppercase {
            answer.append(i.lowercased())
        } else {
            answer.append(i.uppercased())
        }
    }
    return answer
}
func changeUpperLowercased2(_ my_string: String) -> String {
    return my_string.map { $0.isUppercase ? $0.lowercased() : $0.uppercased()}.reduce("", +)
}

changeUpperLowercased("abcABC")
changeUpperLowercased2("kbsMBC")

//암호화된 문자열 cipher를 주고받습니다.
//그 문자열에서 code의 배수 번째 글자만 진짜 암호입니다.
//문자열 cipher와 정수 code가 매개변수로 주어질 때 해독된 암호 문자열을 return하도록 solution 함수를 완성해주세요.

func findCipher(_ cipher: String,_ code: Int) -> String {
    var count = 1
    var result = ""
    for i in cipher {
        if count % code == 0 {
            result += String(i)
        }
        count += 1
    }
    return result
}

func findCipher2(_ cipher: String,_ code: Int) -> String {
    var answer = ""

     for (i, s) in cipher.enumerated() {
         if (i+1)%code == 0 {
             answer += String(s)
         }
     }
     return answer
}

findCipher("asdAasdBasdCefwD", 4)

//가위는 2 바위는 0 보는 5로 표현합니다.
//가위 바위 보를 내는 순서대로 나타낸 문자열 rsp가 매개변수로 주어질 때,
//rsp에 저장된 가위 바위 보를 모두 이기는 경우를 순서대로 나타낸 문자열을
//return하도록 solution 함수를 완성해보세요.
func winRSP(_ rsp: String) -> String {
    var answer = ""
    for i in rsp {
        if i == "2" {
            answer.append("0")
        } else if i == "0" {
            answer.append("5")
        } else {
            answer.append("2")
        }
    }
    return answer
}

func winRSP2(_ rsp: String) -> String {
    var answer = ""
    for i in rsp {
        i == "2" ? answer.append("0") : i == "0" ? answer.append("5") : answer.append("2")
    }
    return answer
}

func winRSP3(_ rsp: String) -> String {
    return rsp.map {$0 == "0" ? "5" : $0 == "2" ? "0" : "2"}.joined()
}

//"*"의 높이와 너비를 1이라고 했을 때,
//"*"을 이용해 직각 이등변 삼각형을 그리려고합니다.
//정수 n 이 주어지면 높이와 너비가 n 인 직각 이등변 삼각형을 출력하도록 코드를 작성해보세요.

//func printTriangle(_ n: Int) -> Int {
//
//    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
//    for i in 1...n[0] {
//        print(String(repeating: "*", count: i))
//    }
//    return 0
//}
print("--------")
//머쓱이는 직육면체 모양의 상자를 하나 가지고 있는데
//이 상자에 정육면체 모양의 주사위를 최대한 많이 채우고 싶습니다.
//상자의 가로, 세로, 높이가 저장되어있는 배열 box와 주사위 모서리의 길이 정수 n이 매개변수로 주어졌을 때,
//상자에 들어갈 수 있는 주사위의 최대 개수를 return 하도록 solution 함수를 완성해주세요.
func countBoxes(_ box: [Int], _ n: Int) -> Int {
    var answer: Int = 1
    for i in box {
        answer *= Int(i) / n
    }
    return answer
}
func countBoxes2(_ box: [Int], _ n: Int) -> Int {
    return box.map { $0 / n }.reduce(1, *)
}
countBoxes([10, 8, 6], 3)
countBoxes2([10, 8, 6], 3)

//문자열 my_string이 매개변수로 주어질 때,
//my_string 안에 있는 숫자만 골라 오름차순 정렬한 리스트를 return 하도록
//solution 함수를 작성해보세요.
func findNumAndSortinString(_ my_string: String) -> [Int] {
    var answer: [Int] = []
    for i in my_string {
        if i.isNumber {
            answer.append(Int(String(i))!)
        }
    }
    return answer.sorted()
}
func findNumAndSortinString2(_ my_string: String) -> [Int] {
    return my_string.filter { $0.isNumber }.map{ Int(String($0))! }.sorted()
}
findNumAndSortinString("hi12392")
