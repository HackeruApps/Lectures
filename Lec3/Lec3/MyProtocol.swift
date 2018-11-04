import Foundation

protocol MyProtocol {
    //requirements:
    //var description:String {get set}
    var description:String {get}
    
   func getString()->String
}

class Student : MyProtocol{
    //toString
    func getString() -> String {
        return "Student: \(name)"
    }
    
    //stored property
    var name:String
    
    //computed property (get)
    var description: String{
        return "Student: \(name)"
    }
    
    init(name:String){
        self.name = name
    }
}



// let st = Student(name: "Moshe") //st.description



















