//
//  FirstViewController.swift
//  DoNotForget
//
//  Created by Juan Gomez on 25/06/15.
//  Copyright (c) 2015 Codes and Tags. All rights reserved.
//

import UIKit
var stuff = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return stuff.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = stuff[indexPath.row]
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("items") != nil{
            stuff = NSUserDefaults.standardUserDefaults().objectForKey("items") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            stuff.removeAtIndex(indexPath.row)
            table.reloadData()
            NSUserDefaults.standardUserDefaults().setObject(stuff, forKey: "items")
        }
    }


}

