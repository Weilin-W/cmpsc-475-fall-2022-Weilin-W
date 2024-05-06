//
//  Building.swift
//  CampusMap
//
//  Created by Wei Lin Weng on 9/27/22.
//

import Foundation
import MapKit

struct Building : Codable, Identifiable, Equatable, Comparable, Hashable{
    var latitude : Double
    var longitude : Double
    var name : String
    var opp_bldg_code : Int
    var year_constructed : Int?
    var photo : String?
    var id : Int {opp_bldg_code}
    
    var favorite : Bool? = false
    var plotted : Bool? = false
    
    static func < (lhs: Building, rhs: Building) -> Bool {
        return lhs.name < rhs.name
    }
    
    static var buildings = {
        var builds : [Building] = []
        let storageManager : StorageManager<[Building]>
        storageManager = StorageManager<[Building]>(name: "buildings")
        builds = storageManager.modelData ?? []
        builds.sort()
        return builds
    }() as [Building]
}
