//
//  PokemonList.swift
//  Pokedex
//
//  Created by Leonardo Braga on 10/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    let list: PokemonList
}

struct PokemonList: Codable {
    
    let pokemons: [Pokemon]
    
}
