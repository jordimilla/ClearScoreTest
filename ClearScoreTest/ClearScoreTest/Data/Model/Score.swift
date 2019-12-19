//
//  Score.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation

public class Score {
    public let score: Int
    public let maxScoreValue: Int
    
    public init(score: Int, maxScoreValue: Int) {
        self.score = score
        self.maxScoreValue = maxScoreValue
    }
}
