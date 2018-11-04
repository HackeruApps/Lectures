//
//  ViewController.swift
//  Lec2Part2
//
//  Created by hackeru on 21/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var names = ["Guy", "Alex", "Hofit", "Asher", "Bar", "Amit", "Matan"]
        
//1) count how many characters?
        var sum = 0
        for name in names{
            sum += name.count
        }
        print(sum)
        
        //יש לשרשר את כל השמות למחרוזת אחת ארוכה ולהדפיס אותה 2
        
        var concat = ""
        for name in names{
            //concat += name
            concat.append(name)
        }
        print(concat)
                //לערבב את רשימת השמות

        //  יש למיין את המערך
        print(names.sorted())
        //יש ליצור מילון שכל איבר בו הוא שם של תלמיד וכל ערך הוא מס האותיות
        
        var dict = [String: Int]()
        for name in names{
            dict[name] = name.count
        }
        
        print(dict)
        
        
        
        //1) ליצור חפיסת קלפים
        // להגריל קלף רנדומלי
        // לערבב את החפיסה
        // יש לסכום את ערכי כל הקלפים בחפיסה
        //יש ליצור מילון שבו כל מפתח הוא שם הקלף וכל ערך הוא ערך מספרי
    }
}











