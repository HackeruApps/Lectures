//
//  MoviesTableViewController.swift
//  Lec8
//
//  Created by hackeru on 11/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesTableViewController: UITableViewController, MovieDataSourceDelegate {
    
    var movies: [Movie]?
    //delegate
    func moviesArrived(rss: RssResult) {
        self.movies = rss.feed.results
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ds = MovieDataSource()
        ds.delegate = self
        ds.getMovies()
   
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell

        // Configure the cell...
        if let movie = movies?[indexPath.row]{
            cell.artist.text = movie.artistName
            cell.movieTitle.text = movie.name

           
            //cell.poster ~> movie.artworkUrl100
//            let url = URL(string: movie.artworkUrl100)!
//
//            let session = URLSession(configuration: .default)
//            session.dataTask(with: url, completionHandler: { (data, res, err) in
//                if let data = data{
//                    DispatchQueue.main.async {
//                        let image = UIImage(data: data)
//                        cell.poster.image = image
//
//                    }
//                }
//            }).resume()
        }

        return cell
    }
    

  
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            movies?.remove(at: indexPath.row)
            //HTTPS REQUEST ITUNES TO DELETE THE ITEM
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let m = movies?[indexPath.row]{
            performSegue(withIdentifier: "masterToDetail", sender: m)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let s = sender as! Movie
        
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
