/*
 문제 설명
 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.

 예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.
 종류    이름
 얼굴    동그란 안경, 검정 선글라스
 상의    파란색 티셔츠
 하의    청바지
 겉옷    긴 코트
 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.
 */

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesCount: [String: Int] = [:]
    for item in clothes {
        clothesCount[item[1]] = (clothesCount[item[1]] ?? 0) + 1
    }
    print(clothesCount)
    // ((가지 수 + 안 입을 수도 있는 점) * 부위 수) -  하나도 안입은 경우
    return clothesCount.reduce(1){ $0 * ($1.value + 1) } - 1
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])
