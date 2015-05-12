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
        if defaults.stringForKey("Default Language") == nil
        {
            println("initializing")
            loadTextFiles()
            defaults.setValue("English", forKey: "Default Language")
        }
        
        let defaultLanguage = defaults.stringForKey("Default Language")
        
        switch defaultLanguage!
        {
        case "English":
            dict = defaults.objectForKey("English Dictionary") as! [String]
        case "Dutch":
            dict = defaults.objectForKey("Dutch Dictionary") as! [String]
        default:
            break
        }
    }
    
    private func loadTextFiles()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // source: http://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file
        // generates paths to the text files, reads them as strings and splits into arrays
        if let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true) as? [String]
        {
            let docs = dirs[0]
            let englishPath = NSBundle.mainBundle().pathForResource("english", ofType: "txt")
            let dutchPath = NSBundle.mainBundle().pathForResource("dutch", ofType: "txt")
                        
            if let englishDict = String(contentsOfFile: englishPath!, encoding: NSUTF8StringEncoding, error: nil)
            {
                var englishArray = split(englishDict) {$0 == "\n"}
                defaults.setObject(englishArray, forKey: "English Dictionary")
            }
            if let dutchDict = String(contentsOfFile: dutchPath!, encoding: NSUTF8StringEncoding, error: nil)
            {
                var dutchArray = split(dutchDict) {$0 == "\n"}
                defaults.setObject(dutchArray, forKey: "Dutch Dictionary")
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
