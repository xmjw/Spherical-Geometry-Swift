import XCTest

@testable import SphericalGeometry

final class CartesianRelatorTests: XCTestCase {
    static var allTests = [
        ("testPositionCartesian", testPositionCartesian),
        ("testAbsPositionCartesian", testAbsPositionCartesian),
    ]

    func testPositionCartesian() {
        // Using this for generating test data: https://keisan.casio.com/exec/system/1359534351
        // Note that lat/lng are φ/θ
        
        let calculator = CartesianRelator.init(parentRadius: Double(1000))
        let position = Coordinate.init(lat: 30, lng: 60)
        
        let (x, y, z) = calculator.positionCartesian(polarPosition: position)
        
        XCTAssertEqual(x, Double(250), accuracy: ACCURACY)
        XCTAssertEqual(y, Double(433.0127019), accuracy: ACCURACY)
        XCTAssertEqual(z, Double(866.0254038), accuracy: ACCURACY)
    }

    func testAbsPositionCartesian() {
        // Using this for generating test data: https://keisan.casio.com/exec/system/1359534351
        // Note that lat/lng are φ/θ

        let xOffset = Double(136)
        let yOffset = Double(234)
        let zOffset = Double(83)
        
        let calculator = CartesianRelator.init(parentX: xOffset, parentY: yOffset, parentZ: zOffset, parentRadius: Double(500))
        let position = Coordinate.init(lat: 50, lng: 75)
        
        let (x, y, z) = calculator.absPositionCartesian(polarPosition: position)
        
        XCTAssertEqual(x, Double(99.13344564) + Double(xOffset), accuracy: ACCURACY)
        XCTAssertEqual(y, Double(369.9710559) + Double(yOffset), accuracy: ACCURACY)
        XCTAssertEqual(z, Double(321.3938048) + Double(zOffset), accuracy: ACCURACY)

    }
}
