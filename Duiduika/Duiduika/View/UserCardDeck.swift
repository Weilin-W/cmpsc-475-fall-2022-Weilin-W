//
//  UserCardDeck.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import SwiftUI

struct UserCardDeck: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        HStack{
            ForEach(manager.userCardDeck){ card in
                if(manager.userCardDeck.count <= 7){
                    ItemCard(card: card)
                }
            }
        }
    }
}

struct UserCardDeck_Previews: PreviewProvider {
    static var previews: some View {
        UserCardDeck()
    }
}
