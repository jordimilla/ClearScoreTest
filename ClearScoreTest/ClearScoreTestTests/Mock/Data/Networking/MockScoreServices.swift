import Foundation
import Mockit
import XCTest
import RxSwift

@testable import ClearScoreTest

class MockScoreServices: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockScoreServices {
        return self
    }
}

extension MockScoreServices: ScoreServices {
        
    func getScore() -> Single<ResponseTO<ScoreTO>> {
        let mockMovie = ScoreTO(score: 500, maxScoreValue: 700)
        let mockResponse = ResponseTO<ScoreTO>(data: mockMovie)
        return callHandler.accept(Single.just(mockResponse), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<ResponseTO<ScoreTO>>
    }
}
