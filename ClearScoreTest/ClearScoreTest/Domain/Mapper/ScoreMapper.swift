//
//  ScoreMapper.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation


public func scoreTOMapper(value: ScoreTO) -> Score {
    
    return Score(score: value.score, maxScoreValue: value.maxScoreValue)
}
