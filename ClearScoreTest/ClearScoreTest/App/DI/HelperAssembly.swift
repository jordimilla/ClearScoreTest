//
//  HelperAssembly.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class HelperAssembly:Assembly{
    
    func assemble(container: Container) {
        // Theme
//        container.register(Theme.self) { _ in
//            ThemeLightImpl()
//        }.inObjectScope(.weak)
//        
//        // FontHelper
//        container.register(FontHelper.self) {r in
//            FontHelperImpl()
//        }.inObjectScope(.weak)
        
          // SchedulerHelper
        container.register(SchedulerHelper.self) {r in
            SchedulerHelperImpl()
        }
    }
}
