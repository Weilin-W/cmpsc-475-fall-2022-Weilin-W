//
//  PokeStackView.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/28/22.
//

import SwiftUI

struct PokeStackView: View {
    @EnvironmentObject var manager : PokeManager
    var body: some View {
        NavigationStack{
            ContentView()
        }
    }
}

struct PokeStackView_Previews: PreviewProvider {
    static var previews: some View {
        PokeStackView()
    }
}
