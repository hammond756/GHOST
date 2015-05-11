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
    override func viewDidLoad() {
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
    }
    
    var game = Game.sharedInstance
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        
        if let ngvc = destination as? NewGameViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                case "Return To Homescreen":
                    game.reset()
                    println("Quit")
                case "Show Highscores":
                    println("Highscores")
                case "Replay Game":
                    println("Replay")
                default: break
                }
            }
        }
        
    }
    
    @IBAction func returnToHomeScreen()
    {
        performSegueWithIdentifier("Return To Homescreen", sender: self)
    }
    
}
