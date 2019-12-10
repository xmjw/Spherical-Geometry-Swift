import XCTest

@testable import SphericalGeometry

final class DistanceBetweenTests: XCTestCase {
    func testComputeDisatnce() {
        let calculator = DistanceBetween.init()
        let position_a = Coordinate.init(lat: 10, lng: 15)
        let position_b = Coordinate.init(lat: 17, lng: 4)
        
        XCTAssertEqual(calculator.compute(from: position_a, to: position_b), 1422189.0)
    }
    
    func testComputeDistanceWithSmallRadius() {
        let calculator = DistanceBetween.init()
        let position_a = Coordinate.init(lat: 10, lng: 15)
        let position_b = Coordinate.init(lat: 17, lng: 4)
        
        XCTAssertEqual(calculator.compute(from: position_a, to: position_b, radius: 100), 22.297876)
    }

    func testComputeDistanceWithRealPlaces() {
        let calculator = DistanceBetween.init()
        let london = Coordinate.init(lat: 51.508129, lng: -0.128005)
        let newyork = Coordinate.init(lat: 40.71417, lng: -74.00639)
        
        // Actual distance is 5576353.232682846 - may need to convert to Doubles...
        XCTAssertEqual(calculator.compute(from: london, to: newyork), 5576354)
    }

    
    
    static var allTests = [
        ("testComputeDisatnce", testComputeDisatnce),
        ("testComputeDistanceWithSmallRadius", testComputeDistanceWithSmallRadius),
        ("testComputeDistanceWithRealPlaces", testComputeDistanceWithRealPlaces),
    ]
}
