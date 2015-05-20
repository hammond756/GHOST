//
//  SettingsViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    @IBOutlet weak var defaultLangauge: UIButton!
    var defaults = NSUserDefaults.standardUserDefaults()
    let flags = ["english": "🇬🇧", "dutch": "🇳🇱"]
    let settings = Settings.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        defaultLangauge.setTitle(flags[defaults.stringForKey("Default Language")!], forState: .Normal)
    }

    @IBAction func changeDefaultLanguage()
    {
        let current = defaults.stringForKey("Default Language")
        
        current == "english" ? settings.setDefaultLanguage("dutch") : settings.setDefaultLanguage("dutch")
        defaultLangauge.setTitle(flags[defaults.stringForKey("Default Language")!], forState: .Normal)
    }
}
