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
    
    func requestPokemon() {
        if let view = self.view {
            self.interactor.requestPokemon(withId: view.pokemon?.id ?? 1)
        }
    }
    
}

extension DetailPresenter: DetailInteractorOutput {
    
    func dataFetched(_ data: Pokemon) {
        self.view?.pokemon = data

        DispatchQueue.main.async {
            self.view?.animatePokemonImageToTop()
            self.view?.additionalConfig()
        }
        
    }
}

