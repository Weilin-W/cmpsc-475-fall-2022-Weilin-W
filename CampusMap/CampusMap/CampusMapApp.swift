//
//  CampusMapApp.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/27/22.
//

import SwiftUI

@main
struct CampusMapApp: App {
    @Environment(\.scenePhase) var scenePhase : ScenePhase
    @StateObject var manager = MapManager()
    var body: some Scene {
        WindowGroup {
            ContentTabView()
                .environmentObject(manager)
                .onChange(of: scenePhase) { view in
                    switch view{
                    case .background : break
                    case .active : break
                    case .inactive : break
                    @unknown default:
                        assert(false, "Unknown scene Phase")
                    }
                }
        }
    }
}
