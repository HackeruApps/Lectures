//
//  Todo.swift
//  Lec14Fire
//
//  Created by hackeru on 02/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

struct Todo: CustomStringConvertible, Codable{
    var title:String
    var todoDescription:String
    
    var description: String{
        return "\(title), \(todoDescription)"
    }
    
    //json Computed property
    var json:Dictionary<String, Any>{
        return [
            "title" : title,
            "todoDescription" : todoDescription
        ]
    }
    
    //Codable, Swift 4
    var jsonEasy:String{
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self)
        
        return String(data: data, encoding: .utf16)!
    }
}







