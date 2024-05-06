//
//  StartingView.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/18/22.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        NavigationStack{
            ZStack{
                Color.green.edgesIgnoringSafeArea(.all).opacity(0.7)
                VStack{
                    Image("Dui")
                        .resizable()
                        .frame(width: 300, height: 300)
                    NavigationLink(destination: ContentView()){
                        Text("Single Player")
                    }.foregroundColor(.white).buttonStyle(.borderedProminent).frame(width: 200, height: 50).disabled(false).simultaneousGesture(TapGesture().onEnded{
                        manager.newGame()
                    })
                    //TODO: MULTIPLAYER VIEW
                    NavigationLink(destination: {}){
                        Text("Multiple Player")
                    }.foregroundColor(.white).buttonStyle(.borderedProminent).frame(width: 200, height: 50).disabled(true).simultaneousGesture(TapGesture().onEnded{
                        //device connection
                    })
                    //TODO: GAME HISTORY VIEW
                    NavigationLink(destination: GameHistory()){
                        Text("Game History")
                    }.foregroundColor(.white).buttonStyle(.borderedProminent).frame(width: 200, height: 50).disabled(false).simultaneousGesture(TapGesture().onEnded{
                        //manager.showGameHistory()
                    })
                    //TODO: MEDIA CONTROL VIEW
                    NavigationLink(destination: Setting()){
                        Text("Settings")
                    }.foregroundColor(.white).buttonStyle(.borderedProminent).frame(width: 200, height: 50).disabled(false).simultaneousGesture(TapGesture().onEnded{
                        //manager.showSettings()
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement:.bottomBar) {
                    Button(action: manager.muteMusic) {
                        Image(systemName: manager.musicStatusPlaying ? "volume.3.fill" : "volume.slash.fill")
                        Text(manager.musicStatusPlaying ? "Music is currently playing" : "Music has stopped playing")
                            .foregroundColor(.white)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
