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
    class var sharedInstance: Game
    {
        struct Static {
            static var instance: Game?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Game()
        }
        
        return Static.instance!
    }
    
    var dictionary = DictioraryTest(language: "english")
    
    var currentWord = ""
    
//    var player1 = Player(name: "", score: 0)
//    var player2 = Player(name: "", score: 0)
    var player1: Player?
    var player2: Player?
    
    var isFresh: Bool
    {
        get
        {
            return (player1 == nil && player2 == nil)
        }
    }
    
//    init(dict: DictioraryTest)
//    {
//        dictionary = dict
//    }
//    
    
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
    
    func turn() -> Bool
    {
        return count(currentWord) % 2 == 0
    }
    
    func ended() -> Bool
    {
        let minlength = 4
        
        let subStringNotInDict = dictionary.subSet.count == 0
        let completedWord = contains(dictionary.dict, currentWord.lowercaseString) && count(currentWord) >= minlength
        
        return subStringNotInDict || completedWord
    }
    
    func winner() -> Bool
    {
        return turn()
    }
    
    func reset()
    {
        dictionary.reset()
        player1 = nil
        player2 = nil
    }
}