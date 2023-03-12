import Foundation

// 계속 실패 ..

func addTenMinutes(_ time: String) -> String {
    let timeComponents = time.components(separatedBy: ":")
    
    guard var hour = Int(timeComponents.first ?? ""),
          var minute = Int(timeComponents.last ?? "") else {
        return time
    }
    
    minute += 10
    hour += minute / 60
    minute %= 60
    
    return String(format: "%02d:%02d", hour, minute)
}

func compareTime(start: String, end: String) -> Bool {
    let startColonRemoved = start.components(separatedBy: ":").reduce("", +)
    let endColonRemoved = end.components(separatedBy: ":").reduce("", +)
    
    if let startInt = Int(startColonRemoved), let endInt = Int(endColonRemoved) {
        return startInt >= endInt
    }
    return false
}


func solution(_ book_time:[[String]]) -> Int {
    // 예약 시간을 시작 시간을 기준으로 정렬
    let sorted_book_time = book_time.sorted(by: { $0[0] < $1[0] })
    
    // 빈 객실의 시작 시간과 끝 시간을 저장할 리스트
    var empty_rooms = [(String, String)]()
    
    // 최소 객실 수를 저장할 변수
    var min_rooms = 0
    
    // 모든 예약 시간에 대해 루프를 돕니다.
    for booking in sorted_book_time {
        let start_time = booking[0] // 시작 시간
        let end_time = booking[1] // 끝 시간
        
        // 현재 예약과 충돌하는 객실이 있는지 확인합니다.
        var room_found = false
        for i in 0..<empty_rooms.count {
            let empty_room = empty_rooms[i]
            if empty_room.1 <= start_time {
                // 현재 예약이 시작할 수 있는 시간과 이전에 청소가 끝난 시간을 비교합니다.
                // 만약 현재 예약이 시작할 수 있는 시간이 이전에 청소가 끝난 시간보다 이후라면,
                // 빈 객실을 사용할 수 있습니다.
                empty_rooms[i] = (start_time, end_time) // 빈 객실을 새로운 예약 시간으로 갱신합니다.
                room_found = true
                break
            }
        }
        
        // 빈 객실을 사용할 수 없는 경우 새로운 객실을 추가합니다.
        if !room_found {
            empty_rooms.append((start_time, end_time))
            min_rooms += 1 // 최소 객실 수를 증가시킵니다.
        }
    }
    
    return min_rooms
}


solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]])
//solution([["10:20", "12:30"], ["10:20", "12:30"], ["10:20", "12:30"]])
