//
//  PokeManager.swift
//  Pokédex
//
//  Created by Wei Lin Weng on 10/19/22.
//

import Foundation

class PokeManager : ObservableObject {
    
    //MARK: Loading data from json
    @Published var pokeDeck : [Poke]
//    //MARK: Loading captured pokemons from json
//    @Published var capturePokeDeck : [Poke]
    //MARK: Init Json file
    let storageManager : StorageManager<[Poke]>
    
    //MARK: Initialize function
    init() {
        //MARK: initialize json data
        let filename = "pokedex"
        storageManager = StorageManager<[Poke]>(name:filename)
        pokeDeck = storageManager.modelData ?? []
//
//        capturePokeDeck = []
//        capturePokeDeck = self.pokeDeck.filter({$0.captureStatus == true})
    }
    
    //MARK: Formatting Function
    func formatted(pokeId:Int) -> String {
        String(format: "%03d", pokeId)
    }
    
    //MARK: Capture poke status update
    func capturePoke(pokemon: Poke){
        guard let index = self.pokeDeck.firstIndex(of: pokemon) else {return}
        pokeDeck[index].toggleCapture()
    }
    
    //MARK: PokeTypes Categories:
    var pokeTypes : [[PokemonType]] {
        let type = pokeDeck.map({$0.pokeType})
        return type
    }
    //MARK: Extends PokeType Category logic
    var categories : [PokeCategory]{
        var tempCategories : [PokeCategory] = []
        var _categories : [PokeCategory] = []
        //MARK: Get poke types for category rows
        for c in pokeTypes{ //for each []
            for index in 0..<c.count{ //to size of the array[]
                let pokeCategory = PokeCategory(type: c[index].rawValue, filter:{$0.pokeType.contains(PokemonType(rawValue: c[index].rawValue) ?? .poison)})
                _categories.append(pokeCategory)
            }
        }
        //MARK: Sort category rows
        tempCategories = Array(Set(_categories)).sorted()
        tempCategories.insert(PokeCategory(type: "Captured", filter: {$0.captureStatus ?? false}), at: 0)
        return tempCategories
    }
    
    //MARK: Search poke base off id return index in the pokedeck
    func searchPoke(pokeGenIndexes:[Int]) -> Int{
        for i in pokeGenIndexes{
            return self.pokeDeck.firstIndex(where: {$0.pokeId == i})!
        }
        return -1
    }
    
    //MARK: Previous poke base off reverse id return index in the pokedeck
    func searchPokePrev(pokeGenIndexes:[Int]) -> Int{
        for i in pokeGenIndexes.reversed(){
            return self.pokeDeck.firstIndex(where: {$0.pokeId == i})!
        }
        return -1
    }
    
    
    //MARK: Save captured pokemons into Json
    func save(){
        storageManager.save(modelData: pokeDeck)
    }
}
