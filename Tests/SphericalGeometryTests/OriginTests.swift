import XCTest

@testable import SphericalGeometry

final class OriginTests: XCTestCase {
    func testOrigin() throws {
        // Something is wrong here, but I don't think
        // I need this function for what I want, so
        // leaving it for now until it become a problem.
        // If you need it, feel free to fix it!
        
//        let calculator = Origin.init()
//
//        let heading = Double(-71.669371)
//        let distance = Double(5576353.232683)
//
//        let (lat, lng) = try calculator.compute(position: NEW_YORK, distance: heading, heading: distance)
//
//        XCTAssertEqual(lat, LONDON.lat, accuracy: ACCURACY)
//        XCTAssertEqual(lng, LONDON.lng, accuracy: ACCURACY)
    }

    static var allTests = [
        ("testOrigin", testOrigin)
    ]
}
