//
//  Game.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class Game 
{
    // singleton pattern that allows the game instance to be shared between all controllers
    // source: https://github.com/hpique/SwiftSingleton
    static let sharedInstance = Game()
    
    var settings = Settings.sharedInstance
    var dictionary = DictionaryClass()
    var currentWord = ""
    
    var players = [Player?](count: 2, repeatedValue: nil)
    
    init()
    {
        restoreState()
    }
    
    // method that ads the guessed letter to the current word and checks  the dictionary
    func guess (letter: String)
    {
        // validate input, add letter tho the current wordfragment and update dictionary
        if count(letter) == 1
        {
            currentWord = currentWord + letter
            dictionary.filter(currentWord.lowercaseString)
        }
    }
    
    // returns 0 for player 1 and 1 for player two
    func currentPlayerIndex() -> Int
    {
        return count(currentWord) % 2
    }
    
    // returns the player that did not end the game
    func winner() -> Player
    {
        return players[currentPlayerIndex()]!
    }
    
    // checks on all conditions on which Ghost must end
    func ended() -> Bool
    {
        let minlength = 4
        
        let subStringNotInDict = dictionary.subSet.count == 0
        let completedWord = contains(dictionary.dict, currentWord.lowercaseString) && count(currentWord) >= minlength
        
        return subStringNotInDict || completedWord
    }
    
    // reset game specific variables
    func reset(clearDict: Bool = false, clearPlayers: Bool = false)
    {
        if clearDict
        {
            dictionary.reset()
            currentWord = ""
        }
        if clearPlayers
        {
            players = [Player?](count: 2, repeatedValue: nil)
        }
    }
    
    // convert game specific data to a dictionary and write it to user defaults
    func saveState()
    {
        var gameModelData = [String: AnyObject]()
        let tempPlayers = convertPlayers(players)
        var defaults = NSUserDefaults.standardUserDefaults()
        gameModelData["Players"] = tempPlayers
        gameModelData["Current Word"] = currentWord
        gameModelData["Dictionary Subset"] = dictionary.subSet
        
        defaults.setObject(gameModelData, forKey: "Game Model Data")
    }
    
    // reads game specific data from user defaults and stores them in the corresponding properties
    func restoreState()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let let gameModelData = defaults.objectForKey("Game Model Data") as? [String: AnyObject]
        {
            let restoredPlayers = gameModelData["Players"] as! [String]
            for (i,player) in enumerate(restoredPlayers)
            {
                players[i] = settings.searchForPlayer(player)
            }
            
            currentWord = gameModelData["Current Word"] as! String
            dictionary.subSet = gameModelData["Dictionary Subset"] as! [String]
        }
    }
    
    // only save player names, Player object cannot be stored in NSUserDefaults
    private func convertPlayers(players: [Player?]) -> [String]
    {
        var tempPlayers = [String]()
        for player in players
        {
            if let tempPlayer = player
            {
                tempPlayers.append(tempPlayer.name)
            }
        }
        
        return tempPlayers
    }
}