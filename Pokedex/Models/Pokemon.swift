//
//  Pokemon.swift
//  Pokedex
//
//  Created by Leonardo Braga on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct Status: Codable {
    let value: Int
    let name: String
}

struct Pokemon: Codable {
    
    let id: Int
    let name: String
    let image: String
    let types: [PokemonType]
    let description: String?
    let stats: [Status]?
    
    var capitalizedName: String {
        return name.capitalized
    }
    
    var displayId: String {
        let idWithZeros = id
        
        return "#\(idWithZeros)"
    }
    
    var displayDescription: String {
        return self.description?.replacingOccurrences(of: "\n", with: "") ?? ""
    }
    
}

