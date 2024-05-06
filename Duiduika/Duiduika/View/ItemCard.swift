//
//  ItemCards.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var manager : GameManager
    let card : Card
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .border(Color.green.opacity(0.5), width: 150)
                .frame(width: 50, height: 55)
            Image(card.name)
                .resizable()
                .frame(width: 45, height: 50)
                .cornerRadius(5)
        }
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(card: Card.standard)
    }
}
