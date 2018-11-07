import Foundation
//struct Feed
struct ItunesSong:Codable {
    let artistName:String
    let releaseDate:String
    let name:String
    let collectionName:String
    let artistUrl: String
    let artworkUrl100:String
    let url:String
}

struct Feed:Codable {
    let title:String
    let updated:String
    let results:[ItunesSong]
}

struct RssResult:Codable {
    let feed:Feed
}














