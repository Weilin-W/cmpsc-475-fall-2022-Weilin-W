//
//  ContentView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager : PokeManager
    //var pokeListDeck : [Poke]
    @State private var pokeSelection: [PokemonType] = [PokemonType.poison, PokemonType.bug, PokemonType.dragon, PokemonType.electric, PokemonType.fighting, PokemonType.fire, PokemonType.flying, PokemonType.ghost, PokemonType.grass, PokemonType.ground, PokemonType.ice, PokemonType.normal, PokemonType.psychic, PokemonType.rock, PokemonType.water]
    var body: some View {
        NavigationStack {
            List{
                ForEach(manager.pokeDeck.indices, id:\.self){ pokemon in
                    NavigationLink(destination: PokeDetailView(pokemon: manager.pokeDeck[pokemon])){
                        PokeListView(pokemon: manager.pokeDeck[pokemon])
                    }
                }
            }.navigationTitle("Pokédex").navigationBarTitleDisplayMode(.inline).font(.largeTitle)
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("PokeType", selection: $pokeSelection){
                    ForEach(self.pokeSelection, id:\.self) { item in
                        Text(item.id).tag(item.id)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
