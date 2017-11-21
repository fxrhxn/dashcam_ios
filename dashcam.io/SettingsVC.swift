//
//  SettingsVC.swift
//  dashcam.io
//
//  Created by Farhan Rahman on 11/14/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //New Username Button is clicked.
    @IBAction func newUsernameClicked(_ sender: Any) {
    }
    
    //New Password Button is clicked. 
    @IBAction func newPasswordButtonClicked(_ sender: UIButton) {
    }
    
    //Go to the Main VC.
    @IBAction func doneButtonClicked(_ sender: UIBarButtonItem) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainVC") as! MainAppVC
        self.present(newViewController, animated: true, completion: nil)
    }
    

}
