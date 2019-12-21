import XCTest

@testable import SphericalGeometry

final class OriginTests: XCTestCase {
    func testOrigin() {
        let calculator = Origin.init()

        let heading = Double(-71.669371)
        let distance = Double(5576353.232683)

        let (lat, lng) = calculator.compute(position: NEW_YORK, distance: heading, heading: distance)

        XCTAssertEqual(lat, LONDON.lat, accuracy: ACCURACY)
        XCTAssertEqual(lng, LONDON.lng, accuracy: ACCURACY)
    }

    static var allTests = [
        ("testOrigin", testOrigin)
    ]
}
