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
    var highscores = HighscoreList()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        // label array for iteration
        labels = [(firstPlace, firstPlaceScore), (secondPlace, secondPlaceScore), (thirdPlace, thirdPlaceScore)]
        let size = highscores.generate().count
        
        // populate nameLabels and scoreLabels when possible
        for (i,(nameLabel, scoreLabel)) in enumerate(labels)
        {
            if i < size
            {
                nameLabel.text = highscores.generate()[i].name
                scoreLabel.text = String(highscores.generate()[i].score)
            }
            else
            {
                nameLabel.text = nil
                scoreLabel.text = nil
            }
        }
    }
    
    
    
}
