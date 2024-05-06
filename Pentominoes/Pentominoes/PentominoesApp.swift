//
//  PentominoesApp.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/18/22.
//

import SwiftUI

@main
struct PentominoesApp: App {
    @Environment(\.scenePhase) var scenePhase : ScenePhase
    @StateObject var manager = BoardManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { view in
                    switch view{
                    case .background : manager.save()
                    case .active : break
                    case .inactive : break
                    @unknown default:
                        assert(false, "Unknown scene Phase")
                    }
                }
            
        }
    }
}
