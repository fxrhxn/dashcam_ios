//
//  MainAppVC.swift
//  dashcam.io
//
//  Created by Farhan Rahman on 11/13/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit

class MainAppVC: UIViewController {



    //The tabview.
    @IBOutlet weak var tabView: UIView!
    
    //Buttons in the tab view.
    @IBOutlet var buttons : [UIButton]!
    
    // View Controllers for each tab.
    var allVideoVC : UIViewController!
    var profileVC : UIViewController!
    var takeVideoVC : UIViewController!
    
    //Content View That Shows everything.
    @IBOutlet weak var contentView: UIView!
    
    //Array that holds all of the view controllers.
    var allVCs : [UIViewController]!
    
    //Current selected Index.
    var selectedIndex: Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Get the View Controller Data for each storyboard.
        allVideoVC = storyboard.instantiateViewController(withIdentifier: "allVideosView")
        takeVideoVC = storyboard.instantiateViewController(withIdentifier: "takeVideoView")
        profileVC = storyboard.instantiateViewController(withIdentifier: "provileView")
        
        //All the view controllers in an array. Order is CRUCIAL!
        allVCs = [allVideoVC, takeVideoVC, profileVC]

        //Select the first tab.
        buttons[selectedIndex].isSelected = true
        tabClicked(buttons[selectedIndex])
    
    }

    
    @IBAction func tabClicked(_ sender: UIButton) {
        
        //Previous index that was clicked.
        let previousIndex = selectedIndex
        
        //Make the index have the selected index.
        selectedIndex = sender.tag
        
        //Make the previous button deselected.
        buttons[previousIndex].isSelected = false

        // Get the previous View Controller.
        let previousVC = allVCs[previousIndex]
        
        //Remove the previous View Controller.
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Make the current button selected true.
        sender.isSelected = true
        
        //Get the new view controller.
        let currentVC = allVCs[selectedIndex]
        
        //Add the child view controller.
        addChildViewController(currentVC)
        
        //Adjust the View Controller to the frame.
        currentVC.view.frame = contentView.bounds
        contentView.addSubview(currentVC.view)
        currentVC.didMove(toParentViewController: self)

        
    }
    
 

}
