//
//  Highscores.swift
//  Ghost
//
//  Created by Aron Hammond on 11/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//
//  Descriptions: Class

import Foundation

class HighscoreList
{
    var settings = Settings.sharedInstance
    
    // return list of players sorted by score
    func generate() -> [Player]
    {
        var playersCopy = settings.players
        playersCopy.sort({$0.score > $1.score})
        
        return playersCopy
    }
        
}