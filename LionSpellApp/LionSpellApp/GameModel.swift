//
//  GameModel.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 9/4/22.
//

import Foundation

struct OneGame{
    let initialScore : Int
    let totalButtons : Int
    let wordbank : [String]
    let language : String
}

struct AllGames : OneGameRound{
    let fiveCircleBtnGame = OneGame(initialScore: 0, totalButtons: 5, wordbank: Words.words, language: "English")
}

protocol OneGameRound{
    var fiveCircleBtnGame : OneGame {get}
}

