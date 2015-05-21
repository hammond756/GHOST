//
//  FinshedGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond | student number: 10437215
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class FinshedGameViewController: UIViewController
{
    @IBOutlet weak var winnerLabel: UILabel!
    
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        winnerLabel.text = game.winner().name
        settings.savePlayers()
        game.reset(clearDict: true)
    }
    
    // pop to HomeScreenView and clear the players
    @IBAction func quitToHomeScreen()
    {
        game.reset(clearDict: false, clearPlayers: true)
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // pop to GamePlayView to restart game with same players
    @IBAction func replayWithSamePlayers()
    {
        navigationController?.popViewControllerAnimated(true)
    }
}
