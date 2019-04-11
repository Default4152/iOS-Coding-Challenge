//
//  AlbumTableViewCell.swift
//  iOS-Coding-Challenge
//
//  Created by Conner on 4/11/19.
//  Copyright © 2019 Conner. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var album: Album? {
        didSet {
            albumNameLabel.text = album?.name
            artistNameLabel.text = album?.artistName
            genreLabel.text = album?.genres[0].name
        }
    }
    
    var albumRank: Int? {
        didSet {
            if let albumRank = albumRank {
                albumRankLabel.text = String(albumRank)
            }
        }
    }
    
    private let cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let albumRankLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let albumNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.lightGray
        lbl.font = UIFont.italicSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let genreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        lbl.textAlignment = .left
        return lbl
    }()
    
    let albumCoverImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        
        addSubview(cellView)
        
        cellView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: safeAreaLayoutGuide.leftAnchor, paddingLeft: 0, right: safeAreaLayoutGuide.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        cellView.addSubview(albumRankLabel)
        cellView.addSubview(albumCoverImage)
        cellView.addSubview(albumNameLabel)
        cellView.addSubview(artistNameLabel)
        cellView.addSubview(genreLabel)
        
        albumRankLabel.anchor(top: cellView.topAnchor, paddingTop: 0, bottom: cellView.bottomAnchor, paddingBottom: 0, left: cellView.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 55, height: 90)
        albumCoverImage.anchor(top: cellView.topAnchor, paddingTop: 0, bottom: cellView.bottomAnchor, paddingBottom: 0, left: albumRankLabel.rightAnchor, paddingLeft: 10, right: nil, paddingRight: 0, width: 90, height: 90)
        artistNameLabel.anchor(top: cellView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: albumCoverImage.rightAnchor, paddingLeft: 20, right: cellView.rightAnchor, paddingRight: 20, width: 0, height: 25)
        albumNameLabel.anchor(top: artistNameLabel.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: albumCoverImage.rightAnchor, paddingLeft: 20, right: cellView.rightAnchor, paddingRight: 20, width: 0, height: 20)
        genreLabel.anchor(top: albumNameLabel.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: albumCoverImage.rightAnchor, paddingLeft: 20, right: cellView.rightAnchor, paddingRight: 20, width: 0, height: 20)
    }
    
}
