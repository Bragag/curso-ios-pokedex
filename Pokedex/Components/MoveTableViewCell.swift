//
//  MoveTableViewCell.swift
//  Pokedex
//
//  Created by Leonardo Braga on 10/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    
    func config(with model: Move) {
        DispatchQueue.main.async {
            self.nameLabel.text = model.description
            self.typeImageView.image = model.type.icon
            self.typeImageView.backgroundColor = model.type.color
        }
    }
    
}
