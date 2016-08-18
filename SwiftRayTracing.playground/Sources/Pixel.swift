//
//  Pixel.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/6/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

//infix operator **

public struct Pixel {
    public var r: UInt8 = 0
    public var g: UInt8 = 0
    public var b: UInt8 = 0
    public var a: UInt8 = 0
    
    public init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green:green, blue: blue, alpha: 255)
    }
    
    public init(red: Int, green: Int, blue: Int, alpha: Int) {
        r = UInt8(red)
        g = UInt8(green)
        b = UInt8(blue)
        a = UInt8(alpha)
    }
    
    public static var black: Pixel {
        get {
            return Pixel(red: 0, green: 0, blue: 0)
        }
    }
    
    public static var white: Pixel {
        get {
            return Pixel(red: 255, green: 255, blue: 255)
        }
    }
    
    public static var red: Pixel {
        get {
            return Pixel(red: 255, green: 0, blue: 0)
        }
    }
    
    public static var green: Pixel {
        get {
            return Pixel(red: 0, green: 255, blue: 0)
        }
    }
    
    public static var blue: Pixel {
        get {
            return Pixel(red: 0, green: 0, blue: 255)
        }
    }
    
    public static func + (l: Pixel, r: Pixel) -> Pixel {
        return Pixel(red: UInt8Add(l.r, l.r),
                     green: UInt8Add(l.g, r.g),
                     blue: UInt8Add(l.b, r.b),
                     alpha: UInt8Add(l.a, r.a))
    }
    
    private static func UInt8Add(_ a: UInt8, _ b: UInt8) -> Int {
        return(Int(a) + Int(b) > 255) ? 255 : Int(a) + Int(b)
    }
    
    public static func * (l: Pixel, f: Float) -> Pixel {
        return Pixel(red: UInt8Multiply(l.r, f),
                     green: UInt8Multiply(l.g, f),
                     blue: UInt8Multiply(l.b, f))
    }
    
    public static func * (f: Float, r: Pixel) -> Pixel {
        return r * f
    }
    
    private static func UInt8Multiply(_ u: UInt8, _ f: Float) -> Int {
        return (Float(u) * f > 255) ? 255 : Int(Float(u) * f)
    }
    
    public static func ** (l: Pixel, r: Pixel) -> Pixel {
        return Pixel(red: UInt8Multiply(l.r, Float(r.r)),
                     green: UInt8Multiply(l.g, Float(r.g)),
                     blue: UInt8Multiply(l.b, Float(r.b)))
    }
}
