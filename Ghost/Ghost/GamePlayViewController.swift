//
//  ViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController
{
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var letterField: UITextField!
    var game = Game.sharedInstance
    
    // make sure the title in the UINavigationBar is correct on the first turn
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        updateScreen()
    }

    // updates view title, word fragment displayed and clears input field
    func updateScreen()
    {
        title = game.players[game.currentPlayerIndex()]?.name
        wordLabel.text = game.currentWord.capitalizedString
        letterField.text = ""
    }
    
    // updates dictionary and current word, checks for the end of a game and updates the view
    @IBAction func playLetter()
    {
        if let letter = letterField.text
        {
            game.guess(letter)
            updateScreen()
            
            if game.ended()
            {
                game.winner().incrementScore()
                performSegueWithIdentifier("Game Ended", sender: self)
            }
        }
    }
    
    // encode value of inputField when app is closed/moved to background
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(letterField.text, forKey: "Input field")
    }
    
    // decode value inputField and update the view
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        super.decodeRestorableStateWithCoder(coder)
        let text = coder.decodeObjectForKey("Input field") as! String
        letterField.text = text
    }
}

