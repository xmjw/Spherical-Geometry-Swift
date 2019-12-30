import Foundation

public class SphericalPosition {
    private var _position: LatLng
    private var _bearing: Double
    private var calculator: Calculator
    
    // Create an instance at a given lat/lng, with a heading
    public init(position: LatLng, degreesBearing: Double, radius: Double) {
        _position = position
        _bearing = degreesBearing
        calculator = Calculator.init(radius: radius)
    }
    
    public var position: LatLng { get { return _position } }
    public var bearing: Double { get { return _bearing } }
    
    // Change the heading to some new bearing.
    public func rotateBearing(degreesBearing: Double) {
        _bearing = bearing
    }
    
    // Move on current bearing some distance.
    public func moveDistance(meters: Double) {
        let (lat, lng) = calculator.move(position: _position, heading: _bearing, distance: meters)
        _position.lat = lat
        _position.lng = lng
    }
}
