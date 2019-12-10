import XCTest

@testable import SphericalGeometry

final class LengthTests: XCTestCase {
    func testLength() {
        let calculator = Length.init()
        let tour_length = 27607831.481841877
        let paths = [LONDON, NEW_YORK, MOSCOW, SYDNEY]
        XCTAssertEqual(calculator.compute(paths: paths), tour_length, accuracy: ACCURACY)
    }
    
    static var allTests = [
        ("testLength", testLength)
    ]
}
