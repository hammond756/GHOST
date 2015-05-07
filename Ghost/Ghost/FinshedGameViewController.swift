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
        winnerLabel.text = winner
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var winner = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        
        if let ngvc = destination as? NewGameViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                case "Return To Homescreen":
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
    
    @IBAction func returnToHomeScreen() {
        performSegueWithIdentifier("Return To Homescreen", sender: self)
    }
    
}
