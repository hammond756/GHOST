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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let fgvc = segue.destinationViewController as? FinshedGameViewController
        {
            if segue.identifier == "Game Ended"
            {
                fgvc.winner = game.winner().name
            }
        }
    }
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(inputField.text, forKey: "Input field")
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        super.decodeRestorableStateWithCoder(coder)
        let text = coder.decodeObjectForKey("Input field") as! String
        inputField.text = text
    }
    
    



}

