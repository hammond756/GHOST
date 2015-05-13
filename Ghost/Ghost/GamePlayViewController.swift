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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if game.turn()
        {
            self.title = game.player1?.name
        }
        else
        {
            self.title = game.player2?.name
        }
    }
    
    // link outlets in the storyboard
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    var game = Game.sharedInstance
    
    var navBar: UINavigationBar = UINavigationBar()
    
    func updateScreen()
    {
        // change the UINavigationBar title to the current player
        if game.turn()
        {
            self.title = game.player1?.name
        }
        else
        {
            self.title = game.player2?.name
        }
        
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

