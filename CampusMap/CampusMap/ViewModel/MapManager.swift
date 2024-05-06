//
//  MapManager.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/27/22.
//

import Foundation
import MapKit
import SwiftUI
import CoreLocation

class MapManager  : NSObject, ObservableObject {
    
    @Published var locationModel = LocationModel()
    @Published var region : MKCoordinateRegion
    @Published var route : MKRoute?
    @Published var etaTime: String?
    //let downtownOverlay : MKPolygon
    let span = 0.017
    
    //Organized the plotted buildings and list of buildings
    @Published var entireBuildingList : [Building]
    @Published var selectedPlottedBuildings : [Building] = []
    
    //Routes
    @Published var routes =  [MKPolyline]()
    
    // presenters
    @Published var showConfirmation : Bool = false
    @Published var showSheet : Bool = false
    @Published var hide : Bool = false
    @Published var userDirection : String = ""
    @Published var mapStyle : MKMapType
    
    let locationManager : CLLocationManager
    var usersRecentLocation : CLLocation?
    @Published var showingAlert = false
    @Published var usersLocationDescription : String?
    private let storageManager : StorageManager<[Building]>
    
    override init() {
        let _locationModel = LocationModel()
        storageManager = StorageManager<[Building]>(name: "buildings")
        entireBuildingList = storageManager.modelData ?? []
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        //downtownOverlay = MKPolygon(coordinates: CLLocationCoordinate2D(latitude: _locationModel.centerCoord.latitude, longitude: _locationModel.centerCoord.longitude), count: 1)
        self.locationModel = _locationModel
        locationManager = CLLocationManager()
        self.mapStyle = .standard
        super.init()
        self.entireBuildingList.sort()
        
        locationManager.desiredAccuracy = .leastNonzeroMagnitude
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
    //SelectedBuilding
    @Published var selectedBuilding : Building? {
        didSet {
            if let selectedBuilding = selectedBuilding {
                self.building.removeAll()
                self.building.append(selectedBuilding)
                let bool = self.selectedBuilding?.plotted ?? false
                if (bool == false){
                    self.selectedBuilding?.plotted = true
                }
                self.temp.append(selectedBuilding)
                //Break point test
                self.region.center = CLLocationCoordinate2D(latitude: selectedBuilding.latitude, longitude: selectedBuilding.longitude)
                self.region.span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
            }
        }
    }
    
    var plottedBuildings : [Building]{
        let favoritedBuildings = entireBuildingList.filter({$0.favorite ?? false})
        if(favoritedBuildings.count > 0){
            let buildingSet = Set(favoritedBuildings).union(Set(selectedPlottedBuildings))
            return Array(buildingSet)
        }else{
            return selectedPlottedBuildings
        }
    }
    
    @Published var building = [Building]()
    @Published var temp = [Building]()
    
    
    //MARK: Helper Methods
    func toggleFavorite(building: Building) {
        guard let index = self.entireBuildingList.firstIndex(of: building) else {return}
        let bool = self.entireBuildingList[index].favorite ?? false
        if (bool == false){
            self.entireBuildingList[index].favorite = true
        }else{
            //Unfavorite
            self.entireBuildingList[index].favorite = false
        }
    }
    
    func hide(letter : String){
        if letter == "show"{
            self.hide = false
            guard temp.count != 0 else {return}
            self.building.append(temp[0])
            self.temp.removeAll()
        }else if letter == "hide"{
            self.hide = true
            guard building.count == 0 else {return}
            self.building.removeAll()
        }
    }
    
    func changeMap(map : String){
        if map == "Standard"{
            self.mapStyle = .standard
        }else if map == "Satellite"{
            self.mapStyle = .satellite
        }else if map == "Hybrid" {
            self.mapStyle = .hybrid
        }
    }
    
    
    func save() {
        storageManager.save(modelData: building)
    }
    var userTrackingMode : MKUserTrackingMode = MKUserTrackingMode.none
    func geoCodeForUsersLocation() {
        guard let usersRecentLocation = usersRecentLocation else {return}
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(usersRecentLocation) { placeMarks, error in
            guard error == nil else {print(error?.localizedDescription ?? "No info"); return}
            
            if let placeMark = placeMarks?.first {
                let mark = MKPlacemark(placemark: placeMark)
                let userCoord = mark.coordinate
                self.region.center = CLLocationCoordinate2D(latitude: userCoord.latitude, longitude: userCoord.longitude)
                self.userTrackingMode = MKUserTrackingMode.follow
            }
        }
    }
}
    
    extension Coord {
        var coordCL2D : CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        }
    }
