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
        winnerLabel.text = winner
        settings.savePlayers()
        game.reset(clearDict: true)
    }
    
    var winner = ""
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func homeScreenSegue()
    {
        game.reset(clearDict: false, clearPlayers: true)
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func replayWithSamePlayers()
    {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(winnerLabel.text, forKey: "winner")
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.decodeRestorableStateWithCoder(coder)
        winnerLabel.text = coder.decodeObjectForKey("winner") as? String
    }
    
}
