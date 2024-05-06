//
//  SettingPage.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/18/22.
//

import SwiftUI
import MapKit

struct SettingPage: View {
    @EnvironmentObject var manager : MapManager
    @Environment (\.dismiss) private var dismiss
    
    @Binding var tab : Int
    var body: some View {
        HStack{
            Button(action: {mapActionAdjust(map: "Standard")}) {
                Text("Standard")
                Image(systemName: "map")
            }.buttonStyle(.bordered)
            Button(action: {mapActionAdjust(map: "Satellite")}) {
                Text("Satellite")
                Image(systemName: "map")
            }.buttonStyle(.bordered)
            Button(action: {mapActionAdjust(map: "Hybrid")}) {
                Text("Hybrid")
                Image(systemName: "map")
            }.buttonStyle(.bordered)
        }
    }
    
    func mapActionAdjust(map : String){
        if map == "Standard"{
            manager.mapStyle = .standard
        }else if map == "Satellite"{
            manager.mapStyle = .satellite
        }else{
            manager.mapStyle = .hybrid
        }
        tab = 0
        dismiss()
    }
}

//struct SettingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingPage()
//    }
//}
