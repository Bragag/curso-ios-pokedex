//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Leonardo Braga on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet var gradientView: GradientView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewCenterVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonTypeView: PokemonTypeView!
    @IBOutlet weak var secondPokemonTypeView: PokemonTypeView!
    @IBOutlet weak var detailViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailViewMinifiedContraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonsDescriptionLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    
    var pokemon: Pokemon?
    
    private let presenter = DetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "detailsView"
        
        self.presenter.view = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animatePokemon()
        self.presenter.requestPokemon(withId: pokemon?.id ?? 1)
    }
    
    func animatePokemon() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.alpha = 0.2
        })
    }
    
    func animatePokemonImageToTop() {
        
        DispatchQueue.main.async {
            self.imageView.layer.removeAllAnimations()
            self.pokemonImageViewTopConstraint.priority = UILayoutPriority(rawValue: 999)
            self.pokemonImageViewCenterVerticallyConstraint.priority = UILayoutPriority(rawValue: 900)
            
            self.detailViewTopConstraint.priority = UILayoutPriority(rawValue: 899)
            self.detailViewMinifiedContraint.priority = UILayoutPriority(rawValue: 998)
            
            self.pokemonImageViewWidthConstraint.constant = 100
            self.pokemonImageViewHeightConstraint.constant = 100
            
            UIView.animate(withDuration: 1, animations: {
                self.imageView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    func initialConfig() {
        if let pokemon = self.pokemon {
            
            
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
