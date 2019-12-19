//
//  RepositoryAssembly.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//


import Foundation
import Swinject

class RepositoryAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(ScoreRepository.self) {  r in
            ScoreRepositoryImpl(
                moviesService: r.resolve(ScoreServices.self)!,
                scoreTOMapper: scoreTOMapper)
            }.inObjectScope(.weak)
    }
}
