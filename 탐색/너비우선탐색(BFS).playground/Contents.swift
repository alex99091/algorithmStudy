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


/* 재귀함수 (Recursive Function)란 자기 자신을 다시 호출하는 함수
 반드시 재귀 함수의 종료 조건을 명시해야 합니다. 종료 조건을 제대로 명시하지 않으면 함수가 무한히 호출 될 수 있습니다. */

func recursiveTest(_ i: Int) {
    if i == 5 {
        return
    }
    recursiveTest(i + 1)
    print("\(i)번째 재귀 함수를 종료합니다.")
}

recursiveTest(1)

/* 유클리드 호제법: 최대공약수 구현 예제
 두 개의 자연수에 대한 최대공약수를 구하는 대표적인 알고리즘으로는 유클리드 호제법이 있습니다.
 유클리드 호제법
 - 두 자연수 A, B에 대하여 (A>B) A를 B로 나눈 나머지를 R이라고 합니다.
 - 이때 A와 B의 최대공약수는 B와 R의 최대공약수와 같습니다.
 이 때, 유클레드 호제법의 아이디어를 재귀함수로 구현할 수 있습니다. */

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}

gcd(192, 162)
gcd(162, 192)

/* 모든 재귀 함수는 반복문을 이용하여 동일한 기능을 구현할 수 있습니다.
 컴퓨터가 함수를 연속적으로 호출하면 컴퓨터 메모리 내부의 스택 프레임에 쌓입니다.
 그래서 스택을 사용해야 할 때 구현상 스택 대신에 재귀 함수를 이용하는 경우가 많습니다. */

/* DFS는 재귀함수를 활용 할 수 있습니다.
 DFS: Depth-First Search
 DFS는 깊이 우선 탐색이라고도 부르며 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘 입니다.
 DFS는 스택 자료구조(혹은 재귀함수)를 이용하며, 구체적인 동작 과정은 다음과 같습니다.
 1. 탐색 시작 노드를 스택에 삽입하고 방문 처리를 합니다.
 2. 스택의 최상단 노드에 방문하지 않은 인접한 노드가 하나라도 있으면 그 노드를 스택에 넣고 방문 처리합니다.
    방문하지 않은 인접 노드가 없으면 스택에서 최상단 노드를 꺼냅니다.
 3. 더이상 2번의 과정을 수행할 수 없을 때까지 반복합니다.
*/


let graph = [[1],[2,3,8],[1,7],[1,4,5],[3,5],[3,4],[7],[2,6,8],[1,7]]
var visited = [Bool](repeating: false, count: graph.count)

func dfsExample(_ graph:[[Int]], _ v: Int, _ visited: inout [Bool]) {
    visited[v] = true
    print(v, terminator: "")
    for i in graph[v] {
        if !visited[i] {
            dfsExample(graph, i, &visited)
        }
    }
}

dfsExample(graph, 1, &visited)

/* BFS: Breath-First Search
 너비 우선 탐색이라고 부르며, 그래프에서 가까운 노드부터 우선적으로 탐색하는 알고리즘입니다.
 BFS는 큐 자료구조를 이용하며, 구체적인 동작 과정은 다음과 같습니다.
 1. 탐색 시작 노드를 큐에 삽입하고 방문 처리를 합니다.
 2. 큐에서 노드를 꺼낸 뒤에 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리합니다.
 3. 더 이상 2번 과정을 수행할 수 없을때까지 반복합니다.
 
 특정 조건에서의 최단경로 문제를 해결하기 위해 사용한다.
 */

func bfsExample(start: Int) {
    var queue: [Int] = []
    queue.append(start)
    visited[start] = true
    while !queue.isEmpty {
        let x = queue.removeFirst()
        print(x, terminator: " ")
        for y in graph[x] {
            if !visited[y-1] {
                queue.append(y-1)
                visited[y-1] = true
            }
        }
    }
}

bfsExample(start: 0)

