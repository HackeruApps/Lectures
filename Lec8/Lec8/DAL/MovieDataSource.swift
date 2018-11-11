
import UIKit

//TODO: info.plist

//TODO:
class MovieDataSource {

    weak var delegate: MovieDataSourceDelegate?
    
    func getMovies(){
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/il/movies/top-movies/all/100/explicit.json")!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, res, error) in
            
        let rssResult = try! JSONDecoder().decode(RssResult.self, from: data!)

        //callback on the UI Thread.
        DispatchQueue.main.async {
                self.delegate?.moviesArrived(rss: rssResult)
        }
            
        }.resume()
    }
}

//List of abstract Methods/Requirements
//only classes may conform to this protocols
protocol MovieDataSourceDelegate: class {
    func moviesArrived(rss:RssResult)
}
//TODO: MoviesTableViewController

//TODO: MovieTableViewCell


struct RssResult:Codable {
    let feed:Feed
}

struct Feed:Codable {
    let results:[Movie]
}

struct Movie:Codable {
    let artistName:String
    let releaseDate:String
    let name:String
    let artworkUrl100:String
    let url:String
}















