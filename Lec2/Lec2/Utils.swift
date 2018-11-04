//
//  Utils.swift
//  Lec2
//
//  Created by hackeru on 21/10/2018.
//

import Foundation


func rand(max: Int)->Int{
    let r = arc4random_uniform(UInt32(max))
    return Int(r)
}

func rand(maxInclusive: Int)->Int{
    let r = arc4random_uniform(UInt32(maxInclusive))
    return Int(r) + 1
    //return Int(arc4random_uniform(UInt32(max)))
}


func rand(from: Int, to: Int) -> Int {
    let r = rand(max: to - from)
    return from + r
}

