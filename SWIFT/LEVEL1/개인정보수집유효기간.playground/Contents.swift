import Foundation

//문제 설명
//고객의 약관 동의를 얻어서 수집된 1~n번으로 분류되는 개인정보 n개가 있습니다. 약관 종류는 여러 가지 있으며 각 약관마다 개인정보 보관 유효기간이 정해져 있습니다. 당신은 각 개인정보가 어떤 약관으로 수집됐는지 알고 있습니다. 수집된 개인정보는 유효기간 전까지만 보관 가능하며, 유효기간이 지났다면 반드시 파기해야 합니다.
//
//예를 들어, A라는 약관의 유효기간이 12 달이고, 2021년 1월 5일에 수집된 개인정보가 A약관으로 수집되었다면 해당 개인정보는 2022년 1월 4일까지 보관 가능하며 2022년 1월 5일부터 파기해야 할 개인정보입니다.
//당신은 오늘 날짜로 파기해야 할 개인정보 번호들을 구하려 합니다.
//
//모든 달은 28일까지 있다고 가정합니다.
//
//다음은 오늘 날짜가 2022.05.19일 때의 예시입니다.
//
//약관 종류    유효기간
//A    6 달
//B    12 달
//C    3 달
//번호    개인정보 수집 일자    약관 종류
//1    2021.05.02    A
//2    2021.07.01    B
//3    2022.02.19    C
//4    2022.02.20    C
//첫 번째 개인정보는 A약관에 의해 2021년 11월 1일까지 보관 가능하며, 유효기간이 지났으므로 파기해야 할 개인정보입니다.
//두 번째 개인정보는 B약관에 의해 2022년 6월 28일까지 보관 가능하며, 유효기간이 지나지 않았으므로 아직 보관 가능합니다.
//세 번째 개인정보는 C약관에 의해 2022년 5월 18일까지 보관 가능하며, 유효기간이 지났으므로 파기해야 할 개인정보입니다.
//네 번째 개인정보는 C약관에 의해 2022년 5월 19일까지 보관 가능하며, 유효기간이 지나지 않았으므로 아직 보관 가능합니다.
//따라서 파기해야 할 개인정보 번호는 [1, 3]입니다.
//
//오늘 날짜를 의미하는 문자열 today, 약관의 유효기간을 담은 1차원 문자열 배열 terms와 수집된 개인정보의 정보를 담은 1차원 문자열 배열 privacies가 매개변수로 주어집니다. 이때 파기해야 할 개인정보의 번호를 오름차순으로 1차원 정수 배열에 담아 return 하도록 solution 함수를 완성해 주세요.

func solution(_ today:String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var termDict = [String: String]()
    for i in terms {
        let split = i.split(separator: " ")
        termDict[String(split[0])] = String(split[1])
    }
    var answer: [Int] = []
    let todayArray = today.components(separatedBy: ".")
    var idx = 0
    for i in privacies {
        idx += 1
        var array = i.components(separatedBy: ["."," "])
        array.append(termDict[array.removeLast()]!)
        let expirationArray = expirationDate(array)
        print("expirationDate: \(expirationArray)")
        print("today: \(todayArray)")
        if !(expirationArray[0] >= Int(todayArray[0])! && expirationArray[1] >= Int(todayArray[1])! && expirationArray[2] >= Int(todayArray[2])!) {
            answer.append(idx)
        }
    }
    
    return answer
}

// 날짜 처리: 일 - 1 && 월 - 보관기간
func expirationDate(_ array: [String]) -> [Int] {
    let thirtyOne = [1,3,5,7,8,10,12]
    let thirty = [4,6,9,11]
    
    var day = Int(array[2])!
    var month = Int(array[1])!
    var year = Int(array[0])!
    var beforeAdd: [Int] = []
    
    if day == 1 {
        month -= 1 // month result : 0,1,2,3,4,5,6,7,8,9,11
        if thirtyOne.contains(month) {
            day = 31
        } else if thirty.contains(month) {
            day = 30
        } else if month == 2 {
            day = 28
        } else if month == 0 {
            year -= 1
            month = 12
            day = 31
        }
        beforeAdd.append(year)
        beforeAdd.append(month)
        beforeAdd.append(day)
    } else {
        day -= 1
        beforeAdd.append(year)
        beforeAdd.append(month)
        beforeAdd.append(day)
    }
    // print("beforeAdd: \(beforeAdd), addMonth: \(array[3])")
    // beforeAdd : ex) [2021, 12, 31], [2021, 03, 11] -> 12 - 6 = 6, 3 - 6 = -3
    if beforeAdd[1] + Int(array[3])! > 12 {
        year += 1
        month = (beforeAdd[1] + Int(array[3])!) - 12
    } else {
        month = beforeAdd[1] + Int(array[3])!
    }
    
    return [year,month,day]
}
solution("2022.01.01", ["A 1", "B 2"], ["2021.12.01 A", "2021.07.01 B"])

//solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])
//solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])

func solution2(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result = [Int]()
    var terms = getTerms(terms)
    var privacies = getPrivacies(privacies)
    
    var todaySplit = today.split(separator: ".")
    var year = Int(todaySplit[0])!
    var month = Int(todaySplit[1])!
    var day = Int(todaySplit[2])!

    for (i,j) in privacies {
        var dateSplit = i.split(separator: ".")
        var year_ = Int(dateSplit[0])!
        var month_ = Int(dateSplit[1])!
        var day_ = Int(dateSplit[2])!
        var number = Int(dateSplit[3])!

//        예: 6
        var expireIn = terms[j]!

        month_ += expireIn
        if month_ > 12 {
            year_ += month_/12
            month_ -= (month_/12 * 12)
            if month_ == 0 {
                year_ -= 1
                month_ = 12
            }
        }
        
        if day_ == 1 {
            if (month_ == 1){
                day_ = 28
                month_ = 12
                year_ -= 1
            } else if(month_ > 1){
                day_ = 28
                month_ -= 1
            }
        } else {
            day_ -= 1
        }

        if year_ < year {
            result.append(number)
        } else if year_ == year && month_ < month {
            result.append(number)
        } else if year_ == year && month_ == month && day_ < day {
            result.append(number)
        }

    }
    
    
    return result.sorted(by: <)
}

func getTerms(_ terms: [String]) -> [String: Int]{
    var dict = [String: Int]()
    for i in terms {
        var split = i.split(separator: " ")
        dict[String(split[0])] = Int(split[1])
    }
    
    return dict
}

func getPrivacies(_ privacy: [String]) -> [String: String]{
    var dict = [String: String]()
    var num = 0
    for i in privacy {
        var split = i.split(separator: " ")
        num+=1
       //예: 2019.01.01.1
       dict[String(split[0])+"."+String(num)] = String(split[1])
    }
    return dict
}
