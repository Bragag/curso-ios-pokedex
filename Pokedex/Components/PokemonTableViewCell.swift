//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Leonardo Braga on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var primaryTypeImageView: UIImageView!
    @IBOutlet weak var secondaryTypeImageView: UIImageView!
    
    
    func config(with model: Pokemon) {
        pictureImageView.loadImage(from: model.image)
        
        nameLabel.text = model.capitalizedName
        idLabel.text = model.displayId
        primaryTypeImageView.image = model.types.first?.icon
        primaryTypeImageView.backgroundColor = model.types.first?.color
        
        if model.types.count > 1 {
            secondaryTypeImageView.isHidden = false
            secondaryTypeImageView.image = model.types[1].icon
            secondaryTypeImageView.backgroundColor = model.types[1].color
        } else {
            secondaryTypeImageView.isHidden = true
            secondaryTypeImageView.backgroundColor = .clear
        }
        
    }
    

}
