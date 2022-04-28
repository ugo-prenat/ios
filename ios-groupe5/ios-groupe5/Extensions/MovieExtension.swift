//
//  MovieExtension.swift
//  ios-groupe5
//
//  Created by Ugo on 26/04/2022.
//

import Foundation


struct Movie {
    let title: String
    let category: String
    let cover: String
    let url: String
    let trailerUrl: String
    let duration: String
    let description: String
    let releaseDate: String
    let pegi: String
    
}

extension Movie {
    init?(json: [String: String]) {
        guard let title = json["title"],
              let category = json["category"],
              let cover = json["cover"],
              let url = json["url"],
              let trailerUrl = json["trailerUrl"],
              let duration = json["duration"],
              let description = json["description"],
              let releaseDate = json["releaseDate"],
              let pegi = json["pegi"]
        else {
            return nil
        }
        
        self.title = title
        self.category = category
        self.cover = cover
        self.url = url
        self.trailerUrl = trailerUrl
        self.duration = duration
        self.description = description
        self.releaseDate = releaseDate
        self.pegi = pegi
    }
}
