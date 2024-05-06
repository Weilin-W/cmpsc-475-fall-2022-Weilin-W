//
//  DuiduikaApp.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import SwiftUI

@main
struct DuiduikaApp: App {
    @StateObject var manager = GameManager()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            StartingView()
                .environmentObject(manager)
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                manager.music.stop()
            case .active:
                if(manager.musicStatusPlaying == true){
                    manager.music.play()
                }
            case .inactive:
                manager.music.stop()
            @unknown default:
                assert(false, "Unknown scene Phase")
            }
        }
    }
}
