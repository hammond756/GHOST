//
//  Dictionary.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class DictioraryTest
{
    // string arrays that will store the dictionary and the filtered dictionary
    var dict = [String]()
    var subSet = [String]()
    
    // textfiles with english and dutch dictionaries
    let englishDict = String(contentsOfFile: "/Users/Aron/GHOST/english", encoding: NSUTF8StringEncoding, error: nil)
    let dutchDict = String(contentsOfFile: "/Users/Aron/GHOST/dutch", encoding: NSUTF8StringEncoding, error: nil)
    
    // choose language in initializer
    init(language: String)
    {
        switch language
        {
        case "dutch": self.dict = split(dutchDict!) {$0 == "\n"}
        case "english": self.dict = split(englishDict!) {$0 == "\n"}
        default: self.dict = split(dutchDict!) {$0 == "\n"}
        }
    }
    
    // save words with prefix in the subSet
    func filter(subString: String)
    {
        subSet = dict.filter() { $0.hasPrefix(subString) }
    }
    
    // return the size of the subSet
    func count() -> Int
    {
        return self.subSet.count
    }
    
    // return the last word in the subSet
    func result() -> String?
    {
        if count() == 1
        {
            return self.subSet[subSet.startIndex]
        }
        
        return nil
    }
    
    // clear the subSet
    func reset()
    {
        self.subSet = [String]()
    }
}
