import Foundation

/* 정렬 알고리즘
 정렬(Sorting)이란 데이터를 특정한 기준에 따라 순서대로 나열하는 것을 의미합니다.
 일반적으로 문제 상황에 따라서 적절한 정렬 알고리즘이 공식처럼 사용됩니다. */

let dataList = [7,5,9,0,3,1,6,2,4,8]

// 위의 datList를 정렬하기
/* 1. 선택정렬
 처리되지 않은 데이터 중에서 가장 작은 데이터를 선택해 맨 앞의 데이터와 바꾸는 것을 반복한다. */

func selectSort(_ dataList: [Int]) -> [Int] {
    var result = dataList
    var min = 0
    for i in 0..<result.count {
        min = i
        for j in i+1..<result.count {
            if result[min] > result[j] {
                min = j
            }
        }
        if min != i {
            result.swapAt(i, min)
        }
    }
    return result
}

selectSort(dataList)

// 선택 정렬의 시간 복잡도
/* 선택 정렬은 N번 만큼 가장 작은 수를 찾아서 맨 앞으로 보내야 합니다.
 구현 방식에 따라서 사소한 오차는 있을 수 있지만, 전체 연산 횟수는 다음과 같습니다.
 N + (N - 1) + (N - 2) + ... + 2
 이는 (N^2 + N - 2)/2로 표현할 수 있는데, 빅오 표기법에 따라서 O(N^2)라고 작성합니다. */

// 삽입 정렬
/* 처리되지 않은 데이터를 하나씩 골라 적절한 위치에 삽입합니다. 선택정렬보다 일반적으로 더 효율적으로 동작합니다. */

func insertSort(_ dataList:[Int]) -> [Int] {
    var result = dataList
    
    for i in 0..<result.count {
        var min = result[i]
        for j in 0...i {
            
        }
        print("min: \(min), result[i]: \(result[i]), list: \(result)")
    }
    
    return result
}

insertSort(dataList)
