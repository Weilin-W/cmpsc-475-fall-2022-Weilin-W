//
//  PokeGenGButton.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/31/22.
//

import SwiftUI

struct PokeGenGButton: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    var body: some View {
        HStack{
            Spacer()
            //MARK: Enable previous generation pokemon transform
            if(manager.searchPokePrev(pokeGenIndexes: pokemon.previousEvolution ?? []) >= 0){
                NavigationLink(destination: PokeDetailView(pokemon: manager.pokeDeck[manager.searchPokePrev(pokeGenIndexes: pokemon.previousEvolution ?? [])])){
                    Image(systemName: "arrowtriangle.left.fill")
                }
            }
            Spacer()
            //MARK: Enable next generation pokemon transform
            if(manager.searchPoke(pokeGenIndexes: pokemon.nextEvolution ?? []) >= 0){
                NavigationLink(destination: PokeDetailView(pokemon: manager.pokeDeck[manager.searchPoke(pokeGenIndexes: pokemon.nextEvolution ?? [])])){
                    Image(systemName: "arrowtriangle.right.fill")
                }
            }
            Spacer()
        }
    }
}

struct PokeGenGButton_Previews: PreviewProvider {
    static var previews: some View {
        PokeGenGButton(pokemon: Poke.standard)
    }
}
