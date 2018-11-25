import UIKit

class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()

         
        let c = Contact(firstName: "Moses", lastName: "Doe")
        //usage of NSCoding
        let cData = NSKeyedArchiver.archivedData(withRootObject: c)
        //NSKeyedArchiver.archivedData(withRootObject: cData, requiringSecureCoding: true)
        UserDefaults.standard.set(cData, forKey: "data")
        
        let readData = UserDefaults.standard.data(forKey: "data")
        //swift 4.2
        //let contactFromData = try! NSKeyedUnarchiver.unarchivedData(ofClass: Contact.self, from: readData!)

        let ob = NSKeyedUnarchiver.unarchiveObject(with: readData!)
        
        print(ob)
        
        
        
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        
        let volume = UserDefaults.standard.integer(forKey: "volume")
        
        print(name, volume)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    
}





