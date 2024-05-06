//
//  Poke.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import Foundation

struct Poke :Identifiable, Codable, Equatable {
    let pokeId : Int
    let name : String
    let pokeType : [PokemonType]
    let height : Double
    let weight : Double
    let weakList : [PokemonType]
    let previousEvolution : [Int]?
    let nextEvolution : [Int]?
    
    var captureStatus : Bool?
    
    //Computed Properties
    var id : Int { pokeId }
    
    static let standard = Poke(pokeId: 2, name: "Ivysaur", pokeType: [], height: 0.99, weight: 13.0, weakList: [], previousEvolution: [1], nextEvolution: [3], captureStatus: false)
    
    enum CodingKeys : String, CodingKey {
        case pokeId = "id"
        case pokeType = "types"
        case weakList = "weaknesses"
        case previousEvolution = "prev_evolution"
        case nextEvolution = "next_evolution"
        case name, height, weight, captureStatus
    }
    
    mutating func toggleCapture() {
        if captureStatus == nil{
            captureStatus = false
        }
        captureStatus!.toggle()
    }
}

extension Poke {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pokeId = try values.decode(Int.self, forKey: .pokeId)
        name = try values.decode(String.self, forKey: .name)
        pokeType = try values.decode([PokemonType].self, forKey: .pokeType)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        weakList = try values.decode([PokemonType].self, forKey: .weakList)
        previousEvolution = try values.decodeIfPresent([Int].self, forKey: .previousEvolution)
        nextEvolution = try values.decodeIfPresent([Int].self, forKey: .nextEvolution)
        captureStatus = try values.decodeIfPresent(Bool.self, forKey: .captureStatus)
    }
}
