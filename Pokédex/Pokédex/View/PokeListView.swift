//
//  PokeListView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct PokeListView: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    //MARK: Init display variables
    let pokeIdFontSize : CGFloat = 15
    let pokeNameFontSize : CGFloat = 25
    let imageFrameSize : CGFloat = 80
    
    
    var body: some View {
        HStack{
            Text(String(pokemon.pokeId))
                .font(.system(size: pokeIdFontSize, weight: .heavy, design: .rounded))
                .foregroundColor(.brown)
            Text(pokemon.name)
                .font(.system(size: pokeNameFontSize, weight: .semibold, design: .rounded))
                .foregroundColor(.brown)
            Spacer()
            //MARK: Display image with background based off pokemon types
            Image(manager.formatted(pokeId: pokemon.pokeId))
                .resizable()
                .frame(width: imageFrameSize, height: imageFrameSize)
                .aspectRatio(contentMode: .fit)
                .background(
                    //MARK: Turn pokemon type array to array of colors
                    LinearGradient(gradient: Gradient(colors: pokeColorCollection(pokemonType: pokemon.pokeType)), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(20)
            //MARK: Diplay status of capture in list view
            Image(systemName: pokemon.captureStatus == true ? "hands.clap.fill" : "hands.clap")
                .frame(width: 5, height: 5)
                .foregroundColor(pokemon.captureStatus == true ? .yellow : .blue)
                .padding()
        }
    }
    
    //MARK: Take care of each element in the array of pokemon type and stored as an array of colors
    func pokeColorCollection(pokemonType : [PokemonType]) -> [Color]{
        var pokeColorCollection : [Color] = Array()
        for poke in pokemonType{
            pokeColorCollection.append(Color(pokemonType: poke))
        }
        return pokeColorCollection
    }
}

struct PokeListView_Previews: PreviewProvider {
    static var previews: some View {
        PokeListView(pokemon: Poke.standard)
    }
}
