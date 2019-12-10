//
//  File.swift
//  
//
//  Created by Michael Wawra on 10/12/2019.
//

import Foundation

class Heading {
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
    func compute(from: LatLng, to: LatLng) -> Double {
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
}

