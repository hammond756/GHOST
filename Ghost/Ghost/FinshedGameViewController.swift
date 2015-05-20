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
        winnerLabel.text = game.winner().name
        settings.savePlayers()
        game.reset(clearDict: true)
    }
    
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    @IBOutlet weak var winnerLabel: UILabel!
    
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
