//
//  EraseThreeButton.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 12/10/22.
//

import SwiftUI

struct EraseThreeButton: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        VStack{
            HStack{
                Button(action: manager.threeCardRmFromUserDeck) {
                    Image("threeCards")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                }.buttonStyle(.borderedProminent).frame(width: 50, height: 50).disabled(manager.threeCardCount != 0 ? false : true).disabled(manager.userCardDeck.count >= 3 ? false : true).padding()
                NavigationLink(destination: StartingView()){
                    Image(systemName: "homekit")
                }.foregroundColor(.white).buttonStyle(.borderedProminent).frame(width: 50, height: 50).navigationBarBackButtonHidden(true).padding()
            }
            Text("Put back chance x\(manager.threeCardCount)")
            Text("Number of game cards: \(manager.cardDeck.count)")
            Text("Number of user cards: \(manager.userCardDeck.count)")
        }
    }
}

struct EraseThreeButton_Previews: PreviewProvider {
    static var previews: some View {
        EraseThreeButton()
    }
}
