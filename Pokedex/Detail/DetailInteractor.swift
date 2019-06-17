//
//  DetailInteractor.swift
//  Pokedex
//
//  Created by Leonardo Braga on 16/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//


import Foundation

class DetailInteractor {
    
    private let requestMaker = RequestMaker()
    
    private weak var output: DetailInteractorOutput?
    
    init(output: DetailInteractorOutput) {
        self.output = output
    }
}

extension DetailInteractor: DetailInteractorInput {

    func requestPokemon(withId from: Int) {
        requestMaker.make(withEndpoint: .details(query: from)) {
            (pokemon: Pokemon) in
            
            self.output?.dataFetched(pokemon)
        }

    }
    
}
