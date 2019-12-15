import XCTest

@testable import SphericalGeometry

final class MoveTests: XCTestCase {
    func testMove() {
        let calculator = Move.init()

        let heading = Double(-71.669371)
        let distance = Double(5576353.232683)

        let (actualLat, actualLng) = calculator.compute(position: LONDON, heading: heading, distance: distance)

        XCTAssertEqual(actualLat, NEW_YORK.lat, accuracy: ACCURACY)
        XCTAssertEqual(actualLng, NEW_YORK.lng, accuracy: ACCURACY)
    }

    static var allTests = [
        ("testMove", testMove)
    ]
}
