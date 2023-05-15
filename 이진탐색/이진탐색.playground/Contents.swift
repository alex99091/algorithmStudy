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
