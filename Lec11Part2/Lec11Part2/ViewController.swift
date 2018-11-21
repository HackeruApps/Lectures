import UIKit

class ViewController: UIViewController {
 
    var tasks = [Task]()
    
    @IBOutlet var dialogView: UIView!
    @IBAction func plus(_ sender: UIBarButtonItem) {
        //add dialogView as a Sub View
        self.dialogView.center = self.view.center
        self.view.addSubview(dialogView)
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func addTodo(_ sender: UIButton) {
        let title = titleTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let date = datePicker.date
        //ref to defaults.
        let defaults = UserDefaults.standard
        

        let task = Task(title: title,
                        description: description,
                        date: date)
        
        tasks.append(task)//[task] ... [json]
        var jsonArray = [Dictionary<String, Any>]()
        for t in tasks{
            jsonArray.append(t.dict)
        }

        //save!
        defaults.set(jsonArray, forKey: "jsonArray")

        dialogView.removeFromSuperview()
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        guard let arr = defaults.array(forKey: "jsonArray") as? [Dictionary<String, Any>] else{
            return
        }
        
        for item in arr{
           let task = Task.fromJson(item)
           tasks.append(task)
        }
        print(tasks)
        
        
        
        
        
        
        
        
        
        
        
    }
}

