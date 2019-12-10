//
//  File.swift
//  
//
//  Created by Michael Wawra on 09/12/2019.
//

import Foundation

class DistanceBetween {
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
    
    func compute(from: LatLng, to: LatLng, radius: Double = EARTH_RADIUS) -> Double {
        let fromLat = Utils.toRadians(angleDegrees: from.lat)
        let fromLng = Utils.toRadians(angleDegrees: from.lng)
        let toLat = Utils.toRadians(angleDegrees: to.lat)
        let toLng = Utils.toRadians(angleDegrees: to.lng)

        return distance(fromLat: fromLat, fromLng: fromLng, toLat: toLat, toLng: toLng) * radius
    }
}
