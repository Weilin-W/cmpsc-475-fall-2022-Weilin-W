//
//  MapSearchRoute.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/10/22.
//

import Foundation
import MapKit

extension MapManager {
    //MARK: Directions
    func provideDirections(to building: Building) {
        let request = MKDirections.Request()
        let destinationPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude))
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: destinationPlaceMark)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        self.region.span = MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard error == nil else {return}
            if let route = response?.routes.first {
                let formatter = DateComponentsFormatter()
                formatter.unitsStyle = .full
                formatter.includesApproximationPhrase = false
                formatter.includesTimeRemainingPhrase = false
                formatter.allowedUnits = [.hour,.minute,.second]
                self.usersLocationDescription = formatter.string(from: route.expectedTravelTime)
                self.showingAlert = true
                self.routes.append(route.polyline)
            }
        }
    }
}

