import XCTest

@testable import SphericalGeometry

final class DistanceBetweenTests: XCTestCase {
    func testComputeDistanceWithRealPlaces() {
        let calculator = DistanceBetween.init()
        let lon_ny_distance = 5576353.232682846
        XCTAssertEqual(calculator.compute(from: LONDON, to: NEW_YORK), lon_ny_distance, accuracy: ACCURACY)
    }
    
    static var allTests = [
        ("testComputeDistanceWithRealPlaces", testComputeDistanceWithRealPlaces),
    ]
}
