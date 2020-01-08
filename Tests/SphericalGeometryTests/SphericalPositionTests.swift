import XCTest

@testable import SphericalGeometry

final class SphericalPositionTests: XCTestCase {
    static var allTests = [
        ("testMove", testMove),
    ]

    func testMove() {
        // This is the case that seems to make the other project 'jump' on the sphere...
        // Lat: 89.95 Long: 90.00 -> 0.0º x 0.1m = Lat: 89.47 Long: 270.00, radius 10
        
        // Not a lat of 89.427042204869415 works...
        // But a lat of 89.427042204869416 fails.
        // What is magic about this number?
        
        let position = Coordinate.init(lat: 89.427042204869415, lng: 90)
        let sp = SphericalPosition.init(position: position, degreesBearing: 0, radius: 10)
        sp.moveDistance(meters: 0.1)
        
        XCTAssertEqual(position.lat, 89, accuracy: 3)
        XCTAssertEqual(position.lng, 90, accuracy: 1)
    }

}


