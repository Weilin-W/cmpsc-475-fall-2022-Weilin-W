//
//  FileInfo.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import Foundation

struct FileInfo {
    let name : String
    let url : URL
    let exists : Bool
    
    init(for filename:String) {
        name = filename
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url =  documentURL.appendingPathComponent(filename + ".json")
        exists = fileManager.fileExists(atPath: url.path)
    }
    
    private init(name:String, url:URL, exists:Bool) {
        self.init(for:"")
    }
}

