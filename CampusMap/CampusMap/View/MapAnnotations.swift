//
//  MapAnnotations.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/30/22.
//

import Foundation
import MapKit
import SwiftUI


extension CampusMapView {
    func annotationFor(building: Building) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)) {
            Button(action: {
                manager.selectedBuilding = building
                manager.showConfirmation = true
            }) {
                Image(systemName: building.favorite ?? false ? "heart.fill" : "heart")
                    .font(.system(size: 40))
                    .foregroundColor(building.favorite ?? false ? .red : .cyan)
                    .frame(width: 50, height: 50)
            }
        }
    }
}
