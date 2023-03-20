/* 주차 요금 계산
 주차장의 요금표와 차량이 들어오고(입차) 나간(출차) 기록이 주어졌을 때, 차량별로 주차 요금을 계산하려고 합니다. 아래는 하나의 예시를 나타냅니다.
 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 180             5000         10         600
 
 입/출차 기록
 시각(시:분)    차량 번호    내역
 05:34    5961    입차
 06:00    0000    입차
 06:34    0000    출차
 07:59    5961    출차
 07:59    0148    입차
 18:59    0000    입차
 19:09    0148    출차
 22:59    5961    입차
 23:00    5961    출차
 
 자동차별 주차 요금
 차량 번호    누적 주차 시간(분)    주차 요금(원)
 0000    34 + 300 = 334    5000 + ⌈(334 - 180) / 10⌉ x 600 = 14600
 0148    670    5000 +⌈(670 - 180) / 10⌉x 600 = 34400
 5961    145 + 1 = 146    5000
 어떤 차량이 입차된 후에 출차된 내역이 없다면, 23:59에 출차된 것으로 간주합니다.
 0000번 차량은 18:59에 입차된 이후, 출차된 내역이 없습니다. 따라서, 23:59에 출차된 것으로 간주합니다.
 00:00부터 23:59까지의 입/출차 내역을 바탕으로 차량별 누적 주차 시간을 계산하여 요금을 일괄로 정산합니다.
 누적 주차 시간이 기본 시간이하라면, 기본 요금을 청구합니다.
 누적 주차 시간이 기본 시간을 초과하면, 기본 요금에 더해서, 초과한 시간에 대해서 단위 시간 마다 단위 요금을 청구합니다.
 초과한 시간이 단위 시간으로 나누어 떨어지지 않으면, 올림합니다.
 ⌈a⌉ : a보다 작지 않은 최소의 정수를 의미합니다. 즉, 올림을 의미합니다.
 주차 요금을 나타내는 정수 배열 fees, 자동차의 입/출차 내역을 나타내는 문자열 배열 records가 매개변수로 주어집니다. 차량 번호가 작은 자동차부터 청구할 주차 요금을 차례대로 정수 배열에 담아서 return 하도록 solution 함수를 완성해주세요. */

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var recordedTime: [String:Int] = [:]
    var recordedDictionary: [String:String] = [:]
    
    records.forEach { record in
        let recordArray = record.components(separatedBy: " ")
        if recordArray[2] == "IN" {
            recordedDictionary[recordArray[1]] = recordArray[0]
        } else {
            if let inTime = recordedDictionary[recordArray[1]] {
                recordedTime[recordArray[1], default: 0] += calculateTime(inTime, recordArray[0])
                recordedDictionary[recordArray[1]] = nil
            }
        }
    }
    
    // 출차기록이 없으면 23:59분으로 계산해서 시간 추가
    recordedDictionary.forEach { key, value in
        recordedTime[key] = (recordedTime[key] ?? 0) + calculateTime(value, "23:59")
    }
    recordedDictionary.removeAll()
    
    // 차번호 순서대로 정렬하여 금액 계산
    let sortedRecordedTime = recordedTime.sorted(by: { $0.key < $1.key })
    return sortedRecordedTime.map({ calculateFee(fees, $0.value) })
}



func calculateTime(_ inTime:String, _ outTime:String) -> Int {
    let inTimeArray = inTime.split(separator: ":")
    let outTimeArray = outTime.split(separator: ":")
    
    if inTimeArray.count == 2, outTimeArray.count == 2,
        let inHour = Int(inTimeArray[0]), let inMinute = Int(inTimeArray[1]),
        let outHour = Int(outTimeArray[0]), let outMinute = Int(outTimeArray[1]) {
        
        let hour = outHour - inHour + (outMinute < inMinute ? -1 : 0)
        let minute = (outMinute + 60 - inMinute) % 60
        
        return hour * 60 + minute
    }
    
    return 0
}

func calculateFee(_ fees:[Int], _ duration: Int) -> Int {
    if duration <= fees[0] {
        return fees[1]
    } else {
        return Int(ceil(Double(duration - fees[0]) / Double(fees[2]))) * fees[3] + fees[1]
    }
}

solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])
solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"])

solution([1, 461, 1, 10], ["00:00 1234 IN"])
