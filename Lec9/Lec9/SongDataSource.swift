import UIKit

class SongDataSource {
    let address = URL(string: "https://rss.itunes.apple.com/api/v1/il/apple-music/hot-tracks/all/50/explicit.json")!
    
    weak var delegate: SongDataSourceDelegate?

    let session = URLSession(configuration: .default)
    
    func getSongs(){
        session.dataTask(with: address) { (data, res, err) in
            
            let rssResult = try? JSONDecoder().decode(RssResult.self, from: data ?? Data())
            DispatchQueue.main.async {
                self.delegate?.onResult(result: rssResult, error: err)
            }
            
        }.resume()
    }
}


protocol SongDataSourceDelegate: class {
    func onResult(result:RssResult?, error:Error?)
}

struct Song:Codable {
    let name:String
    let artworkUrl100:String
    let artistName:String
}

struct Feed:Codable {
    var results:[Song]
}

struct RssResult:Codable {
    var feed:Feed
}









