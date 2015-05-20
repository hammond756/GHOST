//
//  Highscores.swift
//  Ghost
//
//  Created by Aron Hammond on 11/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class Highscores
{
    var settings = Settings.sharedInstance
    
    func getHighScoreList() -> [Player]
    {
        var playersCopy = settings.players
        playersCopy.sort({$0.score > $1.score})
        return playersCopy
    }
        
}