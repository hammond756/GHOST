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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        defaultLangauge.setTitle(flags[defaults.stringForKey("Default Language")!], forState: .Normal)
    }

    @IBAction func changeDefaultLanguage()
    {
        if defaults.stringForKey("Default Language") == "english"
        {
            defaults.setValue("dutch", forKey: "Default Language")
        }
        else
        {
            defaults.setValue("english", forKey: "Default Language")
        }
        
        defaultLangauge.setTitle(flags[defaults.stringForKey("Default Language")!], forState: .Normal)
    }
}
