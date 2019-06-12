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
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animatePokemon()
        self.requestPokemon()
    }
    
    func animatePokemon() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.alpha = 0.2
        })
    }
    
    func requestPokemon() {
        if let pokemon = self.pokemon {
            
            let requestMaker = RequestMaker()
            requestMaker.make(withEndpoint: .details(query: pokemon.id)) {
                (pokemon: Pokemon) in
                
                self.animatePokemonImageToTop()
            }
        }
    }
    
    func animatePokemonImageToTop() {
        DispatchQueue.main.async {
            
            self.imageView.layer.removeAllAnimations()
            self.pokemonImageViewTopConstraint.priority = UILayoutPriority(rawValue: 999)
            self.pokemonImageViewCenterVerticallyConstraint.priority = UILayoutPriority(rawValue: 900)
            self.pokemonImageViewWidthConstraint.constant = 80
            self.pokemonImageViewHeightConstraint.constant = 80
            
            UIView.animate(withDuration: 1, animations: {
                self.imageView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func initialConfig() {
        if let pokemon = self.pokemon {
            self.gradientView.startColor = pokemon.types.first?.color ?? .black
            self.gradientView.endColor = pokemon.types.first?.color?.lighter() ?? .white
            
            self.imageView.loadImage(from: pokemon.image)
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

