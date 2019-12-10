import XCTest

@testable import SphericalGeometry

final class HeadingTests: XCTestCase {
    func testHeadingWithRealData() {
        let calculator = Heading.init()
        let lon_ny_heading = -71.66937052124973
        XCTAssertEqual(calculator.compute(from: LONDON, to: NEW_YORK), lon_ny_heading, accuracy: ACCURACY)
    }
    
    static var allTests = [
        ("testHeadingWithRealData", testHeadingWithRealData)
    ]
}
