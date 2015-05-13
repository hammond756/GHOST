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
    
    init()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // if no default is set, dictionaries have to be loaded in
        if defaults.objectForKey("english") == nil
        {
            loadTextFile("english")
        }
        if defaults.objectForKey("dutch") == nil
        {
            loadTextFile("dutch")
        }
        if defaults.stringForKey("Default Language") == nil
        {
            defaults.setValue("english", forKey: "Default Language")
        }
        
        let defaultLanguage = defaults.stringForKey("Default Language")
        dict = defaults.objectForKey(defaultLanguage!) as! [String]
    }
    
    private func loadTextFile(language: String)
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        println("Initializing")
        
        // source: http://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file
        // generates paths to the text files, reads them as strings and splits into arrays
        if let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true) as? [String]
        {
            let docs = dirs[0]
            let path = NSBundle.mainBundle().pathForResource(language, ofType: "txt")
            
            if let dictString = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
            {
                println("Start split")
                var dictArray = split(dictString) {$0 == "\n"}
                println("Finished split")
                defaults.setObject(dictArray, forKey: language)
            }
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
