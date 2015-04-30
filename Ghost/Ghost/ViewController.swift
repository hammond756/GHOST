//
//  ViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // link outlets in the storyboard
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    
    var game = Game(dict: DictioraryTest(language: "english"))
    
    func updateScreen()
    {
        // change the playerLabel to the current player
        if game.turn()
        {
            playerLabel.text = "Player 1"
        }
        else
        {
            playerLabel.text = "Player 2"
        }
        
        // update the wordfragment
        wordLabel.text = game.currentWord
        
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
            
            // print winner in console (until handled by a view)
            if game.ended()
            {
                if game.winner()
                {
                    println("Player 1 wins!")
                }
                else
                {
                    println("Player 2 wins!")
                }
            }
        }
    }
    
    



}

