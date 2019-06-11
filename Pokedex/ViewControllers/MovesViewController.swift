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
        self.moveTableView.delegate = self
        self.moveTableView.dataSource = self
    }
}

extension MoveListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Move Table View Cell", for: indexPath)
        
        
        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: self.moveList[indexPath.row])
        }
        
        return cell
    }
    
}

extension MoveListViewController: UITableViewDelegate {
    
}

// TODO: Criar view model
typealias MoveListViewModel = MoveListViewController

extension MoveListViewModel {
    
    func fetchData() {
        requestMaker.make(withEndpoint: .moves) {
            (moveList: MoveList) in
            
            self.moveList = moveList.moves
            
            DispatchQueue.main.async {
                self.moveTableView.reloadData()
            }
        }
    }
}

