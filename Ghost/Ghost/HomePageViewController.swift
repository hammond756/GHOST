//
//  HomePageViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 07/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//
//  Description: No real activity, segues are handled by the storyboard

import UIKit

class HomePageViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // make sure game instance is ready throughout the app
        var game = Game.sharedInstance
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
