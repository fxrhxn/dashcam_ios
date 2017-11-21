//
//  ProfileVC.swift
//  dashcam.io

//  Created by Farhan Rahman on 11/14/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

/*
 
 View Controller that shows the Profile Screen.
 
 */


import UIKit

class ProfileVC: UIViewController {
    
    //Dummy data for the profile.
    var dummy_data = Profile_Sample()
    
    //Label for the username.
    @IBOutlet weak var usernameLabel: UILabel!
    
    //Label for the date created.
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    //Settings Button
    @IBOutlet weak var settingsButton: UIButton!
    
    //Delete Button
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = "Username: \(dummy_data.username)"
    
        dateCreatedLabel.text = "Date Created: \(dummy_data.dateCreated)" 
        
        //Make the button corners more rounded.
        settingsButton.layer.cornerRadius = 7
        deleteButton.layer.cornerRadius = 7
        
    }

    //Settings button is clicked.
    @IBAction func settingsClicked(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "settingsVC") as! SettingsVC
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    //Delete Button is clicked.
    @IBAction func deleteClicked(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Are you sure?", message: "There's no going back bro :'(", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    

}
