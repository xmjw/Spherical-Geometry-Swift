import XCTest

@testable import SphericalGeometry

final class UtilTests: XCTestCase {
    func testToDegrees() {
      XCTAssertEqual(Utils.toDegrees(radians: 2.45), 140.37466)
    }

    func testToRadians() {
      XCTAssertEqual(Utils.toRadians(angleDegrees: 75), 1.3089968)
    }

    static var allTests = [
        ("testToDegrees", testToDegrees),
        ("testToRadians", testToRadians),
    ]
}
