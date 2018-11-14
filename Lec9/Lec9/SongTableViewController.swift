import SDWebImage
import UIKit

class SongTableViewController: UITableViewController, SongDataSourceDelegate {
    
    var rssResult: RssResult?
    
    func onResult(result: RssResult?, error: Error?) {
        //dispatchQueueMa
        if let error = error{
            //TODO: show Error Dialog
            print(error)
            return
        }
        if let result = result{
            self.rssResult = result
            tableView.reloadData()
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ds = SongDataSource()
        ds.delegate = self
        ds.getSongs()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rssResult?.feed.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songcell", for: indexPath) as! SongTableViewCell

        guard let song = rssResult?.feed.results[indexPath.row] else{
            fatalError("Illegal Condintion.")
        }
        // Configure the cell...
        cell.songTitle.text = song.name
        cell.songArtist.text = song.artistName
        
        //image - cocoapods
        let url = URL(string: song.artworkUrl100)!
        
        cell.artistImage.sd_setImage(with: url,
                                     placeholderImage: UIImage(named:"place")
        )

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
            rssResult?.feed.results.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

  
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        if let s = rssResult?.feed.results.remove(at: fromIndexPath.row){
            
            rssResult?.feed.results.insert(s, at: to.row)
        }
        
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        
        let s = rssResult?.feed.results[indexPath.row]
        
        performSegue(withIdentifier: "masterToDetail", sender: s)
    }

 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailViewController, let song = sender as? Song{
        
            dest.song = song
        }
    }
}






