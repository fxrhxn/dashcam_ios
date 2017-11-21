//
//  apiSettings.swift
//  dashcam.io
//
//  Created by Farhan Rahman on 11/21/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import Foundation


class APISettings {
    

    /* API URLs */
    var production_url = "https://dashcam.herokuapp.com"
    var testing_url = "http://localhost:3000"

    /* Test URLs */
    var testLogin_url : String?
    var testRegister_url : String?
    var testVideoSave_url : String?
    var testGetVideos_url : String?
    
            /* Production URLs */
    var productionLogin_url : String?
    var productionRegister_url : String?
    var productionVideoSave_url : String?
    var productionGetVideos_url : String?


    init() {

        /* Test URLs */
        self.testLogin_url = "\(self.testing_url)/api/authentication/login"
        self.testRegister_url = "\(self.testing_url)/api/authentication/register"
        self.testVideoSave_url = "\(self.testing_url)/api/authentication/save/video"
        self.testGetVideos_url = "\(self.testing_url)/api/authentication/get/all-videos"

        /* Production URLs */
        self.productionLogin_url = "\(self.production_url)/api/authentication/login"
        self.productionRegister_url = "\(self.production_url)/api/authentication/register"
        self.productionVideoSave_url = "\(self.production_url)/api/authentication/save/video"
        self.productionGetVideos_url = "\(self.production_url)/api/authentication/get/all-videos"

    
    }

    

    
    
}

