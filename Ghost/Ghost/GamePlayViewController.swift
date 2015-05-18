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
        
        // clear input field
        inputField.text = ""
    }
    
    @IBAction func playLetter()
    {
        if let input = inputField.text
        {
            // send input to the model
            game.guess(input)
            
            // update the view
            updateScreen()
            
            if game.ended()
            {
                performSegueWithIdentifier("Game Ended", sender: self)
            }
        }
    }
    
    



}

