import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cacheHit = 1
    let cacheMiss = 5
    
    if cacheSize == 0 {
        return cacheMiss * cities.count
    }
    
    var time = 0
    var cache: [String] = []
    
    for city in cities {
        if let i = cache.firstIndex(of: city.lowercased()) {
            cache.remove(at: i)
            time += cacheHit
        } else {
            if (cache.count >= cacheSize) {
                cache.remove(at: 0)
            }
            time += cacheMiss
        }
        cache += [city.lowercased()]
    }
    return time
}
solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"])
