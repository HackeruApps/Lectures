
import Foundation
class Task :CustomStringConvertible{
    
    var description: String{
        return "\(title), \(taskDescription), \(date)"
    }
    
    var title:String
    var taskDescription:String
    var date:Date
    
    init(title:String, description: String, date:Date){
        self.title = title
        self.taskDescription = description
        self.date = date
    }
    
    //Serialization:
    var dict:Dictionary<String, Any>{
        return ["title": title,
                "description": taskDescription,
                "date": date.timeIntervalSince1970]
    }
    //De-Serialization:
    static func fromJson(_ json: Dictionary<String, Any>)->Task{
        let d = json["date"] as! TimeInterval
        let date = Date(timeIntervalSince1970: d)
       
        let title = json["title"] as! String
        let desc = json["description"] as! String
        
        return Task(title: title, description: desc, date: date)
    }
    
    
    
   
}






