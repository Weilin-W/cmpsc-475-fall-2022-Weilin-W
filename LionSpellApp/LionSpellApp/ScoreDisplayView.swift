//
//  ScoreDisplayView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct ScoreDisplayView: View {
    var score : Int
    var body: some View {
        Text("Score: \(score)")
            .font(.largeTitle)
    }
}

struct ScoreDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreDisplayView(score: 0)
    }
}
