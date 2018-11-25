//class: NSObject
import Foundation

//Object->Data (Serialization)
class Contact: NSObject, NSSecureCoding{
    
    override var description: String{
        return "\(firstName) - \(lastName)"
    }
    //computed static property
    static var supportsSecureCoding: Bool{
        return true
    }
    //Parcelable + plugin for ij
    //Serialization: to Data
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
    }
    //Deserialiazation:
    required init?(coder aDecoder: NSCoder) {
        firstName =
            aDecoder.decodeObject(forKey: "firstName") as! String
        lastName =
            aDecoder.decodeObject(forKey: "lastName") as! String
    }
    var firstName:String
    var lastName:String
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}
