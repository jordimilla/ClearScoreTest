//
//  ScoreServices.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import NetworkExtension
import Moya_ObjectMapper

protocol ScoreServices {
    func getScore() -> Single<ResponseTO<ScoreTO>>
}

class ScoreServicesImpl: ScoreServices {
    
    private let provider:MoyaProvider<ScoreAPI>
    
    init(provider: MoyaProvider<ScoreAPI>) {
        self.provider = provider
    }
        
    
    public func getScore() -> Single<ResponseTO<ScoreTO>> {
        return provider.rx.request(.getScore)
            .mapObject(ResponseTO<ScoreTO>.self)
    }
}
