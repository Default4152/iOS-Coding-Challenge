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
    var albumsController = AlbumsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90.0
        tableView.allowsSelection = false
        
        setupNavigationBar()
        
        albumsController.getAlbums { (error) in
            if let error = error {
                print("Error with getting albums in TableView: \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsController.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AlbumTableViewCell
        
        let album = albumsController.albums[indexPath.row]
        cell.album = album
        cell.albumCoverImage.image = UIImage(named: "placeholder")
        cell.albumRank = indexPath.row + 1
        
        albumsController.getAlbumImage(imageUrlString: album.artworkUrl100, completion: { (error, image) in
            if let error = error {
                print("Error getting album image: \(error)")
                return
            }
            
            guard let image = image else { fatalError("Something went wrong with getting the image in AlbumCell" )}
            cell.albumCoverImage.image = image
        })
        
        return cell
    }
    
    // MARK: - Navigation Bar Setup
    
    private func setupNavigationBar() {
        navigationItem.title = "Apple Top 100 Albums"
        navigationController?.navigationBar.isTranslucent = false
    }

}
