//
//  File.swift
//  
//
//  Created by Michael Wawra on 09/12/2019.
//

import Foundation

class Utils {
  class func toDegrees(radians: Float) -> Float {
    return (radians * 180) / Float.pi
  }

  class func toRadians(angleDegrees: Float) -> Float {
    return (angleDegrees * Float.pi) / 180.0
  }
}
