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
    let duration: String
    let description: String
    let releaseDate: Int
    let pegi: String
//    let type: Array
}

extension Movie {
    init?(json: [String: AnyObject]) {
        guard let title = json["title"] as? String,
              let category = json["category"] as? String,
              let cover = json["cover"] as? String,
              let url = json["url"] as? String,
              let duration = json["duration"] as? String,
              let description = json["description"] as? String,
              let releaseDate = json["releaseDate"] as? Int,
              let pegi = json["pegi"] as? String
//              let type = json["type"] as? Array
        else {
            return nil
        }
        
        self.title = title
        self.category = category
        self.cover = cover
        self.url = url
        self.duration = duration
        self.description = description
        self.releaseDate = releaseDate
        self.pegi = pegi
//        self.type = type
    }
}
