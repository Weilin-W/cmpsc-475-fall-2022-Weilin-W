//
//  ScrollListView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct ScrollListView: View {
    //Word History:
    var pastWordsLst : [String]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                //To display words better on smaller screens
                Spacer()
                Spacer()
                //Display each words from the list array
                ForEach(pastWordsLst, id: \.self){word in
                    Text((word))
                }
                Spacer()
                Spacer()
            }.font(.largeTitle)
                .frame(maxWidth: .infinity, minHeight: 70, alignment: .leading)
        }.background(Color.red.opacity(0.43))
    }
}

struct ScrollListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollListView(pastWordsLst: ["pest","types"])
    }
}
