
import UIKit

//TODO: info.plist

//TODO:
class MovieDataSource {
    func getMovies(){
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/il/movies/top-movies/all/100/explicit.json")!
        
        //session is like a browser -> GET
        //session also caches our requests
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, res, error) in
            
           let rssResult = try! JSONDecoder().decode(RssResult.self, from: data!)
           //
           print(rssResult)
        }.resume()
        
    }
}
//TODO: UITableViewController

//TODO: UITableViewCell

//TODO: struct Movie
//TODO: struct Feed
//TODO: struct RSSResult


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















