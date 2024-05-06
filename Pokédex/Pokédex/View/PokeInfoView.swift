//
//  PokeInfoView.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import SwiftUI

struct PokeInfoView: View {
    @EnvironmentObject var manager : PokeManager
    let pokemon : Poke
    var body: some View {
        //TODO: Add font style
        VStack{
            HStack(){
                Text("Height")
                Spacer()
                    .frame(width: 20, height: 20)
                    .fixedSize()
                Text("Weight")
            }.font(.system(size: 25, weight: .bold, design: .rounded))
            HStack(alignment: .center){
                Text(String(pokemon.height))
                    .font(.system(size: 30, weight: .black, design: .rounded))
                Text("m")
                    .font(.system(size: 30, design: .rounded))
                Spacer()
                    .frame(width: 25, height: 25)
                    .fixedSize()
                Text(String(pokemon.weight))
                    .font(.system(size: 30, weight: .black, design: .rounded))
                Text("kg")
                    .font(.system(size: 30, design: .rounded))
            }
        }
    }
}

struct PokeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PokeInfoView(pokemon: Poke.standard)
    }
}
