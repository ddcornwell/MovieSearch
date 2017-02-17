//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by DANIEL CORNWELL on 2/17/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchTerm = searchBar.text?.lowercased(), !searchTerm.isEmpty
            else {
                print("no text in searchBar.")
                return
        }
        
        MovieController.fetch(searchTerm: searchTerm) { (movie) in
            self.movies = movie
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchBar.resignFirstResponder()
            }
        }
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MoiveTableViewCell else {return UITableViewCell()}
        let movie = movies[indexPath.row]
        cell.movie = movie
        
        return cell
    }
}


