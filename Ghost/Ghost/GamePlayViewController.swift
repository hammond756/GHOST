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
        // change the UINavigationBar title to the current player
        title = game.players[game.turn()]?.name
        
        // update the wordfragment
        wordLabel.text = game.currentWord.capitalizedString
    }
    
    @IBAction func playLetter()
    {
        if let input = inputField.text
        {
            // send input to the model
            game.guess(input)
            
            // update the view
            updateScreen()
            
            inputField.text = ""
            
            if game.ended()
            {
                performSegueWithIdentifier("Game Ended", sender: self)
            }
        }
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(inputField.text, forKey: "Input field")
        game.saveState()
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        super.decodeRestorableStateWithCoder(coder)
        let text = coder.decodeObjectForKey("Input field") as! String
        inputField.text = text
        game.restoreState()
    }
    
    



}

