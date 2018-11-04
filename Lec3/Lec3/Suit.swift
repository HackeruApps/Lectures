import Foundation

enum Suit:Int, CustomStringConvertible{

    case Spades, Clubs, Diamonds, Hearts
    var description: String{
        switch self {
        case .Clubs:
            return "♣️"
        case .Diamonds:
            return "♦️"
        case .Hearts:
            return "♥️"
        case .Spades:
            return "♠️"
        }
    }
}

