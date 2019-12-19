//
//  HomeRouter.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Swinject

protocol HomeRouter {
}

class HomeRouterImpl: HomeRouter {

    private let hostViewControllerProvider: Provider<UIViewController>
    init(hostViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
}
