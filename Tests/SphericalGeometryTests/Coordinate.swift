//
//  File.swift
//  
//
//  Created by Michael Wawra on 09/12/2019.
//

import Foundation
@testable import SphericalGeometry

class Coordinate: LatLng {
    private var _lat: Float
    private var _lng: Float
    
    init(lat: Float, lng: Float) {
        _lat = lat
        _lng = lng
    }
    
    var lat: Float { get { return _lat } }
    var lng: Float { get { return _lng } }
}
