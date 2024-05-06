//
//  ContentTabView.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/28/22.
//

import SwiftUI

struct ContentTabView: View {
    @EnvironmentObject var manager : PokeManager
    var body: some View {
        TabView {
            PokeHomeView()
                .tabItem {
                    Label("Poke Home", systemImage: "house")
                }
            PokeStackView()
                .tabItem {
                    Label("Poke List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
