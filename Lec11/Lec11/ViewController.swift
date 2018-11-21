//
//  ViewController.swift
//  Lec11
//
//  Created by hackeru on 21/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var cowPlayer:AVAudioPlayer!
    var dogPlayer:AVAudioPlayer!
    
    func initPlayers() {
        let cowUrl = Bundle.main.url(forResource: "cow", withExtension: "wav")!
        
        let dogUrl = Bundle.main.url(forResource: "dog", withExtension: "wav")!
        do{
            cowPlayer = try AVAudioPlayer(contentsOf: cowUrl)
            dogPlayer = try AVAudioPlayer(contentsOf: dogUrl)
        }catch let e{
            print(e)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        initPlayers()
    }
    
    
    @IBAction func cowTapped(_ sender: UITapGestureRecognizer) {
        print("Cow")
        cowPlayer?.play()
        //NotificationCenter
    }
    
    @IBAction func dogTapped(_ sender: UITapGestureRecognizer) {
        print("Dog")
        dogPlayer?.play()
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

