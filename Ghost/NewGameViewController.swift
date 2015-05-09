//
//  NewGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 30/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    var game = Game.sharedInstance
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if game.player1 == ""
        {
            player1Label.text = "Player 1"
            player1Label.alpha = 0.3
        }
        else
        {
            player1Label.text = game.player1
            player1Label.alpha = 1.0
        }
        if game.player2 == ""
        {
            player2Label.text = "Player 2"
            player2Label.alpha = 0.3
        }
        else
        {
            player2Label.text = game.player2
            player2Label.alpha = 1.0
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cpvc = segue.destinationViewController as? ChoosePlayerViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                case "Choose Player 1": cpvc.title = "Player 1"
                case "Choose Player 2": cpvc.title = "Player 2"
                default: break
                }
            }
        }
    }
    
}
