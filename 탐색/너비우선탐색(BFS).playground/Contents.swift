// 너비 우선 탐색: BFS(Breath First Search)

import Foundation

var number = 7
var c = Array(repeating: false, count: 8)
var a = Array(repeating: [Int](), count: 8)

func bfs(_ start: Int) {
    var q = [Int]()
    q.append(start)
    c[start] = true
    while !q.isEmpty {
        let x = q.removeFirst()
        print(x, terminator: " ")
        for y in a[x] {
            if !c[y] {
                q.append(y)
                c[y] = true
            }
        }
    }
}

// test
a[1].append(2)
a[2].append(1)

a[1].append(3)
a[3].append(1)

a[2].append(3)
a[3].append(2)

a[2].append(4)
a[4].append(2)

a[2].append(5)
a[5].append(2)

a[4].append(5)
a[5].append(4)

a[3].append(6)
a[6].append(3)

a[3].append(7)
a[7].append(3)

a[6].append(7)
a[7].append(6)

bfs(1) // 1 2 3 4 5 6 7
