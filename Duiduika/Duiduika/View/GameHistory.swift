//
//  GameHistory.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 12/11/22.
//

import SwiftUI

struct GameHistory: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all).opacity(0.7)
            VStack{
                ZStack(alignment: .bottomTrailing){
                    Image("crown")
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                Text("# of Winning Games: \(manager.winningGameCount)")
                    .foregroundColor(.yellow)
                Text("# of Losing Games: \(manager.losingGameCount)")
                    .foregroundColor(.red)
            }.font(.title)
        }
    }
}

struct GameHistory_Previews: PreviewProvider {
    static var previews: some View {
        GameHistory()
    }
}
