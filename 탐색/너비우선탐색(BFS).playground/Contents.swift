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

/* 문제: 음료수 얼려먹기
 N * M 크기의 얼음 틀이 있습니다. 구멍이 뚫려 있는 부분은 0, 칸막이가 존재하는 부분은 1로 표시됩니다.
 구멍이 뚫려 있는 부분끼리 상,하,좌,우로 붙어 있는 경우 서로 연결되어 있는 것으로 간주합니다.
 이때 얼음 틀의 모양이 주어졌을 때 생성되는 총 아이스크림의 개수를 구하는 프로그램을 작성하세요.
 다음의 4 x 5 얼음 틀에는 아이스크림이 총 3개 생성됩니다.
 */

/* 해결방법
 1. 특정한 지점의 상하좌우를 살펴보며 주변 지점에서 값이 0 이면서 방문하지 않은 지점이 있으면 해당 지점을 방문한다.
 2. 방문한 지점에서 다시 상하좌우를 살펴보며 연결된 모든 지점을 방문한다.
 3. 모든 노드에 대해서 1~2번의 과정을 반복하며 방문하지 않은 지점의 카운트를 세어본다. */
func eatFrozenIcecream(_ board: [[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            if board[nx][ny] == 0 && !visited[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
    
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == 0 && !visited[i][j] {
                dfs(i, j)
                count += 1
            }
        }
    }
    return count
}

let board = [[0,0,1,1,0],[0,0,0,1,1],[1,1,1,1,1],[0,0,0,0,0]]
let count = eatFrozenIcecream(board) // 3
print(count)




