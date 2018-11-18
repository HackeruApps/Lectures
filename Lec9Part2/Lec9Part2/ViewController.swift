 
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chrome: UIView!
    
    @IBOutlet var dialogView: UIView!
    
    
    @IBAction func showDialog(_ sender: UIButton) {
        
        let w = self.view.frame.size.width / 2
        let h = self.view.frame.size.height / 2
        
        dialogView.frame.size = CGSize(width: w, height: h)
        
        dialogView.center = self.view.center
        
        
        dialogView.layer.cornerRadius = 8
        dialogView.layer.masksToBounds = true
        
        //dialogView.removeFromSuperview()
        
        self.view.addSubview(dialogView)
    }
    
    
    @IBAction func showSheet(_ sender: UIButton) {
        let sheet = UIAlertController(title: "Share", message: "Message", preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cool", style: .default, handler: { (a) in
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Good", style: .default, handler: { (a) in
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Meh...", style: .destructive, handler: { (a) in
        }))
        
        present(sheet, animated: true)
    }
    
    //very simillar to adding actions from IB
    @objc func textChanged(sender: UITextField){
        a?.isEnabled = sender.text?.count ?? 0 > 3
    }
 
    
    @IBAction func showLogin(_ sender: UIButton) {
        let alert = UIAlertController(title: "Login", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            //configuration block
            textField.placeholder = "User Name"
            
            
            let image = UIImage(named: "user")
            let imageView = UIImageView(image: image)
            
            textField.rightViewMode = .always
            textField.rightView = imageView
            
            
            textField.addTarget(self, action: #selector(self.textChanged(sender:)), for: .editingChanged)
     
        }
        
        alert.addTextField { (textField) in
            //configuration block
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        //add 2 actions login, cancel
        
        a = UIAlertAction(title: "Login", style: .default, handler: { (action) in
            print("login")
        })
        a?.isEnabled = false
        alert.addAction(a!)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("cancel")
        }))
        //present it
        present(alert, animated: true)
    }
    var a:UIAlertAction?
    
    @IBAction func showAlert(_ sender: UIButton) {
        //init a ViewController
        let alertVC = UIAlertController(title: "Fire Missiles", message: "Are u Sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        alertVC.addAction(UIAlertAction(title: "Sure", style: .default, handler: { (action) in
            print("Fired 2 just 4 u")
        }))
        
        alertVC.addAction(UIAlertAction(title: "NoNo", style: .destructive, handler: { (action) in
            print("Fired 2 anyhow...")
        }))
        //present view controller
        present(alertVC, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

