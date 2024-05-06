//
//  Show:HideView.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 10/4/22.
//

import SwiftUI

struct Show_HideView: View {
    @EnvironmentObject var manager : MapManager
    var letterAction : (String) -> Void
    var body: some View {
        if manager.hide == false{
            Button(action: {letterAction("hide")}) {
                Image(systemName: "eye.slash")
            }
        }else{
            Button(action: {letterAction("show")}) {
                Image(systemName: "eye")
            }
        }
        
    }
}

struct Show_HideView_Previews: PreviewProvider {
    static var previews: some View {
        Show_HideView(letterAction: {String_ in })
    }
}
