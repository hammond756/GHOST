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
    // source: http://anthon.io/how-to-share-data-between-view-controllers-in-swift/
    // updated implementation: https://github.com/hpique/SwiftSingleton
    static let sharedInstance = Game()
    
    var dictionary = DictioraryTest()
    var settings = Settings.sharedInstance
    
    var currentWord = ""
    
    var players = [Player?](count: 2, repeatedValue: nil)
    
    // method that ads the guessed letter to the current word and checks  the dictionary
    func guess (letter: String) -> String?
    {
        // only accepts single character
        if count(letter) > 1
        {
            return nil
        }
        
        // extend wordfragment and filter the dictionary
        currentWord = currentWord + letter
        dictionary.filter(currentWord.lowercaseString)
        
        //
        if let result = dictionary.result()
        {
            return result
        }

        return nil
    }
    
    // returns 0 for player 1 and 1 for player two
    func turn() -> Int
    {
        return count(currentWord) % 2
    }
    
    // returns the who last played a the move that ended the game
    func winner() -> Player?
    {
        return players[turn()]
    }
    
    func ended() -> Bool
    {
        let minlength = 4
        
        let subStringNotInDict = dictionary.subSet.count == 0
        let completedWord = contains(dictionary.dict, currentWord.lowercaseString) && count(currentWord) >= minlength
        
        return subStringNotInDict || completedWord
    }
    
    func reset()
    {
        dictionary.reset()
        currentWord = ""
        players = [Player?](count: 2, repeatedValue: nil)
    }
    
    // saves game specific data to user defaults
    func saveState()
    {
        var gameModelData = [String: AnyObject]()
        let tempPlayers = convertPlayers(players)
        var defaults = NSUserDefaults.standardUserDefaults()

        gameModelData["Players"] = tempPlayers as AnyObject
        gameModelData["Current Word"] = currentWord as AnyObject
        gameModelData["Dictionary Subset"] = dictionary.subSet as AnyObject
        
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
    
    func convertPlayers(players: [Player?]) -> [String]
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