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
