//
//  ScoreTO.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ScoreTO {
    var score: Int!
    var maxScoreValue: Int!
}

extension ScoreTO: Mappable{
    public init?(map: Map) {
    }
    
   public  mutating func mapping(map: Map) {
        score <- map["score"]
        maxScoreValue <- map["maxScoreValue"]

    }
}
