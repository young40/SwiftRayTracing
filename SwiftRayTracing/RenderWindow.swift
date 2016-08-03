//
//  RenderWindow.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/3/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

import Cocoa

class RenderWindow: NSWindow, NSWindowDelegate {
    func windowDidResize(_ notification: Notification) {
        NSLog("windowDidResize")
    }
}
