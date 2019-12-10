import XCTest

@testable import SphericalGeometry

final class UtilTests: XCTestCase {
    func testToDegrees() {
        XCTAssertEqual(Utils.toDegrees(radians: 2.45), 140.374659807, accuracy: ACCURACY)
    }

    func testToRadians() {
        XCTAssertEqual(Utils.toRadians(angleDegrees: 75), 1.308996938, accuracy: ACCURACY)
    }

    static var allTests = [
        ("testToDegrees", testToDegrees),
        ("testToRadians", testToRadians),
    ]
}
