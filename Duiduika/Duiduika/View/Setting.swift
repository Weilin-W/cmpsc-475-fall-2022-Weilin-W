//
//  Setting.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 12/11/22.
//

import SwiftUI

struct Setting: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all).opacity(0.7)
            VStack(){
                Text("Music Setting: ")
                HStack{
                    Button(action: manager.muteMusic) {
                        Image(systemName: manager.musicStatusPlaying ? "volume.3.fill" : "volume.slash.fill")
                        Text(manager.musicStatusPlaying ? "Music is currently playing" : "Music has stopped playing")
                    }.buttonStyle(.borderedProminent)
                }
                Spacer()
                Text("App Status: ")
                Text("Current version: v1.0.0")
                Text("Last Updated: 12/2022")
            }
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
