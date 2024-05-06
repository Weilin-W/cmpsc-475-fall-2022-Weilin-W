//
//  Pentominoes.swift
//  Assets for Assignment 4
//
//  Created by Hannan, John Joseph on 9/7/22.
//

import Foundation
import SwiftUI

// a tile with width/height in unit coordinates
struct Tile : Codable, Equatable{
    let name : String
    let width : Int
    let height : Int
    
    static let standard = Tile(name: "I", width: 1, height: 4)
}

// specifies the complete orientation of a piece using unit coordinates
struct Position : Codable, Equatable{
    var x : Int
    var y : Int
    var isFlipped : Bool
    var rotations : Int
    
    init() {
        x = 0
        y = 0
        isFlipped = false
        rotations = 0
    }
}

// a Piece is the model data that the view uses to display a pentomino
struct Piece : Codable, Equatable, Identifiable {
    let tile : Tile
    var position : Position
    var id = UUID()
    static let standard = Piece(tile: Tile.standard, position: Position())
}

struct SolutionData : Codable {
    let tile : Tile
    var position : Position
    
    static let standard = SolutionData(tile: Tile.standard, position: Position())
}

struct Center : Identifiable {
    var x : Double = 0
    var y : Double = 0
    var index : String
    var id = UUID()
    
    mutating func moveBy(width:Double, height:Double) {
        x += width
        y += height
    }
}

struct BoardData {
    
    //MARK: Six board names
    let boardName = ["Board0","Board1","Board2","Board3","Board4","Board5"]
    
    //MARK: Solution Data
    
}

// dict mapping piece name to a position
typealias Solution = [String: Position]
// an array of solutions where each element in the array represent
// a solution to a board
typealias Solutions = [Solution]
