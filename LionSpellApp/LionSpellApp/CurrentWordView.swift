//
//  CurrentWordView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct CurrentWordView: View {
    var currentListArr : [String]
    
    var body: some View {
        HStack(alignment: .center){
            ForEach(currentListArr, id: \.self){letterTyped in
                Text(letterTyped)
                    .font(.title)
            }
        }
    }
}

struct CurrentWordView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWordView(currentListArr: ["p","e","p"])
    }
}
