//
//  Settings.swift
//  Ghost
//
//  Created by Aron Hammond on 09/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import Foundation

class Settings
{
    var dataFilePath: String?
    
    class var sharedInstance: Settings
    {
        struct Static {
            static var instance: Settings?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Settings()
        }
        
        return Static.instance!
    }
    
    init()
    {
        let fileManager = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let docsDirectory = dirPaths[0] as! String
        
        dataFilePath = docsDirectory.stringByAppendingPathComponent("data.archive")
        
        if fileManager.fileExistsAtPath(dataFilePath!)
        {
            players = NSKeyedUnarchiver.unarchiveObjectWithFile(dataFilePath!) as! [String] // [Player]
        }
    }
    
    func savePlayers()
    {
        NSKeyedArchiver.archiveRootObject(players, toFile: dataFilePath!)
    }
    
    // var players = [Player]()
    var players = [String]()
    
    
    func addPlayer(name: String)
    {
        // var newPlayer = Player(name: name)
        players.append(name)
        self.savePlayers()
    }
}
