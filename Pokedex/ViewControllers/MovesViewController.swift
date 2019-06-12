//
//  MovesViewController.swift
//  Pokedex
//
//  Created by Leonardo Braga on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit


class MoveListViewController: UIViewController {
    
    @IBOutlet weak var moveTableView: UITableView!

    let requestMaker = RequestMaker()
    
    var moveList = [Move]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        self.fetchData()
        
    }
    
    private func configTable() {
        self.moveTableView.dataSource = self
    }
}

extension MoveListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "move", for: indexPath)
        
        
        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: self.moveList[indexPath.row])
        }
        
        return cell
    }
    
}

// TODO: Criar view model
typealias MoveListViewModel = MoveListViewController

extension MoveListViewModel {
    
    func fetchData() {
        requestMaker.make(withEndpoint: .moves) {
            (moveList: [Move]) in
            
            self.moveList = moveList
            
            DispatchQueue.main.async {
                self.moveTableView.reloadData()
            }
        }
    }
}

