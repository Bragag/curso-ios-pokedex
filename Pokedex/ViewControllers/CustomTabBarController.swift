//
//  CustomTabBarController.swift
//  Pokedex
//
//  Created by Leonardo Braga on 12/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
class CustomTabBarController: UITabBarController {
    @IBOutlet var customTabBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customTabBarView.frame.size.width = self.view.frame.width
        self.view.addSubview(customTabBarView)
    }
    @IBAction func changeTab(sender: UIButton) {
        self.selectedIndex = sender.tag
    }
}
