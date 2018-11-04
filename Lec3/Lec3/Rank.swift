import Foundation

//raw value
enum Rank: Int, CustomStringConvertible{
    
    //computed property, get only
    var description: String{
        switch self {
        case .Ace:
            return "Ace"
        case .King:
            return "King"
        case .Queen:
            return "Queen"
        case .Jack:
            return "Jack"
        default:
           return String(self.rawValue)
        }
    }
 
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven
    case Eight, Nine, Ten
    case Jack, Queen, King
    
}





