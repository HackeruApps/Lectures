//
//  Oracle.swift
//  Lec4
//
//  Created by hackeru on 28/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation


struct Oracle {
    let specials = [
        "1 + 1": "2",
        "What is your name": "The Oracle!",
        "How do you feel" : "Ham Vemaganiv"
    ]
    func askMe(question: String)->String{
        if let ans = specials[question]{
            return ans
        }
        //random number in swift
        let i = Int(arc4random_uniform(UInt32(3)))
        
        let ans = defaultAnswers(rawValue: i)!.description
        return ans
    }
}
enum defaultAnswers: Int, CustomStringConvertible{
    //yes, no, I_Dont
    case yes, no, i_dont_know
    
    var description: String{
        switch self {
        case .yes:
            return "Yes"
        case .no:
            return "No"
        case .i_dont_know:
            return "I Don't Know"
        }
    }
}
