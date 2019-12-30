import Foundation

public class Utils {
  public class func toDegrees(radians: Double) -> Double {
    return (radians * 180) / Double.pi
  }

  public class func toRadians(angleDegrees: Double) -> Double {
    return (angleDegrees * Double.pi) / 180.0
  }
}
