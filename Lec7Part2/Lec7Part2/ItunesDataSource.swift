import Foundation

class ItunesDataSource{
    func getSongs(result: ([ItunesSong])->()){
        
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
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: d, options: [])else{/*!*/ return}
            
            print(jsonObject)
            
            //type: [String: Any]
            
        }
        task.resume()
        
        
        
        
    }
}







