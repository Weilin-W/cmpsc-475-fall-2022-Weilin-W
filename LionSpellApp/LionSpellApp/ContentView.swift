//
//  ContentView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/22/22.
//

import SwiftUI
enum Showing : String, Identifiable, CaseIterable {
    case preferences, hints
    var id: RawValue { rawValue }
}

struct ContentView: View {
    @ObservedObject var newGameManager = NewGameManager()
    @State private var showing : Showing?
    init(){
        newGameManager.retrieveFromWordBank()
    }
    var body: some View {
        ZStack{
            Color.blue
                .opacity(0.1)
                .ignoresSafeArea()
            VStack{
                AppTitleView(TitleText: ["L","I","O","N","S","P","E","L","L"])
                Spacer()
                ScrollListView(pastWordsLst: newGameManager.scrollList)
                Spacer()
                CurrentWordView(currentListArr: newGameManager.currentLetterArr)
                Spacer()
                TextButtonView(textListArr: newGameManager.letterArr, letterAction: newGameManager.appendLetter)
                DeleteSubmitButtonView(deleteAction: newGameManager.deleteWord, submitAction: newGameManager.submitWord, isDeletable: newGameManager.isDeletable, isSubmitable: newGameManager.isSubmitable)
                ScoreDisplayView(score: newGameManager.currentScore)
                GameOptionsView(newGameAction: newGameManager.newGame, showing : $showing)
            }
            .sheet(item: $showing) {item in
                switch item{
                case.preferences: PreferenceView()
                case.hints: HintView()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
