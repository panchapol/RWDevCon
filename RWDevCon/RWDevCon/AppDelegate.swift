//
//  AppDelegate.swift
//  RWDevCon
//
//  Created by Pop Panchapol on 10/20/15.
//  Copyright © 2015 Pop Panchapol. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?

    var appController: TVApplicationController?
    
    static let LocalHost = true
    
    // To run the cleint code on localhost, go to terminal at folder {PROJECT_DIR}/parse/public and run "python -m SimpleHTTPServer 9001"
    static let TVBaseURL = LocalHost ? "http://localhost:9001/" : "http://sample-tv-app.parseapp.com/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        print("The client code is running at \(AppDelegate.TVBaseURL)")
        
        let appControllerContext = TVApplicationControllerContext()
        
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else {
            fatalError("unable to create NSURL")
        }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }
}

