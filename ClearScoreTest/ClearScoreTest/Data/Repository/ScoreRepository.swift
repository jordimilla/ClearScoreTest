//
//  MoviesRepository.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol ScoreRepository {
    func getScore() -> Single<Score>
}

