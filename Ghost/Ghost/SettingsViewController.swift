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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        defaultLangauge.setTitle(flags[defaults.stringForKey("Default Language")!], forState: .Normal)
    }
    
    @IBOutlet weak var defaultLangauge: UIButton!
    var defaults = NSUserDefaults.standardUserDefaults()
    let flags = ["english": "🇬🇧", "dutch": "🇳🇱"]

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
