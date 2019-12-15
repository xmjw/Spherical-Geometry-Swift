import Foundation

class Utils {
  class func toDegrees(radians: Double) -> Double {
    return (radians * 180) / Double.pi
  }

  class func toRadians(angleDegrees: Double) -> Double {
    return (angleDegrees * Double.pi) / 180.0
  }
}
