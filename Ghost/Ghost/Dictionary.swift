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
    
    init(words: String)
    {
        self.list = split(words) {$0 == "\n"}
    }

    func filter(subString: String) -> [String]
    {
        var dictCopy = self.list
        let length = subString.utf16Count
        
        var subSet = [String]()
        
        for word in dictCopy
        {
            let index = advance(word.startIndex, length)
            if word.substringToIndex(index) == subString
            {
                subSet.append(word)
            }
        }
        
        return subSet
        
    }
}
