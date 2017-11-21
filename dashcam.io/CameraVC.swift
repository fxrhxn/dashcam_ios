//
//  CameraVC.swift
//  dashcam.io
//
//  Created by Farhan Rahman on 11/14/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Take Video Button Is Clicked.
    @IBAction func takeVideoClicked(_ sender: UIButton) {
        
        //Go to the active video View Controller.
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "activeVideoVC") as! ActiveVideoVC
        self.present(newViewController, animated: true, completion: nil)
        
    }
}
