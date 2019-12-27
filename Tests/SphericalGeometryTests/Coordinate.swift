//
//  File.swift
//  
//
//  Created by Michael Wawra on 09/12/2019.
//

import Foundation
@testable import SphericalGeometry

class Coordinate: LatLng {
    private var _lat: Double
    private var _lng: Double
    
    init(lat: Double, lng: Double) {
        _lat = lat
        _lng = lng
    }
    
    var lat: Double {
        get { return _lat }
        set { _lat = newValue }
    }
    var lng: Double {
        get { return _lng }
        set { _lng = newValue }
    }
}
