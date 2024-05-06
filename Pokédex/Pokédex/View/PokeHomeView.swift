//
//  PokeHomeView.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/22/22.
//

import SwiftUI

struct PokeHomeView: View {
    @EnvironmentObject var manager : PokeManager

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(Array(manager.categories)){category in
                        if !manager.isEmpty(category: category) {
                            PokeCategoryRow(type: category.type, filter: category.filter)
                        }
                    }
                }
            }.navigationTitle("Pokédex").navigationBarTitleDisplayMode(.inline).font(.largeTitle)
        }
    }
}

struct PokeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PokeHomeView()
    }
}
