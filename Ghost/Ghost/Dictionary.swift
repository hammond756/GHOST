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
    var list = [String]()
    var subSet = [String]()
    
    init(words: String)
    {
        self.list = split(words) {$0 == "\n"}
    }

    func filter(subString: String)
    {
        var listToInspect = [String]()
        
        if self.subSet.count == 0
        {
            listToInspect = self.list
        }
        else
        {
            listToInspect = self.subSet
        }
        
        var subSetCopy = [String]()
        let length = subString.utf16Count
        
        for word in listToInspect
        {
            let index = advance(word.startIndex, length)
            if word.substringToIndex(index) == subString 
            {
                subSetCopy.append(word)
            }
        }
        
        self.subSet = subSetCopy
    }
    
    func count() -> Int
    {
        return self.subSet.count
    }
    
    func result() -> String?
    {
        if count() == 1
        {
            return self.subSet[subSet.startIndex]
        }
        
        return nil
    }
    
    func reset()
    {
        self.subSet = [String]()
    }
}
