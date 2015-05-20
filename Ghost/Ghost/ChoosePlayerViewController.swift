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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    var game = Game.sharedInstance
    var settings = Settings.sharedInstance
    
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
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
    {
        return .Delete
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView!.setEditing(editing, animated: animated)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            settings.players.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    // pop view of navigation controller when an item is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if title == "Player 1"
        {
            game.players[0] = settings.players[indexPath.row]
        }
        else
        {
            game.players[1] = settings.players[indexPath.row]
        }
        
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
        coder.decodeObjectForKey("Current Title")
    }
}
