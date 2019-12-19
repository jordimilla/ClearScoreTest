//
//  ScoreRepositoryImpl.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import RxCocoa
import RxSwift

class ScoreRepositoryImpl: ScoreRepository {

    private let scoreService: ScoreServices
    private let scoreTOMapper: (ScoreTO) -> Score
    
    init(moviesService: ScoreServices,
         scoreTOMapper: @escaping (ScoreTO) -> Score) {
        self.scoreService = moviesService
        self.scoreTOMapper = scoreTOMapper
    }
    
    public func getScore() -> Single<Score> {
        return scoreService.getScore()
            .map{ responseTO in self.scoreTOMapper(responseTO.data)
        }
    }
    
}
