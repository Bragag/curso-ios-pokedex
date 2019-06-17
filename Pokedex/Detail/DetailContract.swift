//
//  DetailContract.swift
//  Pokedex
//
//  Created by Leonardo Braga on 16/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

protocol DetailViewType: AnyObject {
    func initialConfig()
    func animatePokemonImageToTop()
}

protocol DetailPresenterType: UIViewController {
    var view: DetailViewType? { get set }
    var pokemon: Pokemon? { get set }
    func requestPokemon(withId from: Int) -> Pokemon
    func animatePokemon()

    
}

protocol DetailInteractorInput {
    
    func requestPokemon(withId from: Int)

}

protocol DetailInteractorOutput: AnyObject {
    
    func dataFetched(_ data: Pokemon)
    
}

