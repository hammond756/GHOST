//
//  ViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 13/04/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dict = DictioraryTest(words: "Apple\nApplication\nBever\nBeverly")

    @IBAction func test()
    {
        println(dict.list)
       let filtered = dict.filter("App")
        println("\(filtered)")
    }

}

