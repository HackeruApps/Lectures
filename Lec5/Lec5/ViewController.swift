//
//  ViewController.swift
//  Lec5
//
//  Created by hackeru on 31/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cards: [UIButton]!
    
    
    func rand(max:Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }
    
    func initGame(){
        //new set()
        var set = Set<UIImage>()
        //while(set.count < 3){ set.append(randImage)}
        while set.count < 3 {
            let img = images[rand(max: images.count)]!
            set.insert(img)
        }
        
        var arr = Array(set) + Array(set)
        
        arr =  shuffle(arr: arr)
        for (i, card) in cards.enumerated(){
            card.setImage(arr[i], for: .highlighted)
        }
        
       
    }
    
    
    
    
    /*
    func sayHello(user: inout String){
        print("Hello, \(user)")
        user = "...nick nack"
    }
    */
    
    
    
    
    func shuffle(arr:[UIImage])->[UIImage]{
        //mutable copy
        var copy = arr
        
        var shuffled = [UIImage]()
        
        while copy.count > 0 {
            let oneImage = copy.remove(at: rand(max: copy.count))
            
            shuffled.append(oneImage)
        }
        return shuffled
    }
    
    
   
    var previous:UIImage?
    @IBAction func flip(_ sender: UIButton) {
        let imageOnCard = sender.image(for: .highlighted)!
        
        //make the imageOnCard be the defualt(normal) image
        //sender.setImage(imageOnCard, for: .normal)
        
        //2nd time
        if let previous = previous{
            self.previous = nil
            print("2nd")
            if(previous == imageOnCard){
                print("Hoora")
            }
        
        }else{
             print("1st")
            //1st tap
            sender.setImage(imageOnCard, for: .normal)
            previous = sender.currentImage
        }
       
    }
    
    
    
    let images = [
        UIImage(named: "banana"),
        UIImage(named: "cherry"),
        UIImage(named: "plums"),
        UIImage(named: "pineapple"),
        UIImage(named: "strawberry"),
        UIImage(named: "pear")
    ]


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

