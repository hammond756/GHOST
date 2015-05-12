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
    @IBOutlet weak var firstPlaceScore: UILabel!
    @IBOutlet weak var secondPlaceScore: UILabel!
    @IBOutlet weak var thirdPlaceScore: UILabel!
    
    var labels = [(UILabel,UILabel)]()
    var highscores = Highscores()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        labels = [(firstPlace, firstPlaceScore), (secondPlace, secondPlaceScore), (thirdPlace, thirdPlaceScore)]
        let highScoreList = highscores.generate()
        
        for (nameLabel, scoreLabel) in labels
        {
            // do something
        }
    }
    
    
    
}
