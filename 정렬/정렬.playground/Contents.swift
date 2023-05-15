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
        var current = result[i]
        for j in 0...i {
            if result[j] > current {
                var temp = result[i]
                result[i] = result[j]
                result[j] = temp
            }
        }
    }
    
    return result
}

insertSort(dataList)

// 위의 함수를 아래와 같이 리팩토링
func insertionSort(_ dataList: [Int]) -> [Int] {
    var result = dataList
    
    for i in 1..<result.count {
        var j = i
        while j > 0 && result[j] < result[j-1] {
            result.swapAt(j, j-1)
            j -= 1
        }
    }
    
    return result
}
insertionSort(dataList)

/* 삽입 정렬의 시간 복잡도
 삽입 정렬의 시간 복잡도는 O(N^2)이며, 선택정렬과 마찬가지로 반복문이 두번 중첩되어 사용됩니다.
 삽입 정렬은 현재 리스트의 데이터가 거의 정렬되어 있는 상태라면 매우 빠르게 동작합니다.
 - 최선의 경우 O(N)의 시간 복잡도를 가집니다. */

// 퀵 정렬
/* 기준 데이터를 설정하고 그 기준보다 큰 데이터와 작은 데이터의 위치를 바꾸는 방법입니다.
 일반적인 상황에서 가장 많이 사용되는 알고리즘 중 하나입니다.
 병합 정렬과 더불어 대부분의 프로그래밍 언어의 정렬 라이브러리의 근간이 되는 알고리즘 입니다.
 가장 기본적인 퀵 정렬은 첫번째 데이터의 기준 데이터(Pivot)을 설정합니다.*/

func quickSort(_ dataList: [Int]) -> [Int] {
    guard dataList.count > 1 else { return dataList }
    
    let pivot = dataList[dataList.count/2] // pivot element 선정
    let left = dataList.filter { $0 < pivot } // pivot보다 작은 원소들
    let equal = dataList.filter { $0 == pivot } // pivot과 같은 원소들
    let right = dataList.filter { $0 > pivot } // pivot보다 큰 원소들
    
    return quickSort(left) + equal + quickSort(right) // 재귀 호출
}

quickSort(dataList)

// 퀵 정렬의 시간 복잡도는 평균 O(NlogN)의 복잡도를 지닙니다.

// 계수 정렬
/*
 특정한 조건이 부합할 때만 사용할 수 있지만 매우 빠르게 동작하는 알고리즘 입니다.
 계수 정렬은 데이터의 크기 범위가 제한되어 정수 형태로 표현할 수 있을 때 사용 가능합니다.
 데이터의 개수가 N, 데이터(양수) 중 최댓값 K일 때 최악의 경우에도 수행 시간 O(N+K)를 보장합니다.
 */

// 계수 정렬의 시간복잡도는 모두 O(N+K)입니다.
// 동일한 값의 데이터를 가지는 갯수가 많을 수록 효율적입니다.
let dataList2 = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]

func factorSort(_ dataList2: [Int]) -> [Int] {
    var checkDict: [Int: Int] = [:]
    
    dataList2.forEach { data in
        if let count = checkDict[data] {
            checkDict[data] = count + 1
        } else {
            checkDict[data] = 1
        }
    }
    var result: [Int] = []
    
    for i in 0...9 {
        if let count = checkDict[i] {
            for _ in 1...count {
                result.append(i)
            }
        }
    }
    
    return result
}

factorSort(dataList2)

func countingSort(_ arr: [Int]) -> [Int] {
    var countingArray = Array(repeating: 0, count: arr.max()! + 1)
    
    for element in arr {
        countingArray[element] += 1
    }
    
    var result = [Int]()
    
    for (index, count) in countingArray.enumerated() {
        guard count > 0 else { continue }
        let elements = Array(repeating: index, count: count)
        result.append(contentsOf: elements)
    }
    
    return result
}

countingSort(dataList2)
