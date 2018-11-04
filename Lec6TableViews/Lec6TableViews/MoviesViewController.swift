//
//  ViewController.swift
//  Lec6TableViews
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    lazy var movies:[Movie] = {
        return MovieDataSource().getMovies()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MoviesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //index path is all about( row and section)
        let row = indexPath.row
        let movie = movies[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        //cell.textLabel?.text = movie.title
        cell.movieTitle.text = movie.title
        //cell.detailTextLabel?.text = movie.director
        cell.director.text = movie.director
        //cell.imageView?.image = movie.image
        cell.poster.image = movie.image
        
        return cell
    }
    
    
}
















