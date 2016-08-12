//
//  Pixel.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/6/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

struct Pixel {
    var r: UInt8 = 0
    var g: UInt8 = 0
    var b: UInt8 = 0
    var a: UInt8 = 0
    
    init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green:green, blue: blue, alpha: 255)
    }
    
    init(red: Int, green: Int, blue: Int, alpha: Int) {
        r = UInt8(red)
        g = UInt8(green)
        b = UInt8(blue)
        a = UInt8(alpha)
    }
    
    static var black: Pixel {
        get {
            return Pixel(red: 0, green: 0, blue: 0)
        }
    }
    
    static var white: Pixel {
        get {
            return Pixel(red: 255, green: 255, blue: 255)
        }
    }
}
