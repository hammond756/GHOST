//
//  ViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    // make sure the title in the UINavigationBar is correct on the first turn
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        updateScreen()
    }
    
    // link outlets in the storyboard
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    var game = Game.sharedInstance
    
    var navBar: UINavigationBar = UINavigationBar()
    
    // updates view title, word fragment displayed and clears input field
    func updateScreen()
    {
        title = game.players[game.turn()]?.name
        wordLabel.text = game.currentWord.capitalizedString
        inputField.text = ""
    }
    
    // updates dictionary and current word, checks for the end of a game and updates the view
    @IBAction func playLetter()
    {
        if let input = inputField.text
        {
            game.guess(input)
            updateScreen()
            
            if game.ended()
            {
                game.winner().incrementScore()
                println(game.players)
                performSegueWithIdentifier("Game Ended", sender: self)
            }
        }
    }
    
    // encode value of inputField when app is closed/moved to background
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(inputField.text, forKey: "Input field")
    }
    
    // decode value inputField and update the view
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        super.decodeRestorableStateWithCoder(coder)
        let text = coder.decodeObjectForKey("Input field") as! String
        inputField.text = text
    }
    
    



}

