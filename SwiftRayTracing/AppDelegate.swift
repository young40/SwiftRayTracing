//
//  AppDelegate.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/3/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: RenderWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.delegate = window
        window._init()
        window.draw()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

