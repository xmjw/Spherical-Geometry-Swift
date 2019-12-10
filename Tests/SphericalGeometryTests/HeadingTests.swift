import XCTest

@testable import SphericalGeometry

final class HeadingTests: XCTestCase {
    func testHeading() {
        let calculator = Heading.init()
        let position_a = Coordinate.init(lat: 10, lng: 15)
        let position_b = Coordinate.init(lat: 17, lng: 4)
        
        XCTAssertEqual(calculator.compute(from: position_a, to: position_b), -55.6044)
    }

    func testHeadingWithRealData() {
        let calculator = Heading.init()
        let position_a = Coordinate.init(lat: 51.508129, lng: -0.128005)
        let position_b = Coordinate.init(lat: 40.71417, lng: -74.00639)
        
        XCTAssertEqual(calculator.compute(from: position_a, to: position_b), -71.66937052124973)
    }
    
    static var allTests = [
        ("testHeading", testHeading),
        ("testHeadingWithRealData", testHeadingWithRealData)
    ]
}
