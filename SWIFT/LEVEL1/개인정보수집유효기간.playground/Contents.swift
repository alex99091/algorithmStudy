import Foundation

/*문제 설명
고객의 약관 동의를 얻어서 수집된 1~n번으로 분류되는 개인정보 n개가 있습니다. 약관 종류는 여러 가지 있으며 각 약관마다 개인정보 보관 유효기간이 정해져 있습니다. 당신은 각 개인정보가 어떤 약관으로 수집됐는지 알고 있습니다. 수집된 개인정보는 유효기간 전까지만 보관 가능하며, 유효기간이 지났다면 반드시 파기해야 합니다.
예를 들어, A라는 약관의 유효기간이 12 달이고, 2021년 1월 5일에 수집된 개인정보가 A약관으로 수집되었다면 해당 개인정보는 2022년 1월 4일까지 보관 가능하며 2022년 1월 5일부터 파기해야 할 개인정보입니다.
당신은 오늘 날짜로 파기해야 할 개인정보 번호들을 구하려 합니다.
모든 달은 28일까지 있다고 가정합니다.
다음은 오늘 날짜가 2022.05.19일 때의 예시입니다. */

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let termDict = createTermDict(terms)
    var result: [Int] = []
    for idx in 0..<privacies.count {
        print("today - \(today), endValidatedDate - \(endValidatedDate(termDict, privacies[idx]))")
        if compareDate(today, endValidatedDate(termDict, privacies[idx])) {
            result.append(idx + 1)
        }
    }
    return result
}

func createTermDict(_ terms:[String]) -> [String:Int] {
    var result: [String:Int] = [:]
    for term in terms {
        let temp = term.components(separatedBy: " ")
        result[temp[0]] = Int(temp[1])
    }
    return result
}

func endValidatedDate(_ termDict: [String:Int], _ privacy: String) -> String {
    var result = ""
    let dateArray = privacy.components(separatedBy: ["." , " "])
    if var year = Int(dateArray[0]),
       var month = Int(dateArray[1]),
       var date = Int(dateArray[2]),
       let term = termDict[dateArray[3]] {
        date += 27
        if date > 28 {
            month += date/28
            date %= 28
        }
        month += term - 1
        if month > 12 {
            year += month/12
            month %= 12
            if month == 0 {
                year -= 1
                month = 12
            }
        }
        let stringMonth = month < 10 ? "0" + String(month) : String(month)
        let stringDate = date < 10 ? "0" + String(date) : String(date)
        result = String(year) + "." + stringMonth + "." + stringDate
    }
    return result
}

func compareDate(_ today: String, _ endValidatedDate: String) -> Bool {
    if let todayInt = Int(today.replacingOccurrences(of: ".", with: "")),
       let endValidatedDateInt = Int(endValidatedDate.replacingOccurrences(of: ".", with: "")) {
        return todayInt > endValidatedDateInt
    }
    return false
}

solution("2020.01.01", ["A 12"], ["2019.12.28 A"])
//solution("2020.01.01", ["Z 1", "D 14"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])
