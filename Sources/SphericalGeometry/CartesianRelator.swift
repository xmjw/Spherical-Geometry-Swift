import Foundation

public class CartesianRelator {
    private var _x: Double
    private var _y: Double
    private var _z: Double
    private var _radius: Double
    
    /**
     Given a parent body's X,Y,Z, every value is mapped as an offset on top of these. Orelse they deafult to 0.
    - Paremeter parentX: X coordinate of parent body.
    - Paremeter parentY: Y coordinate of parent body.
    - Paremeter parentZ: Z coordinate of parent body.
           
     */
    public init(parentX: Double = 0, parentY: Double = 0, parentZ: Double = 0, parentRadius: Double) {
        _x = parentX
        _y = parentY
        _z = parentZ
        _radius = parentRadius
    }
    
    /**
    Gets the cartesian coordinates for a given LatLng compatible object
     
    - Parameter polarPosition: LatLng position to find cartesian poisiton for.
     
    - Returns Double, Double, Double: X, Y, Z position of the object, as offsets from parent position.
     */
    public func positionCartesian(polarPosition: LatLng) -> (Double, Double, Double) {
        // Has to be in radians, I suspect this will cause issues later, because
        // we're not making this clear in the API.
        let φ = Utils.toRadians(angleDegrees: polarPosition.lat)
        let θ = Utils.toRadians(angleDegrees: polarPosition.lng)

        let x = _radius * cos(θ) * sin(φ)
        let y = _radius * sin(θ) * sin(φ)
        let z = _radius * cos(φ)

        return (x, y, z)
    }

    
    /**
    Gets the absolute cartesian coordinates for a given LatLng compatible object
     
    - Parameter polarPosition: LatLng position to find cartesian poisiton for.
     
    - Returns Double, Double, Double: X, Y, Z position of the object
     */
    public func absPositionCartesian(polarPosition: LatLng) -> (Double, Double, Double) {
        let (x, y, z) = positionCartesian(polarPosition: polarPosition)
        return (_x + x, _y + y, _z + z)
    }
}
