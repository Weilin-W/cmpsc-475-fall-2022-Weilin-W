//
//  BuildingListView.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/12/22.
//

import SwiftUI

struct BuildingListView: View {
    @EnvironmentObject var manager : MapManager
    @Binding var tab : Int
    
    var body: some View {
        List{
            ForEach(manager.entireBuildingList.indices, id: \.self){ index in
                NavigationLink(destination: BuildingDetailView(building: manager.entireBuildingList[index], tab: $tab)){
                    HStack{
                        Text(manager.entireBuildingList[index].name)
                        Spacer()
                        Image(systemName: manager.entireBuildingList[index].plotted ?? false ? "checkmark.square" : "square")
                    }
                }
            }
        }
    }
}

//struct BuildingListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingListView()
//    }
//}
