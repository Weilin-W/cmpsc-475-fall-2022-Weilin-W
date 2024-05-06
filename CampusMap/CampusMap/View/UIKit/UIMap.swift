//
//  UIMap.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/17/22.
//

import SwiftUI
import MapKit


struct UIMap: UIViewRepresentable {
    @ObservedObject var manager : MapManager
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = manager.mapStyle
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.addPin(recognizer:)))
        mapView.addGestureRecognizer(longPress)
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = manager.mapStyle
        mapView.setRegion(manager.region, animated: true)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(manager.building as! [MKAnnotation])
        
        mapView.removeOverlays(mapView.overlays)
        mapView.addOverlays(manager.routes)
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(_manager: manager, mapView:mapView)
    }
    
}

struct UIMap_Previews: PreviewProvider {
    static var previews: some View {
        UIMap(manager: MapManager())
    }
}
