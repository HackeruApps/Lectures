import Foundation

//struct
struct Card: CustomStringConvertible{
    //properties:
    let suit:Suit
    let rank:Rank
    
    var description: String{
        return "\(rank) of \(suit)"
    }
}

//Think about the type
struct Deck {
    var cards:[Card]
    init() {
        cards = []
        for r in 1...13{
            for s in 0...3{
                let suit = Suit(rawValue: s)!
                let rank = Rank(rawValue: r)!
                
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
}

func rand(from:Int, to:Int) -> Int{
    let range = UInt32(to - from)
    return Int(arc4random_uniform(range)) + from
}




//structs are passed by value! (Copy)
//classes are passed by reference!!!

//structs dont have inheritance
//classes may inherit

// free init for structs


struct Person {
    var firstName:String
    var lastName:String
//    init(firstName:String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
}

class Person1:Base {
    var firstName:String
    var lastName:String
    
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Base{
    
}










