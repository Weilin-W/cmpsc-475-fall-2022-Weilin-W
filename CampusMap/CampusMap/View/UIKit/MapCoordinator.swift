//
//  MapCoordinator.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/17/22.
//

import Foundation
import MapKit


class MapCoordinator : NSObject, MKMapViewDelegate {
    let manager : MapManager
    let map:MKMapView
    
    init(_manager:MapManager, mapView:MKMapView) {
        manager = _manager
        map = mapView
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        switch annotation {
        case is MKUserLocation: return nil
        
        //Issue: Need to convert Building from struct to class
        case is [Building]:
            let marker = MKAnnotationView(annotation: annotation, reuseIdentifier: "")

            marker.canShowCallout = true
            marker.leftCalloutAccessoryView = UIButton(type: .detailDisclosure)
            marker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            marker.image = UIImage(systemName: "pin")
            return marker
            
        case is DroppedPin: return nil
        default: return nil
            
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
    
        manager.showConfirmation = true
    
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        switch overlay {
        case is MKPolyline:
            let polyline = overlay as! MKPolyline
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 5
            return renderer
        case is MKCircle:
            let circle = overlay as! MKCircle
            let renderer = MKCircleRenderer(overlay: circle)
            return renderer
        case is MKPolygon:
            let polygon = overlay as! MKPolygon
            let renderer = MKPolygonRenderer(polygon: polygon)
            return renderer
        default:
            assert(false, "Unhandled Overlay")
        }
        
    }
    
    @objc func addPin(recognizer:UILongPressGestureRecognizer) {
        guard recognizer.state == .began else {return}
        let view = recognizer.view as! MKMapView
        let point = recognizer.location(in: view)
        let coordinate = view.convert(point, toCoordinateFrom: view)
        
        let pin = DroppedPin(coord: coordinate)
        view.addAnnotation(pin)
        
    }
}
