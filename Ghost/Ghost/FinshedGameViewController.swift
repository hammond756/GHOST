//
//  FinshedGameViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 01/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class FinshedGameViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = winner
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var winner = ""
}
