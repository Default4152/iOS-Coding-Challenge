//
//  AlbumsController.swift
//  iOS-Coding-Challenge
//
//  Created by Conner on 4/11/19.
//  Copyright © 2019 Conner. All rights reserved.
//

import Foundation

class AlbumsController {
    static let baseURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit")!
    var albums: [Album] = []

    func getAlbums(completion: @escaping (Error?) -> Void) {
        let url = AlbumsController.baseURL.appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error returned from server: \(error)")
                completion(error)
                return
            }

            guard let data = data else { fatalError("Data cannot be unwrapped for album") }

            do {
                let decoded = try JSONDecoder().decode(TopAlbums.self, from: data)
                self.albums = decoded.feed.results
                completion(nil)
            } catch let error {
                print("Error decoding albums: \(error)")
            }
        }.resume()
    }
}
