//
//  SecondViewController.swift
//  DoNotForget
//
//  Created by Juan Gomez on 25/06/15.
//  Copyright (c) 2015 Codes and Tags. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        var myString = textField.text
        var newString = myString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())       
        if newString.isEmpty {
            error.text = "Please fill the text field"
        }else{
            error.text = ""
            stuff.append(textField.text)
            textField.text = ""
            NSUserDefaults.standardUserDefaults().setObject(stuff, forKey: "items")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        error.text = ""
        self.view.endEditing(true)
         error.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        error.text = ""
        textField.resignFirstResponder()
        return true
    }

}

