//
//  GameManager.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import Foundation
import AVFoundation
import MultipeerConnectivity


class GameManager : NSObject, ObservableObject {
    var music : AVAudioPlayer!
    @Published var cardDeck : [Card]
    @Published var userCardDeck : [Card]
    @Published var cardPosition : [Position]
    @Published var endGameStatus : Bool = false
    var storageManager : StorageManager<[Card]>
    //Game History
    @Published var winningGameCount = 0
    @Published var losingGameCount = 0
    
    //InGame Remove three cards from user's card deck
    @Published var threeCardCount = 20
    var threeCardAppend : Bool = false
    @Published var win = false
    //Multipeer Connectivity
    let duiduikaServiceType = "wwl-ddk"
    var peerId: MCPeerID
    var session: MCSession
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    
    @Published var musicStatusPlaying = true
    
    override init(){
        //MARK: initialize json data
        let filename = "Cards"
        storageManager = StorageManager<[Card]>(name:filename)
        cardDeck = storageManager.modelData ?? []
        userCardDeck = []
        cardPosition = [Position(x: 100, y: 100), Position(x: 225, y: 100), Position(x: 350, y: 100), Position(x: 100, y: 225), Position(x: 225, y: 225), Position(x: 350, y: 225), Position(x: 100, y: 350), Position(x: 225, y: 350), Position(x: 350, y: 350)]
        peerId = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerId, securityIdentity: nil, encryptionPreference: .required)
        super.init()
        //MARK: Check if no game running
        newGame()
        playMusic()
        session.delegate = self
        
    }
    
    //Multipeer Connectivity:
    func advertise(){
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerId, discoveryInfo: nil, serviceType: duiduikaServiceType)
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func invite(){
        _ = MCBrowserViewController(serviceType: duiduikaServiceType, session: session)
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        _ = windowScene?.windows.first
    }
    
    //MARK: BGM Music
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "ylgymusic", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.play()
            }
        }
    }
    
    func threeCardRmFromUserDeck(){
        if(userCardDeck.count >= 3){
            for index in 0...2{
                cardDeck.append(userCardDeck[index])
            }
            threeCardAppend = true
        }
        if(threeCardAppend){
            userCardDeck.removeFirst(3)
        }
        threeCardCount -= 1
    }
    
    func newGame(){
        cardDeck.removeAll()
        threeCardCount = 20
        win = false
        let filename = "Cards"
        storageManager = StorageManager<[Card]>(name:filename)
        cardDeck = storageManager.modelData ?? []
        userCardDeck = []
        cardDeck.shuffle()
        //MARK: Loops thru each index and assign the position of randomized cardDeck
        for card in 0..<cardDeck.count{
            cardDeck[card].position.x = cardPosition[card % 9].x
            cardDeck[card].position.y = cardPosition[card % 9].y
        }
    }
    
    func checkTriple(card:Card) -> Bool{
        let temp = userCardDeck.filter{$0.name == card.name}
        if temp.count == 3{
            return true
        }else{
            return false
        }
    }
    
    func tripleRemove(card:Card){
        let temp = userCardDeck.filter{$0.name != card.name}
        userCardDeck = temp
    }
    
    func userDeckAppend(index:Int){
        guard index != -1 else {return}
        userCardDeck.append(cardDeck[index])
    }
    
    func muteMusic(){
        musicStatusPlaying.toggle()
        if(musicStatusPlaying == true){
            music.play()
        }else{
            music.stop()
        }
    }
    
    
    func winningGame(){
        winningGameCount += 1
    }
    
    func losingGame(){
        losingGameCount += 1
    }
    
    func cardAppendLogic(card: Card){
        let index = cardDeck.firstIndex(where: {$0.cardId == card.cardId})
        if(!checkTriple(card: card)){
            guard index != nil else {return}
            userDeckAppend(index: index ?? -1)
            cardDeck.remove(at: index ?? -1)
        }else{
            tripleRemove(card: card)
        }
    }
    
    func endGame(){
        endGameStatus = true
    }
    
}
