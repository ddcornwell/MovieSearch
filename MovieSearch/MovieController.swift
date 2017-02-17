//
//  MovieController.swift
//  MovieSearch
//
//  Created by DANIEL CORNWELL on 2/17/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import Foundation


class MovieController {
    
    static let baseurl = URL(string: "https://api.themoviedb.org/3/search/movie")
    
    static func fetch(searchTerm: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = baseurl else { completion([]); return}
        
        let urlParameters = ["api_key" : "72e8b0ce1d931602745c63fadabf8296" , "query" : searchTerm]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            if error != nil {
                print(" there was an error little buddy: \(error?.localizedDescription)")
                completion([])
                return
            }
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8)
                else { completion([])
                    return
            }
            guard let topDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                print("what no serialize JSON : \(responseDataString)")
                completion([])
                return
            }
            
            guard let movieArray = topDictionary["results"] as? [[String:Any]] else {
                print("not here")
                completion([])
                return
            }
            
            let movies = movieArray.flatMap({Movie(dictionary: $0)})
            completion(movies)
        }
    }
}
