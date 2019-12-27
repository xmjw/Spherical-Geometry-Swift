import Foundation

class Calculator {
    private var _radius: Double
    
    init(radius: Double = EARTH_RADIUS) {
        _radius = radius
    }
    
    // Business end of the distanceBetween method
    private func distance(fromLat: Double, fromLng: Double, toLat: Double, toLng: Double) -> Double {
        return (
            2 *
            asin(
                sqrt(
                    pow(sin((fromLat - toLat) / 2), 2) +
                        cos(fromLat) *
                            cos(toLat) *
                            pow(sin((fromLng - toLng) / 2), 2)
                )
            )
        )
    }
    
    /**
        Computes the distance between two positions on a sphere
        - Parameter from: start position
        - Parameter to: end position
        - returns: double - distance in meters.
     */
    func distanceBetween(from: LatLng, to: LatLng) -> Double {
        let fromLat = Utils.toRadians(angleDegrees: from.lat)
        let fromLng = Utils.toRadians(angleDegrees: from.lng)
        let toLat = Utils.toRadians(angleDegrees: to.lat)
        let toLng = Utils.toRadians(angleDegrees: to.lng)

        return distance(fromLat: fromLat, fromLng: fromLng, toLat: toLat, toLng: toLng) * _radius
    }

    // used for headingBetween
    private func fmod(angle: Double, start: Double, end: Double) -> Double {
        let adjustedEnd = end - start
        return
            (
                (
                    (
                        (angle - start).truncatingRemainder(dividingBy: adjustedEnd)) + adjustedEnd
                    ).truncatingRemainder(dividingBy: adjustedEnd)
            ) + start
    }

    /**
     
     Computes a heading betwen to positions on a sphere, returning a heading as degrees (_d_) clockwise from North. -180 <= _d_ <= 180
     
     - Parameter from: LatLng compatible object with the start location.
     - Parameter to: LatLng compatible object with the end location.
     
     - Returns: Double angle, degress clockwise from North.
     */
    func headingBetween(from: LatLng, to: LatLng) -> Double {
        let fromLat = Utils.toRadians(angleDegrees: from.lat)
        let toLat = Utils.toRadians(angleDegrees: to.lat)
        let deltaLng = Utils.toRadians(angleDegrees: to.lng) - Utils.toRadians(angleDegrees: from.lng)

        let radiansAngle = atan2(
            sin(deltaLng) * cos(toLat),
            cos(fromLat) * sin(toLat) -
                sin(fromLat) * cos(toLat) * cos(deltaLng)
        )
        
        let angle = Utils.toDegrees(radians: radiansAngle)
        return fmod(angle: angle, start: -180, end: 180);
    }
    
    /**
    Calculates the length given an array of coordinates on the sphere.
     
     - Parameter paths: Array of compatible locations
     - Returns: Double - length of path in meters.
     
     */
    func lengthOfPath(paths: Array<LatLng>) -> Double {
         var length = Double(0);
         for i in 0..<(paths.count-1) {
             length += distanceBetween(from: paths[i], to: paths[i + 1])
         }
         return length
     }
    
    
    /**
      - Computes the new position given a heading and distance.

      - Parameter position: Current loction to move from.
      - Parameter heading: The heading to move in (clockwise from north)
      - Parameter distance: Distance to travel

      - Returns: New Position given the move.
      */
    func move(position: LatLng, heading: Double, distance: Double) -> (Double, Double) {

        let distanceOverRadius = distance / _radius
        let headingRadians = Utils.toRadians(angleDegrees: heading)

        let fromLatRads = Utils.toRadians(angleDegrees: position.lat)
        let cosDistance = cos(distanceOverRadius)
        let sinDistance = sin(distanceOverRadius)
        let sinFromLat = sin(fromLatRads)
        let cosFromLat = cos(fromLatRads)

        let sc = cosDistance * sinFromLat + sinDistance * cosFromLat * cos(headingRadians)

        let newLat = Utils.toDegrees(radians: asin(sc))

        let newLng = Utils.toDegrees(radians:
            Utils.toRadians(angleDegrees: position.lng) +
                atan2(
                    sinDistance * cosFromLat * sin(headingRadians),
                    cosDistance - sinFromLat * sc
                )
            )

        return (newLat, newLng)
    }

}
