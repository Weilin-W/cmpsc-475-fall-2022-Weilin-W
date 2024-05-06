//
//  PokeWeaknessView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct PokeWeaknessView: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    var body: some View {
        //MARK: Display weaknesses
        VStack(alignment: .leading){
            Text("Weaknesses")
                .font(.system(size: 25, weight: .heavy, design: .rounded))
                .foregroundColor(.orange)
                .padding(5)
            ScrollView(.horizontal, showsIndicators: false){
                //MARK: Add detailed pokemon weaknesses
                HStack{
                    ForEach(pokemon.weakList, id:\.self){ weakness in
                        //MARK: Label for the pokemon weakness
                        Text(weakness.rawValue)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width:100,height:50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(pairPokemonColor(pokeColor: weakness.rawValue))).opacity(0.9)
                    }
                }
            }
        }
    }
    
    //MARK: Pair weakness types to color types
    func pairPokemonColor(pokeColor : String) -> Color {
        //MARK: Current poke types
        let pokeWeaknessSet = pokemon.weakList
        var returnColor : Color = Color(.gray)
        for pokeIndex in 0..<pokeWeaknessSet.count{
            if (pokeColor == String(pokeWeaknessSet[pokeIndex].rawValue)){
                returnColor = Color(pokemonType: pokemon.weakList[pokeIndex])
            }
        }
        return returnColor
    }
}

struct PokeWeaknessView_Previews: PreviewProvider {
    static var previews: some View {
        PokeWeaknessView(pokemon: Poke.standard)
    }
}
