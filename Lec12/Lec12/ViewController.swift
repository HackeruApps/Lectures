import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginOrRegisterSwitch: UISwitch!
    @IBOutlet weak var loginRegButton: UIButton!
    
    
    var isLogin:Bool{
        return loginOrRegisterSwitch.isOn
    }
    
    @IBAction func loginORRegister(_ sender: UISwitch) {
        loginRegButton.setTitle(sender.isOn ? "Login" : "Reigster", for: .normal)
    }
    
    @IBAction func buttontapped(_ sender: UIButton) {
        if !nameTextField.isValid{
            nameTextField.layer.borderColor = UIColor.red.cgColor
            nameTextField.layer.borderWidth = 3
            nameTextField.layer.masksToBounds = true
            nameTextField.layer.cornerRadius = 14
        }
        
        if !nameTextField.isValid || !passwordTextField.isValid{
            return
        }
        
        
        if isLogin{
            login()
        }else{
            register()
        }
    }
    
    func login(){
        let name = nameTextField.text!
        let key = KeychainPasswordItem(service: "Lec12", account: name)
        
        do{
            let keyChainPass = try key.readPassword()
            
            if keyChainPass == passwordTextField.text!{
                performSegue(withIdentifier: "login", sender: nil)
            }
        }catch{
            fatalError("Error: \(error)")
        }
        
        
    }
    
    func register(){
        //Service is the app name
        
        let name = nameTextField.text!
        
        let key = KeychainPasswordItem(service: "Lec12", account: name)
        
        do{
            try key.savePassword(passwordTextField.text!)
        }catch {
            fatalError("Error Saving to Keychain \(error)" )
        }
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    
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

extension UITextField{
    var isValid:Bool{
        return hasText && self.text?.count ?? 0 > 3
    }
}






















