import UIKit

class ItunesEasy{
    func getSongs(result:@escaping (RssResult)->()){
        let address = "https://rss.itunes.apple.com/api/v1/il/apple-music/hot-tracks/all/25/explicit.json"
        let url = URL(string:address)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            if let err = err{
                print(err)
                //TODO: Handle Errors
                return
            }
            guard let d = data else{
                return
            }
            let rss = try! JSONDecoder().decode(RssResult.self, from: d)
            DispatchQueue.main.async {
                result(rss)
            }
        }
        task.resume()
    }
}









