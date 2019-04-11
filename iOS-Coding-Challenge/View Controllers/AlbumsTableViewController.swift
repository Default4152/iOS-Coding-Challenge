//
//  AlbumsTableViewController.swift
//  iOS-Coding-Challenge
//
//  Created by Conner on 4/11/19.
//  Copyright © 2019 Conner. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let reuseIdentifier = "AlbumCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90.0
        tableView.allowsSelection = false
        
        setupNavigationBar()
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AlbumTableViewCell

        return cell
    }
    
    // MARK: - Navigation Bar Setup
    
    private func setupNavigationBar() {
        navigationItem.title = "Apple Top 100 Albums"
        navigationController?.navigationBar.isTranslucent = false
    }

}
