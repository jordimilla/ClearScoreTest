import Foundation
import ObjectMapper

struct ResponseTO<T:Mappable>: Mappable {
    var data: T!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["creditReportInfo"]
    }
    
    init(data: T) {
        self.data = data
    }
}
