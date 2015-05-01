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
            self.title = player1
        }
        else
        {
            self.title = player2
        }
    }
    
    // link outlets in the storyboard
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    var game = Game(dict: DictioraryTest(language: "english"))
    
    // variables to store player names
    var player1: String = ""
    var player2: String = ""
    
    var navBar: UINavigationBar = UINavigationBar()
    
    func updateScreen()
    {
        // change the UINavigationBar title to the current player
        if game.turn()
        {
            self.title = player1
        }
        else
        {
            self.title = player2
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
            
            // print winner in console (until handled by a view)
            if game.ended()
            {
                if game.winner()
                {
                    println(player1 + " wins!")
                }
                else
                {
                    println(player2 + " wins!")
                }
            }
        }
    }
    
    



}

