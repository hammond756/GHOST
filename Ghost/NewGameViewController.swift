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
    @IBOutlet weak var engButton: UIButton!
    @IBOutlet weak var duButton: UIButton!
    
    var game = Game.sharedInstance
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        changeHighlightedFlag()
        var playerLabels: [UILabel] = [player1Label, player2Label]
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        
        if game.players[0] == nil
        {
            player1Label.text = "Player 1"
            player1Label.alpha = 0.3
        }
        else
        {
            player1Label.text = game.players[0]?.name
            player1Label.alpha = 1.0
        }
        if game.players[1] == nil
        {
            player2Label.text = "Player 2"
            player2Label.alpha = 0.3
        }
        else
        {
            player2Label.text = game.players[1]?.name
            player2Label.alpha = 1.0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
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
    
    @IBAction func changeLanguage(sender: UIButton)
    {
        let symbol = sender.currentTitle!
        let flags = ["🇬🇧": "english", "🇳🇱": "dutch"]
        
        game.dictionary.changeLanguage(flags[symbol]!)
        changeHighlightedFlag()
    }
    
    private func changeHighlightedFlag()
    {
        switch game.dictionary.currentLanguage
        {
        case "english":
            engButton.alpha = 1.0
            duButton.alpha = 0.3
        case "dutch":
            engButton.alpha = 0.3
            duButton.alpha = 1.0
        default:
            break
        }
    }
}
