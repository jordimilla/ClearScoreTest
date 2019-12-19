# ClearScoreTest

Clean Architecture and MVVM

# Presentation Layer 
contains UI that are coordinated by Presenters/ViewModels which execute 1 or multiple Use cases. Presentation Layer depends on Domain Layer.

# Domain Layer 
is the most INNER part of the onion (no dependencies with other layers) and it contains Entities, Use cases & Repository Interfaces. Use cases combine data from 1 or multiple Repository Interfaces.

# Data Layer 
contains Repository Implementations and 1 or multiple Data Sources. Repositories are responsible to coordinate data from the different Data Sources. Data Layer depends on Domain Layer.

# Technologies:
Swinject, Rxswift, Moya

# Networking
pod 'Alamofire' pod 'Moya' pod 'Moya/RxSwift' pod 'Moya-ObjectMapper/RxSwift'

# Reactive
pod 'RxSwift', '> 4.0' pod 'RxCocoa', '> 4.0' pod 'Moya-ObjectMapper/RxSwift'

# Utils
pod 'Swinject' pod 'Hue'

# Testing
pod 'RxBlocking' pod 'RxTest' pod 'Mockit'
