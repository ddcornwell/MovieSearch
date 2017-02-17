//
//  MoiveTableViewCell.swift
//  MovieSearch
//
//  Created by DANIEL CORNWELL on 2/17/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MoiveTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    func upDateViews() {
        
        guard let movie = movie else {return}
        DispatchQueue.main.async {
            self.movieTitleLabel.text = movie.title
            self.movieRatingLabel.text = "\(movie.rating)"
            self.movieSummaryLabel.text = movie.summary
            ImageController.image(forURL: movie.posterURL, completion: { (image) in
                if movie.title == movie.title {
                self.movieImageView.image = image
                }
            })
            }
        }

    
    // MARK: Properties
    
    var movie: Movie? {
        didSet {
          upDateViews()
        }
    }

    
    
}
