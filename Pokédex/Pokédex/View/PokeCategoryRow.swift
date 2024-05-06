//
//  PokeCategoryRow.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/28/22.
//

import SwiftUI

struct PokeCategoryRow: View {
    @EnvironmentObject var manager : PokeManager
    var type : String
    var filter : (Poke) -> Bool
    var body: some View {
        VStack(alignment: .leading) {
                    Text(type)
                        .font(.headline)
                        .bold()
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            ForEach($manager.pokeDeck) {$poke in
                                if filter(poke) {
                                    NavigationLink(destination: PokeDetailView(pokemon: poke)) {
                                        PokeCard(pokemon: poke)
                                    }
                                    
                                }
                            }
                        }
                        
                        
                    }
                }
    }
}

struct PokeCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        PokeCategoryRow(type: "Pokemon", filter: {_ in true})
    }
}
