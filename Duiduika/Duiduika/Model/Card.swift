//
//  Card.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 11/2/22.
//

import Foundation

struct Card : Codable, Identifiable, Equatable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
    }
    let cardId : Int
    let name : String
    var position : Position
    var id : Int {cardId}
    
    static let standard = Card(cardId: 0, name: "fire", position: Position.standard)
    
    enum CodingKeys : String, CodingKey {
        case cardId = "Id"
        case name, position
    }
    
    
}
//MARK: Geometry reader to get position
struct Position : Codable{
    var x : Int
    var y : Int
    
    static let standard = Position(x: 1, y: 1)
}

extension Card {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cardId = try values.decode(Int.self, forKey: .cardId)
        name = try values.decode(String.self, forKey: .name)
        position = try values.decodeIfPresent(Position.self, forKey: .position) ?? Position(x: 100, y: 100)
    }
}
