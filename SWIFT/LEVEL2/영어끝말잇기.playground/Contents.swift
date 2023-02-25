import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var eachPersonStack = makeEachStack(n)
    var usedWords = [String]()
    var answer = [Int]()
    for i in 0..<words.count{
        // 시작단어는 무조건 추가
        if i == 0 {
            eachPersonStack[0].append(words[0])
        } else {
            let currentStackIndex = i % n
            let previous = (i - 1) % n
            if words[i].first == eachPersonStack[previous].last?.last && !usedWords.contains(words[i]) {
                eachPersonStack[currentStackIndex].append(words[i])
            } else {
                answer.append(currentStackIndex + 1)
                answer.append(eachPersonStack[currentStackIndex].count + 1)
                break
            }
        }
        // 사용단어 체크
        usedWords.append(words[i])
    }
    return answer.isEmpty ? [0,0] : answer
}

func makeEachStack(_ n: Int) -> [[String]] {
    let emptyArray = [String]()
    var resultArray = [[String]]()
    for _ in 1...n {
        resultArray.append(emptyArray)
    }
    return resultArray
}

solution(3,["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])
solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])

