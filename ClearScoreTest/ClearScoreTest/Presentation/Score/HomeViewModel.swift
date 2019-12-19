//
//  HomeViewModel.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel: RxViewModel {
    
    private let scoreRepository: ScoreRepository
    private let schedulerHelper: SchedulerHelper
    
    let score = BehaviorRelay<Resource<Score>?>(value: nil)
          
       init(moviesRepository: ScoreRepository,
               schedulerHelper: SchedulerHelper) {
           self.scoreRepository = moviesRepository
           self.schedulerHelper = schedulerHelper
       }
          
       func getScore() {
           scoreRepository.getScore()
               .subscribeOn(schedulerHelper.backgroundWorkScheduler)
               .observeOn(schedulerHelper.mainScheduler)
               .subscribe(
                   onSuccess: { [weak self] (score)  in
                       self?.score.accept(Resource.success(score))
                   },
                   onError: { [weak self] (e:Error) in
                       self?.score.accept(Resource.failUnknown())
                   }
               )
               .disposed(by: disposableBag)
          }
}

