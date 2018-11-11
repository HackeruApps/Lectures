import UIKit

class ViewController: UIViewController, MovieDataSourceDelegate {
    func moviesArrived(rss: RssResult) {
        print(rss)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ds = MovieDataSource()
        ds.delegate = self
        ds.getMovies()
    }
}







