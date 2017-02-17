//
//  Moive.swift
//  MovieSearch
//
//  Created by DANIEL CORNWELL on 2/17/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    private let titleKey = "original_title"
    private let ratingKey = "vote_average"
    private let summaryKey = "overview"
    private let posterEndpointKey = "poster_path"
    
    let title: String
    let rating: Double
    let summary: String
    let imageEndpoint: String
    var posterURL: String {
        return "http://image.tmdb.org/t/p/w500/\(imageEndpoint)"
    }
    
    init?(dictionary: [String: Any]) {
        guard let title = dictionary[titleKey] as? String,
            let rating = dictionary[ratingKey] as? Double,
            let summary = dictionary[summaryKey] as? String,
            let poster = dictionary[posterEndpointKey] as? String else {return nil}
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.imageEndpoint = poster
    }
}
