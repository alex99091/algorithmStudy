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
