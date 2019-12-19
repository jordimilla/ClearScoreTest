//
//  NetworkConfig.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct NetworkConfig {
    let serverUrlBase: String
    
    init(serverUrlBase: String) {
        self.serverUrlBase = serverUrlBase
    }
}
