/* 연속 부분 수열 합의 개수
 문제 설명
 철호는 수열을 가지고 놀기 좋아합니다. 어느 날 철호는 어떤 자연수로 이루어진 원형 수열의 연속하는 부분 수열의 합으로 만들 수 있는 수가 모두 몇 가지인지 알아보고 싶어졌습니다. 원형 수열이란 일반적인 수열에서 처음과 끝이 연결된 형태의 수열을 말합니다. 예를 들어 수열 [7, 9, 1, 1, 4] 로 원형 수열을 만들면 다음과 같습니다. */


import Foundation

class ListNode<T> {
    var val: T
    var next: ListNode<T>?
    
    init(val: T) {
        self.val = val
        self.next = nil
    }
}

struct LinkedList<T> {
    var head: ListNode<T>?
    
    mutating func append(_ val: T){
        if head == nil {
            head = ListNode(val: val)
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = ListNode(val: val)
    }
    
    mutating func rotate() {
        if head == nil || head?.next == nil {
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = head
        head = head?.next
        current?.next?.next = nil
    }
}

func solution(_ elements:[Int]) -> Int {
    var count = 0
    var list = LinkedList<Int>()
    for element in elements {
        list.append(element)
    }
    for _ in 0..<elements.count {
        var sum = 0
        var set = Set<Int>()
        var current = list.head
        while current != nil {
            sum += current!.val
            set.insert(sum)
            current = current!.next
        }
        count += set.count
        list.rotate()
    }
    return count
}


solution([7,9,1,1,4])
