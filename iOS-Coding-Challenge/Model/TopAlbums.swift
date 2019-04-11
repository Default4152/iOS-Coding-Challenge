//
//  AlbumModel.swift
//  iOS-Coding-Challenge
//
//  Created by Conner on 4/11/19.
//  Copyright © 2019 Conner. All rights reserved.
//

import Foundation

struct TopAlbums: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Album]
}

struct Album: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind
        case artworkUrl100, genres, url
    }
}

struct Genre: Codable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case album = "album"
}
