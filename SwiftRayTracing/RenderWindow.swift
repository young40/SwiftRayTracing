//
//  RenderWindow.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/3/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

import Cocoa

class RenderWindow: NSWindow, NSWindowDelegate {
    var image: NSImage!
    var imageView: NSImageView!
    
    func windowDidResize(_ notification: Notification) {
        draw()
    }
    
    func _init() {
        imageView = NSImageView()
        self.contentView?.addSubview(imageView)
    }
    
    func draw() {
        imageView!.frame = self.contentView!.frame
    }
}
