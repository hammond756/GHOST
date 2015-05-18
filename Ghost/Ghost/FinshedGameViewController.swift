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
        
        if game.winner()
        {
            winnerLabel.text = game.player1?.name
            game.player1?.incrementScore()
        }
        else
        {
            winnerLabel.text = game.player2?.name
            game.player2?.incrementScore()
        }
        
       //  settings.save()
        game.reset()
    }
    
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func homeScreenSegue()
    {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
