import Foundation

func solution(_ book_time:[[String]]) -> Int {
    let sortedBookTime = book_time.sorted(by: { $0[0] < $1[0] })
    var occupiedRooms = [(String, String)]()
    var count = 0
    
    for booking in sortedBookTime {
        let startTime = booking[0]
        let endTime = booking[1]
        var roomFound = false
        
        for i in 0..<occupiedRooms.count {
            let occupiedRoom = occupiedRooms[i]
            if addTenMin(occupiedRoom.1) <= startTime {
                // 이전 예약이 끝나는 시간이 현재 예약 시작 시간보다 같거나 작으면
                // 이전 예약 방을 사용하고, 예약 종료 시간을 갱신
                occupiedRooms[i] = (occupiedRoom.0, endTime)
                roomFound = true
                break
            }
        }
        
        if !roomFound {
            // 모든 예약 방이 현재 예약 시간에 사용 중이므로 새로운 방을 추가
            occupiedRooms.append((startTime, endTime))
            count += 1
        }
        print(occupiedRooms)
    }
    
    return count
}

func addTenMin(_ endTime: String) -> String {
    let time = endTime.components(separatedBy: ":")
    var hour = Int(time[0])!
    var minute = Int(time[1])!
    hour += minute + 10 >= 60 ? 1 : 0
    minute %= 60
    return String(hour) + ":" + String(minute)
}
solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]])
solution([["10:20", "12:30"], ["10:20", "12:30"], ["10:20", "12:30"]])
