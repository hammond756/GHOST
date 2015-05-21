//
//  NewGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 30/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

// extension to change two properties with one method
extension UILabel
{
    func setProperties(text: String?, alpha: Float)
    {
        self.text = text
        self.alpha = CGFloat(alpha)
    }
}

class NewGameViewController: UIViewController
{
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var dutchButton: UIButton!

    
    var game = Game.sharedInstance
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        changeHighlightedFlag(game.dictionary.currentLanguage)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        let labels = [player1Label, player2Label]
        
        for (i,label) in enumerate(labels)
        {
            game.players[i] == nil ? labels[i].setProperties("Player \(i+1)", alpha: 0.3) : labels[i].setProperties(game.players[i]?.name, alpha: 1.0)
        }
    }
    
    // set the title of the ChoosePlayerViewController in case of segue
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
    
    // block segue to GamePlayViewController if one of either player's value is nil
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    {
        if identifier == "Start Game"
        {
            if game.players[0] == nil || game.players[1] == nil
            {
                return false
            }
        }
        
        return true
    }
    
    @IBAction func changeLanguage(sender: UIButton)
    {
        sender.currentTitle == "🇬🇧" ? changeLanguage("english") : changeLanguage("dutch")
    }
    
    // change language in dictionary object and update flags their highlighting
    private func changeLanguage(language: String)
    {
        game.dictionary.changeLanguage(language)
        changeHighlightedFlag(language)
    }

    private func changeHighlightedFlag(flag: String)
    {
        // helper function, only used inside this function
        func switchHighlight(fromButton: UIButton, toButton: UIButton)
        {
            fromButton.alpha = 0.3
            toButton.alpha = 1.0
        }
        
        flag == "english" ? switchHighlight(dutchButton, englishButton) : switchHighlight(englishButton, dutchButton)
    }
}
