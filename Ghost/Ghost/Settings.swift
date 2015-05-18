//
//  Settings.swift
//  Ghost
//
//  Created by Aron Hammond on 09/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class Settings
{
    class var sharedInstance: Settings
    {
        struct Static
        {
            static var instance: Settings?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)
        {
            Static.instance = Settings()
        }
        
        return Static.instance!
    }
    
    init()
    {
        if let playersDict = defaults.dictionaryForKey("Players") as? [String: Int]
        {
            convertPlayers(playersDict)
        }
    }
    
    var players = [Player]()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    // add player to the list of Player and the dictionary
    func addPlayer(name: String)
    {
        let newPlayer = Player(name: name, score: 0)
        players.append(newPlayer)
        
        savePlayers()
    }
    
    // converts a dictionary to an array of player instances
    private func convertPlayers(playersDict: [String: Int])
    {
        for (name, score) in playersDict
        {
            let tempPlayer = Player(name: name, score: score)
            players.append(tempPlayer)
        }
    }
    
    // converts player array to a dictionary and stores it in NSUserDefaults
    func savePlayers()
    {
        var tempDict = [String: Int]()
        
        for player in players
        {
            tempDict[player.name] = player.score
        }
        
        defaults.setObject(tempDict, forKey: "Players")
    }
    
    // language is string with an uppercase first character
    func setDefaultLanguage(language: String)
    {
        defaults.setValue(language, forKey: "Default Language")
    }
}
