//
//  PokeCategory.swift
//  Pokedex
//
//  Created by Wei Lin Weng on 10/28/22.
//

import Foundation

extension PokeManager {
    struct PokeCategory : Identifiable, Hashable, Equatable, Comparable{
        static func < (lhs: PokeCategory, rhs: PokeCategory) -> Bool {
            return lhs.type < rhs.type
        }
        
        
        
        static func == (lhs: PokeCategory, rhs: PokeCategory) -> Bool {
            return lhs.type == rhs.type
        }
        
        let type : String
        let filter : (Poke) -> Bool
        var id : String {type}
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(type)
        }
    }
    
    func isEmpty(category:PokeCategory) -> Bool {
            pokeDeck.reduce(true) { partialResult, s in
                !category.filter(s) && partialResult
            }
    }
}
