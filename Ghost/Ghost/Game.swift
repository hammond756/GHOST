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
    var dictionary: DictioraryTest
    
    var currentWord = ""
    
    init(dict: DictioraryTest)
    {
        dictionary = dict
    }
    
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
}