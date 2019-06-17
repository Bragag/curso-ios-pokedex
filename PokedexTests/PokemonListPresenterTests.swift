//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by Leonardo Braga on 15/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonListPresenterTests: XCTestCase {

    func testExample() {
        let expectation = XCTestExpectation(description: "")
        let presenter = PokemonListPresenter()
        let view = PokemonsListViewMock() {
            expectation.fulfill()
        }
        presenter.view = view
        presenter.fetchData()
        
        wait(for: [expectation], timeout: 1)
    }

}

class PokemonsListViewMock: PokemonListViewType {
    let fulfill: () -> Void
    
    init(fulfill: @escaping () -> Void) {
        self.fulfill = fulfill
    }
    
    func reloadData() {
        self.fulfill()
    }
}
