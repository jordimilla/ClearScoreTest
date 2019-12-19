//
//  NetworkingAssembly.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject
import Moya

class NetworkingAssembly: Assembly{
    
    func assemble(container: Container) {
        
        container.register(NetworkConfig.self) { _ in
             #if DEBUG
             return NetworkConfig(serverUrlBase: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/")
             #else
             return NetworkConfig(serverUrlBase: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/")
             #endif
             }.inObjectScope(.container)
        
        container.register(ScoreServices.self) { r in
           ScoreServicesImpl(
                provider: r.resolve(MoyaProvider<ScoreAPI>.self)!
            )
            }.inObjectScope(.container)
        
        container.register(MoyaProvider<ScoreAPI>.self) { r in
            let networkingConfig =  r.resolve(NetworkConfig.self)!
            let provider:MoyaProvider<ScoreAPI> = MoyaFactory.getProvider(baseUrl: networkingConfig.serverUrlBase)
            return provider
        }
    }
}
