
import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        label.text = "\(slider.value)"
        
        
//        if let font = label.font{
//            let newFont = font.withSize(CGFloat(slider.value))
//            
//            label.font = newFont
//        }
        
        label.font = label.font.withSize(CGFloat(slider.value))
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

