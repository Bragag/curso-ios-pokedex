//
//  Moves.swift
//  Pokedex
//
//  Created by Leonardo Braga on 10/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct MovesList: Codable {
    
    let moves: [Move]
    
}

struct Move: Codable {
    
    let id: String
    let name: String
    let type: [PokemonType]
    
}
