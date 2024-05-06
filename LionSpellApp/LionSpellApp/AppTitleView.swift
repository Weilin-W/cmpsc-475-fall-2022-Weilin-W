//
//  AppTitleView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct AppTitleView: View {
    //Create a list that stores the values of each letter for the title
    var TitleText : [String]
    var body: some View {
        //Display each letter from the array with a blue backgound
        HStack{
            ForEach(TitleText, id: \.self){text in
                ZStack{
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 33, height: 40)
                        .cornerRadius(80)
                    Text(text)
                        .foregroundColor(.white)
                }
            }
        }.padding(5).font(.largeTitle)
    }
}

struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView(TitleText: ["L","I","O","N","S","P","E","L","L"])
    }
}
