//
//  ViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Game(dict: DictioraryTest(words: "Apple\nApplication\nBananna\nBathtub\nCat\nCaramel"))

    @IBAction func test(sender: UIButton)
    {
        if let letter = sender.currentTitle
        {
            game.guess(letter)
        }
    }



}

