//
//  ChoosePlayerViewController.swift
//  Ghost
//
//  Created by Aron Hammond | student number: 10437215
//  Copyright (c) 2015 Aron Hammond. All rights reserved.
//
//  note: Swipe to delete copied from source, couldn't retrieve link anymore

import UIKit

class ChoosePlayerViewController: UITableViewController
{
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // specify the number of rows in the table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return settings.players.count
    }
    
    // write the correct names in the corresponding row of the table view
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Player", forIndexPath: indexPath) as! UITableViewCell
        let player = settings.players[indexPath.row]
        
        cell.textLabel?.text = player.name
        
        return cell
    }
    
    // enable editing
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    // remove when delete is pressed
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            settings.players.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    // pop view of navigation controller and set player that was being choosen when an cell is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // helper function, only used inside this function
        func setPlayer(number: Int)
        {
            game.players[number - 1] = settings.players[indexPath.row]
        }
        
        title == "Player 1" ? setPlayer(1) : setPlayer(2)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    // save game's title
    override func encodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.encodeRestorableStateWithCoder(coder)
        coder.encodeObject(title, forKey: "Current Title")
    }
    
    // restore view's title
    override func decodeRestorableStateWithCoder(coder: NSCoder)
    {
        super.decodeRestorableStateWithCoder(coder)
        title = coder.decodeObjectForKey("Current Title") as? String
    }
}
