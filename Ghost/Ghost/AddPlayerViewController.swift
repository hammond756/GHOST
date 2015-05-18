//
//  AddPlayerViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 09/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
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
    
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(nameField.text, forKey: "Input name")
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
        let name = coder.decodeObjectForKey("Input name") as! String
        nameField.text = name
    }
}
