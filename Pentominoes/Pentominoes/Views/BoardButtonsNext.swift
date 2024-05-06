//
//  BoardButtonsNext.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import SwiftUI

struct BoardButtonsNext: View {
    var editBoardAction : (String) -> Void
    var resetButtonAction : () -> Void
    var body: some View {
        //MARK: Display second(3...5) set of buttons
        let secondSet = ["Board3button","Board4button","Board5button"]
        VStack{
            ForEach(secondSet, id:\.self){ buttons in
                Button(action: {editBoardAction(buttons)}) {
                    Image(buttons)
                }
            }
            Button(action: resetButtonAction) {
                Label("Reset", systemImage: "arrow.triangle.2.circlepath.circle.fill")
            }.padding().background(Color.black.opacity(0.2))
        }
    }
}

struct BoardButtonsNext_Previews: PreviewProvider {
    static var previews: some View {
        BoardButtonsNext(editBoardAction: {String_ in }, resetButtonAction: {})
    }
}
