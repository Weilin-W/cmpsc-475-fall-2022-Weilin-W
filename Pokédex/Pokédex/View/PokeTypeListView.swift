//
//  PokeTypeListView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct PokeTypeListView: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    var body: some View {
        //MARK: Display types
        VStack(alignment: .leading){
            Text("Types")
                .font(.system(size: 25, weight: .heavy, design: .rounded))
                .foregroundColor(.orange)
                .padding(5)
            //MARK: Horizontal scroll view for all types
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Spacer()
                    //MARK: Display all pokemon types with corresponded color
                    ForEach(pokemon.pokeType.indices, id:\.self){ pokeIndex in
                        //MARK: Label for the pokemon types
                        Text(pokemon.pokeType[pokeIndex].id)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width:100,height:50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(pairPokemonColor(pokeColor: pokemon.pokeType[pokeIndex].id)).opacity(0.9))
                    }
                    Spacer()
                }
            }
        }
    }
    
    //MARK: Pair poketype types to color types
    func pairPokemonColor(pokeColor : String) -> Color {
        //MARK: Current poke types
        let pokeTypeSet = pokemon.pokeType
        var returnColor : Color = Color(.gray)
        for pokeIndex in 0..<pokeTypeSet.count{
            if (pokeColor == String(pokeTypeSet[pokeIndex].rawValue)){
                returnColor = Color(pokemonType: pokemon.pokeType[pokeIndex])
            }
        }
        return returnColor
    }
}

struct PokeTypeListView_Previews: PreviewProvider {
    static var previews: some View {
        PokeTypeListView(pokemon: Poke.standard)
    }
}
