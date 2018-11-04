
import Foundation

struct Question : CustomStringConvertible{
    let question: String // = "1 + 1 = ?"
    let answers: [String]
    let correctAns:String
    let category: Category
    
    var description:String{
        return "question: \(question), answers: \(answers), category: \(category)"
    }
    
    func checkAns(ans:Int)->Bool{
        return answers[ans - 1] == correctAns
    }
}

enum Category:CustomStringConvertible{
    case Sport, Entertainment, Calture, Nature
    
    var description: String{
        switch self {
        case .Sport:
            return "🤾‍♀️"
        case .Entertainment:
            return "🎦"
        case .Calture:
            return "👨🏻‍🎨"
        case .Nature:
            return "🐅"
        }
    }
}



















