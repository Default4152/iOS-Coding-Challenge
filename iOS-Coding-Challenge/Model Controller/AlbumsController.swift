//
//  AlbumsController.swift
//  iOS-Coding-Challenge
//
//  Created by Conner on 4/11/19.
//  Copyright © 2019 Conner. All rights reserved.
//

import UIKit

class AlbumsController {
    static let baseURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit")!
    var albums: [Album] = []
    var imageCache = NSCache<NSString, AnyObject>()

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

    func getAlbumImage(imageUrlString: String, completion: @escaping (Error?, UIImage?) -> Void) {
        if let image = imageCache.object(forKey: imageUrlString as NSString) as? UIImage {
            completion(nil, image)
            return
        }

        if let url = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(error, nil)
                    return
                }

                guard let data = data else { fatalError("Cannot unwrap data for image") }

                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: imageUrlString as NSString)
                        completion(nil, image)
                    }
                }
            }.resume()
        }
    }
}
