//
//  DroppedPin.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/17/22.
//

import Foundation
import MapKit

class DroppedPin : NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title : String? = nil

    init(coord:CLLocationCoordinate2D) {
        coordinate = coord
    }
}
