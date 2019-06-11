//
//  Move.swift
//  Pokedex
//
//  Created by Leonardo Braga on 10/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct Move: Codable {
    
    let name: String
    let type: PokemonType
    
}

extension Move: CustomStringConvertible {
    
    var description: String {
        return name.capitalized.replacingOccurrences(of: "-", with: " ", options: .literal, range: nil)
    }

}
