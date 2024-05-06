//
//  BuildingDetailView.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/30/22.
//

import SwiftUI
import CoreLocation

struct BuildingDetailView: View {
    @EnvironmentObject var manager : MapManager
    @Environment (\.dismiss) private var dismiss
    var building : Building?
    @Binding var tab : Int
    private var title : String {
        guard building != nil else {return "unknown"}
        return building!.name
    }
    
    private var year : Int {
        guard building != nil else {return 0000}
        return building!.year_constructed ?? 0000
    }
    
    private var isFavorite : Bool {
        guard building != nil else {return false}
        return building!.favorite ?? false
    }
    
    var body: some View {
        
        return VStack {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .font(.system(size:80))
                .padding()
                //.rotationEffect(.degrees(angle))
                .foregroundColor(isFavorite ? .red : .cyan)
                .onTapGesture {
                    manager.toggleFavorite(building: building!)
                }
            Text(title)
                .font(.system(size:30))
            Text(String(building?.year_constructed ?? 2022))
                .opacity(String(building?.year_constructed ?? 2022) == "2022" ? 0 : 1)
            Image(building?.photo ?? "none")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(width: 250, height: 250)
            Button(isFavorite ? "Unfavorite" : "Favorite") {
                //guard manager.selectedBuilding != nil else {return}
                manager.toggleFavorite(building: building!)
            }.buttonStyle(.bordered)
            HStack{
                Button(action: {appendBuildingToPlot(for: building!)}) {
                    Text("Plot Building")
                }.buttonStyle(.bordered)
                Button(action: {removeBuildingToPlot(for: building!)}) {
                    Text("Unplot Building")
                }.buttonStyle(.bordered)
            }
        }
    }
    
    //MARK: Local actions
    func appendBuildingToPlot(for building: Building){
        manager.selectedPlottedBuildings.append(building)
        guard let index = manager.entireBuildingList.firstIndex(of: building) else {return}
        let bool = manager.entireBuildingList[index].plotted ?? false
        if (bool == false){
            manager.entireBuildingList[index].plotted = true
        }
        manager.region.center = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
        tab = 0
        dismiss()
    }
    
    func removeBuildingToPlot(for building: Building){
        guard let index = manager.entireBuildingList.firstIndex(of: building) else {return}
        manager.selectedPlottedBuildings.remove(at: index)
        let boolPlot = manager.entireBuildingList[index].plotted ?? false
        let boolFav = manager.entireBuildingList[index].favorite ?? false
        //MARK: Reset building plot status
        if (boolPlot == true){
            manager.entireBuildingList[index].plotted = false
        }
        //MARK: Reset building favorite status
        if (boolFav == true){
            manager.entireBuildingList[index].favorite = false
        }
        manager.region.center = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
        tab = 0
        dismiss()
    }
}

//struct BuildingDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingDetailView()
//    }
//}
