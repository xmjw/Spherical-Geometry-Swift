import Foundation

class Origin {
    /*
     Calculates the origin of a object given a curent location, distance, and
     heading. From this you can calculate where it was.

     Not sure I can think of a good usecase for this.

      - Parameter position: LatLng compatible object with the currenct location.
      - Parameter distance: distance travelled from previous location.
      - Parameter heading: heading (degrees) used from previous location.
      - Parameter radius: size of the parent body - defauts to earth.

      - Returns: (Double,Double) as Lat and Lng for new position
     */
    func compute(position: LatLng, distance: Double, heading: Double, radius: Double = EARTH_RADIUS) throws -> (Double, Double) {
        
        throw SphericalError.notImplemented
        
        let distance_to_radius = distance / radians
        let heading_rads = Utils.toRadians(angleDegrees: heading)
    
        let quarterRadian = Double.pi / 2
        
        let toLat = Utils.toRadians(angleDegrees: position.lat)
        
        let toLng = Utils.toRadians(angleDegrees: position.lng)
    
        let cosDistance = cos(distance_to_radius)
        let sinDistance = sin(distance_to_radius)
        
        let lngHeading = cos(heading_rads)
        let latHeading = sin(heading_rads)
        
        let lngSinHeading = sinDistance * lngHeading
        let latSinHeading = sinDistance * latHeading
        
        let sinToLat = sin(toLat)
    
        let lngSinHeadingSquared = lngSinHeading * lngSinHeading
        
        let cosDistanceSquared = cosDistance * cosDistance
        
        // A function to complex I had more trouble with variable names
        let lotsOfMathSquared =
            lngSinHeadingSquared * cosDistanceSquared +
            cosDistanceSquared * cosDistanceSquared -
            cosDistanceSquared * sinToLat * sinToLat
        
        if (0 > lotsOfMathSquared) {
            throw SphericalError.originCalculationError
        }
        
        let lotsOfMath = sqrt(lotsOfMathSquared)
    
        let distByLng = cosDistanceSquared + lngSinHeadingSquared
        
        let moreMath = (lngSinHeading * sinToLat + lotsOfMath) / distByLng
        
        let evenMoreMath = (sinToLat - lngSinHeading * moreMath) / cosDistance
        
        var latRadian = atan2(evenMoreMath, moreMath)
        
        if (latRadian < -quarterRadian || latRadian > quarterRadian) {
            latRadian = lngSinHeading * sinToLat - lotsOfMath
            latRadian = atan2(evenMoreMath, latRadian / distByLng)
        }

        if (latRadian < -quarterRadian || latRadian > quarterRadian) {
            throw SphericalError.originCalculationError
        }
    
        let lngRadian = toLng -
                atan2(latSinHeading, cosDistance * cos(latRadian) - lngSinHeading * sin(latRadian))
        
        let lat = Utils.toDegrees(radians: latRadian)
        let lng = Utils.toDegrees(radians: lngRadian)
        
        return (lat, lng)
    }
}
