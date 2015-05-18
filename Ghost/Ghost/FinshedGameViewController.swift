//
//  FinshedGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 01/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class FinshedGameViewController: UIViewController
{
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        game.winner()?.incrementScore()
        winnerLabel.text = game.winner()?.name
        
        game.reset()
        settings.savePlayers()
    }
    
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func homeScreenSegue()
    {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
