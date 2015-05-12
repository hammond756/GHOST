//
//  HighscoreViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 11/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class HighscoreViewController: UIViewController
{
    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var thirdPlace: UILabel!
    
    let highscores = Highscores()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highscores.generate()
        
        firstPlace.text = highscores.highscoreList[0].name + ": " + String(highscores.highscoreList[0].score)
        secondPlace.text = highscores.highscoreList[1].name + ": " +      String(highscores.highscoreList[1].score)
        thirdPlace.text = highscores.highscoreList[2].name + ": " + String(highscores.highscoreList[2].score)
    }
    
    
    
}
