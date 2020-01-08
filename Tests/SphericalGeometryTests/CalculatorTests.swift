import XCTest

@testable import SphericalGeometry

final class CalculatorTests: XCTestCase {
    static var allTests = [
        ("testComputeDistanceWithRealPlaces", testComputeDistanceWithRealPlaces),
        ("testHeadingWithRealData", testHeadingWithRealData),
        ("testLength", testLength),
        ("testMove", testMove),
        ("testMidpoint", testMidpoint),
    ]

    func testHeadingWithRealData() {
        let calculator = Calculator.init()
        let lon_ny_heading = -71.66937052124973
        XCTAssertEqual(calculator.headingBetween(from: LONDON, to: NEW_YORK), lon_ny_heading, accuracy: ACCURACY)
    }
    
    func testComputeDistanceWithRealPlaces() {
        let calculator = Calculator.init()
        let lon_ny_distance = 5576353.232682846
        XCTAssertEqual(calculator.distanceBetween(from: LONDON, to: NEW_YORK), lon_ny_distance, accuracy: ACCURACY)
    }
    
    func testLength() {
        let calculator = Calculator.init()
        let tour_length = 27607831.481841877
        let paths = [LONDON, NEW_YORK, MOSCOW, SYDNEY]
        XCTAssertEqual(calculator.lengthOfPath(paths: paths), tour_length, accuracy: ACCURACY)
    }
    
    func testMove() {
        let calculator = Calculator.init()

        let heading = Double(-71.669371)
        let distance = Double(5576353.232683)

        let (actualLat, actualLng) = calculator.move(position: LONDON, heading: heading, distance: distance)

        XCTAssertEqual(actualLat, NEW_YORK.lat, accuracy: ACCURACY)
        XCTAssertEqual(actualLng, NEW_YORK.lng, accuracy: ACCURACY)
    }
    
    func testMidpoint() {
        let source = Coordinate.init(lat: 53.403340795473305, lng: -2.3910671181116276)
        let destination = Coordinate.init(lat: 53.571349097504395, lng: -2.1086999022056996)
        let actualMidpoint = Coordinate.init(lat: 53.4875, lng: -2.250278)
        
        let calculator = Calculator.init()

        let (lat,lng) = calculator.midpoint(from: source, to: destination)
        
        XCTAssertEqual(lat, actualMidpoint.lat, accuracy: 0.001)
        XCTAssertEqual(lng, actualMidpoint.lng, accuracy: 0.001)
    }
}
