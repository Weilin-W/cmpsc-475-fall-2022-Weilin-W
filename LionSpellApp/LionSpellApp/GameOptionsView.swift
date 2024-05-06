//
//  GameOptionsView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct GameOptionsView: View {
    var newGameAction : () -> Void
    @Binding var showing : Showing?
    var body: some View {
        HStack{
            Spacer()
            Button(action: newGameAction){
                Label("", image: "newgameBtn")
            }
            Spacer()
            Button(action: {showing = .hints}){
                Label("", image: "hintsBtn")
            }
            Spacer()
            Button(action: {showing = .preferences}){
                Label("", image: "settingsBtn")
            }
            Spacer()
        }.padding(7).buttonStyle(.bordered).font(.footnote)
    }
}


struct GameOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionsView(newGameAction: {}, showing: .constant(nil))
    }
}
