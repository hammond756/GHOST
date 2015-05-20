//
//  Player.swift
//  Ghost
//
//  Created by Aron Hammond on 07/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//
//  Description: Class that represents a player. A player has a score
//  and a name. The socore is incremented after every game won.

import Foundation

class Player: NSObject
{
    init(name: String, score: Int)
    {
        self.name = name
        self.score = score
    }
    
    let name: String
    var score: Int
    
    func incrementScore()
    {
        score++
    }
}