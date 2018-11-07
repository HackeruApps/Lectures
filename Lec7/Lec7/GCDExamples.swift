//
//  GCDExamples.swift
//  Lec7
//
//  Created by hackeru on 07/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation

class GCDDemos {
    
    func goWeather(callback: @escaping (String)->()){
        
        let global = DispatchQueue.global()
        global.async {
            //fake work...
            let w = "temp: 25"
 
            //report back on the ui thread
            //call back
            DispatchQueue.main.async {
                callback(w)
            }
        }
    }
    
    
    
    
    //get code from outside and Run it:
    func runThisCode(code: ()->()){
        //code is a function.
        //we may use it:
        code()
    }
    

    
    
    
    
    
    
    //
    func sayHi(code:()->() , name:String){
        
    }
    
    func runOnUIThread(){
        //run this code back on the ui thread!
        DispatchQueue.main.async {
            //label.text = ""
        }
    }
    
    func otherQueues(){
        //
        let important = DispatchQueue.global(qos: .userInteractive)
        
        let def = DispatchQueue.global()

        let userInitiated = DispatchQueue.global(qos: .userInitiated)
        
       print(userInitiated == def)
        
    }
    
}
















