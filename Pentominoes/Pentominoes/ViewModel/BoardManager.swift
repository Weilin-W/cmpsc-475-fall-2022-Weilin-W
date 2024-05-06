//
//  BoardManager.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import Foundation

class BoardManager : ObservableObject{
    
    @Published var boardName : String = "Board0"
    @Published var count : Int = 0
    var tiles : [Tile]
    //@Published var solutionDataSet : [Solutions]
    private let storageManager : StorageManager<[Tile]>
    //private let storageManagerData : StorageManager<[Solution]>
    let imageCount = 12
    @Published var imageCenters : [Center]
    init(){
        storageManager = StorageManager<[Tile]>(name: "Tiles")
        tiles = storageManager.modelData ?? []
        
//        storageManagerData = StorageManager<[Solution]>(name: "Solutions")
//        solutionDataSet = storageManagerData.modelData ?? []
        
        var _imageCenters = [Center]()
        for i in 0..<3 {
            let position = Center(x: Double(205 + i*290), y: 100, index: self.tiles[i].name)
            _imageCenters.append(position)
        }
        for i in 3..<6{
            let position = Center(x: Double(205 + (i%3)*290), y: 300, index: self.tiles[i].name)
            _imageCenters.append(position)
        }
        for i in 6..<9{
            let position = Center(x: Double(205 + (i%3)*290), y: 500, index:  self.tiles[i].name)
            _imageCenters.append(position)
        }
        for i in 9..<12{
            let position = Center(x: Double(205 + (i%3)*290), y: 700, index:  self.tiles[i].name)
            _imageCenters.append(position)
        }
        
        imageCenters = _imageCenters
    }

    func changeBoard(board : String){
        if(board == "Board0button"){
            boardName = "Board0"
        }else if(board == "Board1button"){
            boardName = "Board1"
        }else if(board == "Board2button"){
            boardName = "Board2"
        }else if(board == "Board3button"){
            boardName = "Board3"
        }else if(board == "Board4button"){
            boardName = "Board4"
        }else{
            boardName = "Board5"
        }
        
    }
    
    func resetButton(){
        count += 1
    }
    
    func save() {
        storageManager.save(modelData: tiles)
    }
    
}
