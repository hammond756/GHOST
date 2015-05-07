//
//  HomePageViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 07/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBAction func openNewGame()
    {
        performSegueWithIdentifier("Open New Game", sender: self)
    }
    
}
