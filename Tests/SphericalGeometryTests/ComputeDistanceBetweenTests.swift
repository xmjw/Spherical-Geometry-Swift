import XCTest

@testable import SphericalGeometry

final class ComputeDistanceBetweenTests: XCTestCase {
    func testComputeDisatnce() {
        let calculator = ComputeDistanceBetween.init()
        let position_a = Coordinate.init(lat: 10, lng: 15)
        let position_b = Coordinate.init(lat: 17, lng: 4)
        
        XCTAssertEqual(calculator.computeDistanceBetween(from: position_a, to: position_b), 1422189.0)
    }
    
    func testComputeDistanceWithSmallRadius() {
        let calculator = ComputeDistanceBetween.init()
        let position_a = Coordinate.init(lat: 10, lng: 15)
        let position_b = Coordinate.init(lat: 17, lng: 4)
        
        XCTAssertEqual(calculator.computeDistanceBetween(from: position_a, to: position_b, radius: 100), 22.297876)
    }

    static var allTests = [
        ("testComputeDisatnce", testComputeDisatnce),
        ("testComputeDistanceWithSmallRadius", testComputeDistanceWithSmallRadius),
    ]
}
