//
//  BoardButtons.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import SwiftUI

struct BoardButtons: View {
    var editBoardAction : (String) -> Void
    var body: some View {
        //MARK: Display first(0...2) set of buttons
        let firstSet = ["Board0button","Board1button","Board2button"]
        
        VStack{
            ForEach(firstSet, id:\.self){ buttons in
                Button(action: {editBoardAction(buttons)}) {
                    Image(buttons)
                }
            }
            Button(action: {}) {
                Label("Solve", systemImage: "person.circle.fill")
            }.padding().background(Color.black.opacity(0.2))
        }
    }
}

struct BoardButtons_Previews: PreviewProvider {
    static var previews: some View {
        BoardButtons(editBoardAction: {String_ in })
    }
}
