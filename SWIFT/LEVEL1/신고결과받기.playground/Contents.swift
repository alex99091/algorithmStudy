import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportDict: [String: [String]] = [:]
    var currentValue: [String] = []
    var checkDict: [String: Int] = [:]
    var answer: [Int] = []
    
    for rep in report {
        let arr = rep.components(separatedBy: " ")
        
        if reportDict.keys.contains(arr[0]){
            currentValue = reportDict[arr[0]]!
        } else {
            currentValue = []
        }
        if arr.count == 2 {
            if !currentValue.contains(arr[1]) && arr[0] != arr[1] {
                currentValue.append(arr[1])
            }
            reportDict.updateValue(currentValue, forKey: arr[0])
        }
    }
    for id in id_list {
        checkDict.updateValue(0, forKey: id)
    }
    
    for (_, value) in reportDict {
        for id in value {
            let count = checkDict[id]!
            checkDict.updateValue(count + 1, forKey: id)
        }
    }
    
    for id in id_list{
        answer.append(checkDict[id]!)
    }
    return answer
}
solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)

