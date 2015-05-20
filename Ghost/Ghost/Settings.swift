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
    static let sharedInstance = Settings()
    
    init()
    {
        convertPlayers()
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
    private func convertPlayers()
    {
        if let playersDict = defaults.dictionaryForKey("Players") as? [String: Int]
        {
            for (name, score) in playersDict
            {
                let tempPlayer = Player(name: name, score: score)
                players.append(tempPlayer)
            }
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
    
    // return a player from the list of players by giving a name as argument
    func searchForPlayer(name: String) -> Player?
    {
        for player in players
        {
            if player.name == name
            {
                return player
            }
        }
        
        return nil
    }
    
    // check if default is set (if not: set to english) and return it
    func getDefaultLanguage() -> String
    {
        if defaults.stringForKey("Default Language") == nil
        {
            defaults.setValue("english", forKey: "Default Language")
        }
        
        return defaults.stringForKey("Default Language")!
    }
    
    // language is string with an uppercase first character
    func setDefaultLanguage(language: String)
    {
        defaults.setValue(language, forKey: "Default Language")
    }
}
