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
    func compute(position: LatLng, distance: Double, heading: Double, radius: Double = EARTH_RADIUS) -> (Double, Double) {
        return (Double(1), Double(1))
    }
}
