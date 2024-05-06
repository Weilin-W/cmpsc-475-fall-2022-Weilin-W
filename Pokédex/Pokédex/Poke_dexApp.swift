//
//  Poke_dexApp.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

@main
struct Poke_dexApp: App {
    @StateObject var manager = PokeManager()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentTabView()
                .environmentObject(manager)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                manager.save()
            case .active:
                break
            case .inactive:
                manager.save()
            @unknown default:
                assert(false, "Unknown scene Phase")
            }
        }
    }
}
