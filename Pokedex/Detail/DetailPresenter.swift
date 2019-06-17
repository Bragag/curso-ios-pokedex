//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Leonardo Braga on 16/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject {
    
    weak var view: DetailViewType?
    
    private lazy var interactor: DetailInteractorInput = DetailInteractor(output: self)
    
    private let requestMaker = RequestMaker()
    
    var pokemon: Pokemon!
    
    func requestPokemon() {
        print("pokemon", pokemon)
        self.interactor.requestPokemon(withId: self.pokemon.id)
    }
    
    override init() {
        pokemon = Pokemon(id: 1, name: "A", image: "", types: [.bug], description: "a", stats: [Status(value: 1, name: "a")])
    }
    
}

extension DetailPresenter: DetailInteractorOutput {
    
    func dataFetched(_ data: Pokemon) {
        self.pokemon = data

        DispatchQueue.main.async {
            self.view?.animatePokemonImageToTop()
        }
        
    }
}

