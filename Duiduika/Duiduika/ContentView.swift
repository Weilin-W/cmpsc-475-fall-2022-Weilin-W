//
//  ContentView.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6745018363, green: 0.4157250524, blue: 0.7881407738, alpha: 1)),Color(#colorLiteral(red: 0.4586400986, green: 0.8118094206, blue: 0.7567664981, alpha: 1)),Color(#colorLiteral(red: 0.3880509138, green: 0.7372908592, blue: 0.3568112254, alpha: 1))]), startPoint: .topLeading, endPoint: .center)
                .ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6745018363, green: 0.4157250524, blue: 0.7881407738, alpha: 1)),Color(#colorLiteral(red: 0.4586400986, green: 0.8118094206, blue: 0.7567664981, alpha: 1)),Color(#colorLiteral(red: 0.3880509138, green: 0.7372908592, blue: 0.3568112254, alpha: 1))]), startPoint: .bottomTrailing, endPoint: .center)
                .ignoresSafeArea()
            VStack{
                GameBoard()
                Spacer()
                UserCardDeck()
                Spacer()
                EraseThreeButton()
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
