//
//  GameBoard.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import SwiftUI
import UIKit

struct GameBoard: View {
    @EnvironmentObject var manager : GameManager
    //MARK: Displays end game status to the user
    @State var showConf = false
    @State var showWin = false
    let frameSize : CGFloat = 450
    var body: some View {
        ZStack(alignment: .topLeading){
            Button(action: manager.winningGame){
                NavigationLink(destination: StartingView()){
                    VStack{
                        Image("crown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .opacity(manager.cardDeck.count == 0 ? 1 : 0)
                            .position(x:225, y:225)
                        Text("Congrats, click the crown, you deserve it!")
                            .foregroundColor(.white)
                            .opacity(manager.cardDeck.count == 0 ? 1 : 0)
                    }
                }
            }.disabled(manager.cardDeck.count == 0 ? false : true)
            ForEach(manager.cardDeck){ card in
                ItemCard(card: card)
                    .onTapGesture {
                        if(manager.userCardDeck.count < 7 && manager.cardDeck.count != 0){
                            //MARK: Action append selected card to user's card deck
                            withAnimation(.linear(duration: 1)){
                                manager.cardAppendLogic(card: card)
                                if(manager.checkTriple(card: card)){
                                    manager.tripleRemove(card: card)
                                }
                            }
                        }else{
                            //MARK: Account losing game
                            manager.losingGame()
                            showConf.toggle()
                        }
                    }.position(x : CGFloat(card.position.x), y : CGFloat(card.position.y))
                //MARK: Alerts the user that game is ended
                    .alert("Your game ended unsuccessfully, please try again", isPresented: $showConf) {
                        NavigationLink(destination: StartingView()){
                            Text("Back to Main Page")
                        }
                    }
            }
        }.frame(width: frameSize, height: frameSize)
    }
}


struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard()
    }
}
