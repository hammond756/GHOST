//
//  Player.swift
//  Ghost
//
//  Created by Aron Hammond on 07/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    init(name: String)
    {
        self.name = name
        score = 0
    }
    
    let name: String
    var score: Int
}