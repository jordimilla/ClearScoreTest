//
//  ScoreAPI.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya


enum ScoreAPI {
    case getScore
}

extension ScoreAPI: TargetType, AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/")!}
    
    public var path: String {
        switch self {
        case .getScore:
            return "mockcredit/values"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getScore:
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getScore:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .getScore:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
