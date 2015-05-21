//
//  AddPlayerViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 09/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController
{
    @IBOutlet weak var nameField: UITextField!
    
    var settings = Settings.sharedInstance

    @IBAction func addPlayer()
    {
        let playerName = nameField.text
        settings.addPlayer(playerName)
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func cancel(sender: UIBarButtonItem)
    {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // encode value of nameField
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(nameField.text, forKey: "Input name")
    }
    
    // decode value of nameField and update view
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.decodeRestorableStateWithCoder(coder)
        nameField.text = coder.decodeObjectForKey("Input name") as? String
    }
}
