//
//  PokeDetailView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct PokeDetailView: View {
    @EnvironmentObject var manager : PokeManager
    @Environment(\.dismiss) var dismiss
    var pokemon : Poke
    //MARK: Init display variables
    let frameSize : CGFloat = 375
    let imageCornerRadius : CGFloat = 15
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center){
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
                        //MARK: Adjust color of the font, and the position of the id on the image
                        Text(manager.formatted(pokeId: pokemon.pokeId))
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .padding([.bottom, .trailing], 5)
                    }
                    PokeInfoView(pokemon: pokemon)
                    PokeGenGButton(pokemon: pokemon)
                    PokeTypeListView(pokemon: pokemon)
                    PokeWeaknessView(pokemon: pokemon)
                    Spacer()
                }
            }
        }.navigationTitle(pokemon.name).navigationBarTitleDisplayMode(.inline).font(.largeTitle).toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                //FIXME: Check if captured, need to fix the capture status
                Button(action:{
                    //MARK: Dismiss detail view after release action in captured row
                    if(pokemon.captureStatus == false){
                        manager.capturePoke(pokemon: pokemon)
                    }else{
                        manager.capturePoke(pokemon: pokemon)
                        dismiss()
                    }
                    
                }) {
                    Image(systemName: pokemon.captureStatus == true ? "hands.clap.fill" : "hands.clap")
                    Text(pokemon.captureStatus == true ? "Release" : "Capture")
                }
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

struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetailView(pokemon: Poke.standard)
    }
}
