//: [Previous](@previous)

import Darwin

//머쓱이는 친구들과 369게임을 하고 있습니다.
//369게임은 1부터 숫자를 하나씩 대며 3, 6, 9가
//들어가는 숫자는 숫자 대신 3, 6, 9의 개수만큼 박수를 치는 게임입니다.
//머쓱이가 말해야하는 숫자 order가 매개변수로 주어질 때, 머쓱이가 쳐야할 박수 횟수를
//return 하도록 solution 함수를 완성해보세요.

func cntClaps(_ order:Int) -> Int {
    let array = ArraySlice(String(order))
    var answer: Int = 0
    for i in array {
        if i == "3" || i == "6" || i == "9" {
            answer += 1
        }
    }
    return answer
}
cntClaps(29423)

//영어 대소문자로 이루어진 문자열 my_string이 매개변수로 주어질 때,
//my_string을 모두 소문자로 바꾸고 알파벳 순서대로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요.

func lowercaseAndsort(_ my_string: String) -> String{
    let array = ArraySlice(my_string.lowercased()).sorted()
    return array.map { String($0) }.reduce("", +)
}
lowercaseAndsort("Python")

//약수의 개수가 세 개 이상인 수를 합성수라고 합니다.
//자연수 n이 매개변수로 주어질 때 n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.
func combinedNumber(_ n: Int) -> Int {
    // 약수 개수 구하는 function getNUM
    func getNUM(_ n2: Int) -> Int {
        var cnt = 0
        for i in 1...n2 {
            if n2 % i == 0 {
                cnt += 1
            }
        }
        return cnt
    }
    
    return (1...n).filter { getNUM($0) >= 3 }.count
}

//머쓱이는 친구에게 모스부호를 이용한 편지를 받았습니다.
//그냥은 읽을 수 없어 이를 해독하는 프로그램을 만들려고 합니다.
//문자열 letter가 매개변수로 주어질 때, letter를 영어 소문자로 바꾼 문자열을
//return 하도록 solution 함수를 완성해보세요.
//모스부호는 다음과 같습니다.
//
//morse = {
//    '.-':'a','-...':'b','-.-.':'c','-..':'d','.':'e','..-.':'f',
//    '--.':'g','....':'h','..':'i','.---':'j','-.-':'k','.-..':'l',
//    '--':'m','-.':'n','---':'o','.--.':'p','--.-':'q','.-.':'r',
//    '...':'s','-':'t','..-':'u','...-':'v','.--':'w','-..-':'x',
//    '-.--':'y','--..':'z'
//}

func translateMorse(_ letter: String) -> String {
    let morse: Dictionary<String, String> =
    [".-":"a","-...":"b","-.-.":"c","-..":"d",".":"e","..-.":"f",
     "--.":"g","....":"h","..":"i",".---":"j","-.-":"k",".-..":"l",
     "--":"m","-.":"n","---":"o",".--.":"p","--.-":"q",".-.":"r",
     "...":"s","-":"t","..-":"u","...-":"v",".--":"w","-..-":"x",
     "-.--":"y","--..":"z"]
    var result = letter.split(separator: " ")
    var answer = ""
    for i in result {
        print(i)
        for(key, value) in morse {
            if key == String(i) {
                answer.append(value)
            }
        }
    }
    
    return answer
}

func translateMorse2(_ letter: String) -> String {
    let morse: Dictionary<String, String> =
    [".-":"a","-...":"b","-.-.":"c","-..":"d",".":"e","..-.":"f",
     "--.":"g","....":"h","..":"i",".---":"j","-.-":"k",".-..":"l",
     "--":"m","-.":"n","---":"o",".--.":"p","--.-":"q",".-.":"r",
     "...":"s","-":"t","..-":"u","...-":"v",".--":"w","-..-":"x",
     "-.--":"y","--..":"z"]
    
    var answer = letter.split(separator: " ")
    
    return answer.map { data -> String in
        morse[String(data)]!
    }.joined()
}

translateMorse(".... . .-.. .-.. ---")
translateMorse2(".--. -.-- - .... --- -.")
//: [Next](@next)
//
//문자열 my_string이 매개변수로 주어집니다.
//my_string에서 중복된 문자를 제거하고 하나의 문자만 남긴 문자열을 return하도록 solution 함수를 완성해주세요.

func solution(_ my_string: String) -> String {
    var answer: String = ""
    for i in my_string {
        if answer.contains(i) == false {
            answer.append(String(i))
        }
    }
    return answer
}

//i팩토리얼 (i!)은 1부터 i까지 정수의 곱을 의미합니다.
//예를들어 5! = 5 * 4 * 3 * 2 * 1 = 120 입니다.
//정수 n이 주어질 때 다음 조건을 만족하는 가장 큰 정수 i를 return 하도록 solution 함수를 완성해주세요.

func findLessthanFactorial(_ n: Int) -> Int {
    func factorial(_ num:Int) -> Int {
        if num < 2 { return num }
        return factorial( num - 1 ) * num
    }
    var result = 0
    while factorial( result ) <= n {
        result += 1
    }
    return result - 1
}

findLessthanFactorial(7)

//정수 배열 num_list와 정수 n이 매개변수로 주어집니다.
//num_list를 다음 설명과 같이 2차원 배열로 바꿔 return하도록 solution 함수를 완성해주세요.
//
//num_list가 [1, 2, 3, 4, 5, 6, 7, 8] 로 길이가 8이고 n이 2이므로
//num_list를 2 * 4 배열로 다음과 같이 변경합니다. 2차원으로 바꿀 때에는 num_list의
//원소들을 앞에서부터 n개씩 나눠 2차원 배열로 변경합니다.

func getSecondDimension(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var list: [[Int]] = []
    
    for i in 0..<num_list.count / n {
        list.append(Array(num_list[i*n..<i*n+n]))
    }
    
    return list
}

//1부터 13까지의 수에서, 1은 1, 10, 11, 12, 13 이렇게 총 6번 등장합니다.
//정수 i, j, k가 매개변수로 주어질 때, i부터 j까지 k가 몇 번 등장하는지 return 하도록 solution 함수를 완성해주세요.

func findNumCnt(_ i: Int, _ j: Int, _ k: Int) -> Int {
    var count: Int = 0
    for n in i...j {
        count += String(n).filter { $0 == Character(String(k)) }.count
    }
    return count
}
findNumCnt(1, 13, 6)

func findNumCnt2(_ i: Int, _ j: Int, _ k: Int) -> Int {
    return
    (i...j).map {
        String($0).filter { String($0) == String(k) }.count
    }.reduce(0, +)
}
findNumCnt(1, 13, 6)
