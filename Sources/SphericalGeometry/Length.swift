//
//  File.swift
//  
//
//  Created by Michael Wawra on 10/12/2019.
//

import Foundation

class Length {
    func compute(paths: Array<LatLng>, radius: Double = EARTH_RADIUS) -> Double {
        var length = Double(0);
        let distance = DistanceBetween.init()
        for i in 0..<(paths.count-1) {
            length += distance.compute(from: paths[i], to: paths[i + 1], radius: radius)
        }
        return length
    }
}
/**
 
 /**
  * Returns the length of the given path.
  * @param {LatLng[]} path
  * @param {number} [radius]
  * @returns {number}
  */
 export default function computeLength(path, radius = EARTH_RADIUS) {
     let length = 0;
     for (let i = 0; i < path.length - 1; i++)
         length += computeDistanceBetween(path[i], path[i + 1], radius);
     return length;
 }

 
 */
