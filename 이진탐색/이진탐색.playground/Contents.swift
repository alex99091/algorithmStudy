import Foundation

/* 이진 탐색 알고리즘
 
 순차 탐색: 리스트 안에 있는 특정한 데이터를 찾기 위해 앞에서부터 데이터를 하나씩 확인하는 방법
 이진 탐색: 정렬되어 있는 리스트에서 탐색 범위를 절반씩 좁혀가며 데이터를 탐색하는 방법
 - 이진 탐색은 시작점, 중간점, 끝점을 이용하여 탐색 범위를 설정합니다.
 - 단계마다 탐색범위가 2로 나누는 것과 동일하므로 연산 횟수는 log2N에 비례합니다.
 즉, 시간 복잡도는 O(logN)을 보장합니다.
 */

let sortedArray = [0,2,4,6,8,10,12,14,16,18]

// 이미 정렬된 10개의 데이터 중에서 값이 4인 원소를 찾기
/* 1. 시작점: 0, 중간점: 4, 끝점: 9. 인덱스 기준 */

func binarySearch(_ array: [Int], _ target: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end { // 탐색 대상이 더 이상 없을 때까지 반복
        let middle = (start + end) / 2 // 중앙값을 구합니다.
        
        if array[middle] == target { // 찾는 값과 중앙값이 일치하는 경우
            return middle
        } else if array[middle] > target { // 찾는 값이 중앙값보다 작은 경우
            end = middle - 1 // 왼쪽 절반을 대상으로 탐색합니다.
        } else { // 찾는 값이 중앙값보다 큰 경우
            start = middle + 1 // 오른쪽 절반을 대상으로 탐색합니다.
        }
    }
    
    return -1 // 찾는 값이 배열에 없는 경우 -1을 반환합니다.
}

binarySearch(sortedArray, 4)

/* 파라메트릭 서치(Parametric Search)
 파라메트릭 서치란 최적화 문제를 결정 문제('예' 혹은 '아니오')로 바꾸어 해결하는 기법입니다.
 - 예시: 특정한 조건을 만족하는 가장 알맞은 값을 빠르게 찾는 최적화 문제
 일반적으로 코딩 테스트에서 파라메트릭 서치 문제는 이진 탐색을 이용하여 해결할 수 있습니다.*/

// 문제: 떡볶이 떡 만들기
/* 절단기에 높이(H)를 지정하면 줄지어진 떡을 한 번에 절단합니다. 높이가 H보다 긴 떡은 H 위의 부분이 잘릴 것이고 낮은 떡은 잘리지 않습니다.
 예를 들어 높이가 19,14,10,17cm인 떡이 나란히 있고 절단기 높이를 15cm로 지정하면 자른뒤 떡의 높이는
 15,14,10,15가 될것입니다. 잘린 떡의 길이는 차례대로 4,0,0,2cm 입니다. 손님은 6cm 만큼의 길이를 가져 갑니다.
 손님이 왔을 때 요청한 총 길이가 M일때, 적어도 M만큼의 떡을 얻기 위해 설정할 수 있는 높이의 최댓값을 구하시오.*/

func findOptimum(_ arr: [Int], _ m: Int) -> Int {
    var start = 0
    guard var end = arr.max() else { return -1 }
    
    var result = 0
    while start <= end {
        let middle = (start + end) / 2
        
        // 현재 높이로 잘랐을 때 손님이 가져가는 길이 계산
        var totalLength = 0
        for item in arr {
            if item > middle {
                totalLength += item - middle
            }
        }
        
        // 손님이 가져가는 길이가 m보다 크거나 같으면 높이를 더 높일 수 있음
        if totalLength >= m {
            result = middle
            start = middle + 1
        }
        // 손님이 가져가는 길이가 m보다 작으면 높이를 더 낮춰야 함
        else {
            end = middle - 1
        }
    }
    return result
}

findOptimum([19,14,10,17], 6)

// 문제: 정렬된 배열에서 특정 수의 개수 구하기
/*
 N개의 원소를 포함하고 있는 수열이 오름차순으로 정렬되어 있습니다. 이때 이 수열에서 x가 등장하는 횟수를
 계산하세요. 예를 들어, [1,1,2,2,2,2,3]이 있을때, x = 2라면, 현재 수열에서 값이 2인 원소가
 4개이므로 4를 출력합니다.
 단, 이 문제는 시간 복잡도 O(logN)이므로 알고리즘을 설계하지 않으면 시간 초과 판정을 받습니다. */


// 시간복잡도가 O(logN)으로 동작하는 알고리즘이므로, 선형 탐색(Linear Search)로는 접근할 수 없습니다.
// 하지만 데이터가 정렬되어 있기 때문에 이진 탐색을 수행할 수 있습니다.
// 특정 값이 등장하는 첫 번째 인덱스와 마지막 인덱스를 찾아서 문제를 해결할 수 있습니다.
func countSpecificNumber(_ array: [Int], num: Int) -> Int {
    let startIndex = array.firstIndex(of: num) ?? -1
    let endIndex = array.lastIndex(of: num) ?? -1
    
    
    return startIndex == -1 ? -1 : endIndex - startIndex + 1
}

countSpecificNumber([1,1,2,2,2,2,3], num: 2)

// 이진 탐색 함수
func binarySearch(array: [Int], num: Int, isFirstIndex: Bool) -> Int {
    var start = 0
    var end = array.count - 1
    var result = -1
    
    while start <= end {
        let middle = (start + end) / 2
        
        if array[middle] > num {
            end = middle - 1
        } else if array[middle] < num {
            start = middle + 1
        } else {
            result = middle
            
            if isFirstIndex {
                // 현재 위치의 왼쪽 부분에도 동일한 값이 존재하는지 확인합니다.
                end = middle - 1
            } else {
                // 현재 위치의 오른쪽 부분에도 동일한 값이 존재하는지 확인합니다.
                start = middle + 1
            }
        }
    }
    
    return result
}


binarySearch([1,1,2,2,2,2,3], 2)
