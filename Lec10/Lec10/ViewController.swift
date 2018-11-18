 
import UIKit

class ViewController: UIViewController {
    
    @IBAction func hide(_ sender: UITapGestureRecognizer) {
        dismiss(UIButton())
    }
    @IBAction func dismiss(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.dialogView.transform =
                CGAffineTransform(scaleX: 4, y: 1.5)
                    .translatedBy(x: 0, y: -500)
        }) { (done) in
            self.blur.isHidden = true
            self.dialogView.transform = CGAffineTransform.identity
            self.dialogView.removeFromSuperview()
        }
    }
    
    
    @IBOutlet weak var blur: UIVisualEffectView!
    
    @IBAction func transform(_ sender: UIButton) {
        //initial conditions
        //width:
        dialogView.frame.size.width = self.view.frame.size.width / 2
        
        //center point
        dialogView.center = self.view.center
        
        //transform
        self.dialogView.transform =
            CGAffineTransform(scaleX: 4, y: 1.5)
                              .translatedBy(x: 0, y: -500)
        
        view.addSubview(dialogView)
        //final conditions
        UIView.animate(withDuration: 0.4) {
            //cancel a transofrm?
            self.dialogView.transform = CGAffineTransform.identity
            self.blur.isHidden = false
        }
    }
    @IBOutlet var dialogView: UIView!
    
    
    @IBAction func tapped(_ sender: UIButton) {
        //start wide
       self.dialogView.frame.size.width = self.view.frame.width
       self.dialogView.frame.size.height = self.view.frame.height / 3
        //center x
        self.dialogView.center.x = self.view.center.x
        //topMost
        self.dialogView.center.y = 0
       self.view.addSubview(self.dialogView)
        //animate:
        UIView.animate(withDuration: 0.4) {
            //center dialogView?
             self.dialogView.frame.size.width = self.view.frame.width / 2
            self.dialogView.center = self.view.center
        }
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

