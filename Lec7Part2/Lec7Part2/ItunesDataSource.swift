import UIKit

class ItunesDataSource{
    func getSongs(result:@escaping ([ItunesSong])->()){
        
        var songs = [ItunesSong]()
        
        let address = "https://rss.itunes.apple.com/api/v1/il/apple-music/hot-tracks/all/25/explicit.json"
        
        let url = URL(string:address)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, err) in
            //code that runs when the task is complete
            
            if let err = err{
                print(err)
                //TODO: Handle Errors
                return
            }
            
            //positive
            guard let d = data else{
                return
            }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: d, options: []) as? Json else{/*!*/ return}
            
           // print(jsonObject)
            
            let f = jsonObject!["feed"] as! Json
            let results = f["results"] as! [Json]
            
            for jSong in results{
                let aName = jSong["artistName"] as! String
                let name = jSong["name"] as! String
                let releaseDate = jSong["releaseDate"] as! String
                let cName = jSong["collectionName"] as! String

                let artistUrl = jSong["artistUrl"] as! String
                let artworkUrl100 = jSong["artworkUrl100"] as! String
                let url = jSong["url"] as! String
                
                
                //add to songs
                songs.append(
                    ItunesSong(artistName: aName, releaseDate: releaseDate, name: name, collectionName: cName, artistUrl: artistUrl, artworkUrl100: artworkUrl100, url: url)
                )
            }
            //return songs to our callback:
            //dispatch the result on the main thread.
            
            DispatchQueue.main.async {
                result(songs)
            }
            
        }
        task.resume()
    }
}

typealias Json = [String: Any]

//typealias UDecice = UICollectionViewCellDragState


















