//
//  NewGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 30/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {
    
    @IBOutlet weak var player1Field: UITextField!
    @IBOutlet weak var player2Field: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let gvc = segue.destinationViewController as? GamePlayViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                case "Start Game":
                    gvc.player1 = player1Field.text!
                    gvc.player2 = player2Field.text!
                default:
                    break
                }
            }
        }
    }
}
