//
//  ContentTabView.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/12/22.
//

import SwiftUI

struct ContentTabView: View {
    @EnvironmentObject var manager : MapManager
    @State var tabSelected : Int = 0
    @State var showFavorite : Bool = true
    
    var body: some View {
//        let show_hide = ToolbarItem(placement: .navigationBarTrailing){
//            Show_HideView(letterAction: manager.hide)
//        }
        return NavigationStack {
            TabView(selection: $tabSelected) {
                UIMap(manager: manager)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Campus Map")
                    }.navigationBarTitleDisplayMode(.automatic).tag(0)
                BuildingListView(tab: $tabSelected)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Building List")
                    }.navigationBarTitleDisplayMode(.automatic).tag(1)
                SettingPage(tab: $tabSelected)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Setting")
                    }.navigationBarTitleDisplayMode(.automatic).tag(2)
            }.toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action:{
                        manager.geoCodeForUsersLocation()
                    }) {
                        Image(systemName: "location.fill")
                        Text("My Location")
                    }
                }
                //show_hide
                
            }
            //MARK: Shows Travel Time
            .sheet(isPresented: $manager.showingAlert, content: {
                Text("Travel Time: \(manager.usersLocationDescription ?? "No Info Available")")
            })
            .sheet(isPresented: $manager.showSheet, content: {
                BuildingDetailView(building: manager.selectedBuilding, tab: $tabSelected)
            })
            .confirmationDialog("spot", isPresented: $manager.showConfirmation, presenting: manager.selectedBuilding) { place in
                Button(place.favorite ?? false ? "Unfavorite" : "Favorite") {
                    manager.toggleFavorite(building: place)
                }
                Button("Directions") {
                    manager.provideDirections(to: place)
                }
                Button("Details") {
                    manager.selectedBuilding = place
                    manager.showSheet = true
                }
            } message: { place in
                Text("\(place.name)")
            }
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
