import XCTest
import Mockit
import RxSwift
import RxBlocking

@testable import ClearScoreTest

class ScoreRepositoryTests: XCTestCase {

    var mockScoreService: MockScoreServices!
    var sut: ScoreRepositoryImpl!
    
    override func setUp() {
        mockScoreService = MockScoreServices(testCase: self)
        sut = ScoreRepositoryImpl(moviesService: mockScoreService, scoreTOMapper: scoreTOMapper)
    }
    
    func test_get_getScore() throws {
        let mockScore = ScoreTO(score: 500, maxScoreValue: 700)
        let mockResponse = ResponseTO(data: mockScore)
        
        let _ = mockScoreService.when()
            .call(withReturnValue: mockScoreService.getScore())
        .thenReturn(Single.just(mockResponse))
        
        let result = try sut.getScore().toBlocking().single()
        
        XCTAssertTrue(result.score == mockScore.score)
        _ = self.mockScoreService.verify(verificationMode: Once()).getScore()
    }
    
}
