//두 개 뽑아서 더하기
//문제 설명
//정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    let arr = comb(numbers, 2)
    var answer = [Int]()
    for i in arr {
        let cnt = i.reduce(0, +)
        if !answer.contains(cnt) {
            answer.append(cnt)
        }
    }
    
    return answer.sorted(by: <)
}

func comb(_ numbers:[Int], _ count:Int) -> [[Int]] {
    var result = [[Int]]()

    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == count {
            result.append(nowCombi)
            return
        }
        for i in index..<numbers.count {
            combination(i + 1, nowCombi + [numbers[i]])
        }
    }

    combination(0, [])

    return result
}


solution([2,1,3,4,1]) // [2,3,4,5,6,7]
solution([5,0,2,7]) // [2,5,7,9,12]

func solution2(_ numbers:[Int]) -> [Int] {

    var arr:[Int] = []

    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            arr.append(numbers[i]+numbers[j])
        }
    }

    return Set(arr).sorted()
}
solution2([2,1,3,4,1]) // [2,3,4,5,6,7]
