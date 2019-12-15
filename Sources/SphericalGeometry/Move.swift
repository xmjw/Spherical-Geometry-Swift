import Foundation

class Move {
    /**
      - Computes the new position given a heading and distance.

      - Parameter position: Current loction to move from.
      - Parameter heading: The heading to move in (clockwise from north)
      - Parameter distance: Distance to travel

      - Returns: New Position given the move.
      */
    func compute(position: LatLng, heading: Double, distance: Double, radius: Double = EARTH_RADIUS) -> (Double, Double) {

        let distanceOverRadius = distance / radius
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
