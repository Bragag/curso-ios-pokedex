//
//  Pokemon.swift
//  Pokedex
//
//  Created by Leonardo Braga on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    
    let pokemons: [Pokemon]
    
}

struct Pokemon: Codable {
    
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
        
}

extension Pokemon: CustomStringConvertible {
    
    var description: String {
        return  "\nPokemon: \(self.name.capitalized), com tipo(s): \(self.types)"
    }
    
    var capitalizedName: String {
        return name.capitalized
    }
    
    var displayId: String {
        let idWithZeros = id.leftPadding(toLength: 3, withPad: "0")
    
        return "#\(idWithZeros)"
    }
    
}
