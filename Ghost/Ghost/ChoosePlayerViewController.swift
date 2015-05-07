//
//  ChoosePlayerViewController.swift
//  Ghost
//
//  Created by Aron Hammond on 07/05/15.
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//

import UIKit

class ChoosePlayerViewController: UITableViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.players = [Player(name: "Aron", score: 0), Player(name: "Betty", score: 0), Player(name: "Kees", score: 0), ]
    }
    
    var game = Game.sharedInstance
    
    var players = [Player]()
    
    // specify the number of rows in the table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    // write the correct names in the corresponding row of the table view
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Player", forIndexPath: indexPath) as! UITableViewCell
        let player = players[indexPath.row]
        
        cell.textLabel?.text = player.name
        
        return cell
    }
    
    // pop view of navigation controller when an item is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if title == "Player 1"
        {
            game.player1 = players[indexPath.row].name
        }
        else
        {
            game.player2 = players[indexPath.row].name
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
}
