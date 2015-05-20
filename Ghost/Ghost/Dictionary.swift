//
//  Dictionary.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//
//  Description: Handles all things related to the dictionary

import Foundation

class DictionaryClass
{
    // string arrays that will store the full dictionary and the filtered dictionary
    var dict = [String]()
    var subSet = [String]()
    var currentLanguage = ""
    let settings = Settings.sharedInstance
    
    init()
    {
        let language = settings.getDefaultLanguage()
        checkForStoredDictionaries()
        changeLanguage(language)
    }
    
    // checks NSUserDefaults for dict arrays, if not present: read and split dict files
    private func checkForStoredDictionaries()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        let languages = ["english", "dutch"]
        
        // if no default is set, dictionaries have to be loaded in
        for language in languages
        {
            if defaults.objectForKey(language) == nil
            {
                loadTextFile(language)
            }
        }
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
            
            if let dictString = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
            {
                var dictArray = split(dictString) {$0 == "\n"}
                defaults.setObject(dictArray, forKey: language)
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
    
    // clear the subSet
    func reset()
    {
        self.subSet = [String]()
    }
}
