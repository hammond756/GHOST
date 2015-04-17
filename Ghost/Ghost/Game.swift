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
    var dictionary = DictioraryTest(words: "")
    
    init(dict: DictioraryTest)
    {
        dictionary = dict
    }
    
    var currentWord = ""
    
    func guess (letter: String) -> String?
    {
        if letter.utf16Count > 1
        {
            return nil
        }
        
        currentWord = currentWord + letter
        dictionary.filter(currentWord)
        
        println(dictionary.list)
        
        println(dictionary.subSet)
        
        if let result = dictionary.result()
        {
            return result
        }
        
        return nil
    }
    
    func turn() -> Bool
    {
        if currentWord.utf16Count % 2 == 0
        {
            return true
        }

        return false

    }
    
    func ended() -> Bool
    {
        
        let subStringNotInDict = dictionary.subSet.count == 0
        let completedWord = contains(dictionary.subSet, currentWord)
        
        if subStringNotInDict || completedWord
        {
            return true
        }
        
        return false
    }
    
    func winner() -> Bool
    {
        return !turn()
    }
}