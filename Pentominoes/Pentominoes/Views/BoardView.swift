//
//  BoardView.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import SwiftUI

struct BoardView: View {
    //MARK: Input board name/Set the current board
    var setBoard : String
    
    var body: some View {
        //MARK: Display current board
        Image(setBoard).resizable()
            .frame(width: 560, height: 560)
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(setBoard: "Board0")
    }
}
