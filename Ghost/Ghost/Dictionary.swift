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
    var currentLanguage: String
    
    init()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // initialize stored property to silence compiler error
        currentLanguage = ""
        
        let languages = ["english", "dutch"]

        // if no default is set, dictionaries have to be loaded in
        for language in languages
        {
            if defaults.objectForKey(language) == nil
            {
                loadTextFile(language)
            }
        }

        if defaults.stringForKey("Default Language") == nil
        {
            defaults.setValue("english", forKey: "Default Language")
        }
        
        let defaultLanguage = defaults.stringForKey("Default Language")
        changeLanguage(defaultLanguage!)
    }
    
    // reads dictionary text file to a string and splits it to store individual words in an array
    private func loadTextFile(language: String)
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // source: http://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file
        // generates paths to the text files, reads them as strings and splits into arrays
        if let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true) as? [String]
        {
            let docs = dirs[0]
            let path = NSBundle.mainBundle().pathForResource(language, ofType: "txt")
            
            if let dict = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
            {
                dict.componentsSeparatedByString("\n")
                defaults.setObject(dict, forKey: language)
            }
        }
    }
    
    // language is a lowecase string 'english' or 'dutch'
    func changeLanguage(language: String)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        dict = defaults.objectForKey(language) as! [String]
        currentLanguage = language
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
