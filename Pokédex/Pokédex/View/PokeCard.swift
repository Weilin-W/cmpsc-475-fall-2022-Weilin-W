//
//  PokeCard.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/28/22.
//

import SwiftUI

struct PokeCard: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    //MARK: Init display variables
    let frameSize : CGFloat = 100
    let imageCornerRadius : CGFloat = 15
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            //MARK: Display Color in the array
            Image(manager.formatted(pokeId: pokemon.pokeId))
                .resizable()
                .frame(width: frameSize, height: frameSize)
                .aspectRatio(contentMode: .fit)
                .background(
                    //MARK: Turn pokemon type array to array of colors
                    LinearGradient(gradient: Gradient(colors: pokeColorCollection(pokemonType: pokemon.pokeType)), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(imageCornerRadius)
            HStack{
                Image(systemName: pokemon.captureStatus == true ? "hands.clap.fill" : "hands.clap")
                    .frame(width: 5, height: 5)
                    .foregroundColor(pokemon.captureStatus == true ? .yellow : .blue)
                    .padding()
                Spacer()
                //MARK: Adjust color of the font, and the position of the id on the image
                Text(manager.formatted(pokeId: pokemon.pokeId))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .padding([.bottom, .trailing], 5)
            }
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

struct PokeCard_Previews: PreviewProvider {
    static var previews: some View {
        PokeCard(pokemon: Poke.standard)
    }
}
