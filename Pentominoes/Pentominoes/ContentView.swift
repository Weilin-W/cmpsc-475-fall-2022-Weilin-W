//
//  ContentView.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var boardManager = BoardManager()
    var body: some View {
        ZStack(){
            Color.orange
                .opacity(0.8)
                .ignoresSafeArea()
            //MARK: VSTACK contains boardbuttons/board/cubes
            VStack{
                Spacer()
                HStack(alignment: .center){
                    BoardButtons(editBoardAction: boardManager.changeBoard)
                    BoardView(setBoard: boardManager.boardName)
                    BoardButtonsNext(editBoardAction: boardManager.changeBoard, resetButtonAction: boardManager.resetButton)
                }
                Pentominoes()
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
