//
//  CampusMapView.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/27/22.
//

import SwiftUI
import MapKit

struct CampusMapView: View {
    @EnvironmentObject var manager : MapManager
    @State var userTrackingMode : MapUserTrackingMode = .follow
    
    var body: some View {
        Map(coordinateRegion: $manager.region, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: manager.selectedPlottedBuildings, annotationContent: annotationFor(building:))
    }
}

struct CampusMapView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMapView()
            .environmentObject(MapManager())
    }
}
