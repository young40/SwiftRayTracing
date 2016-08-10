//
//  Vec3.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/7/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

import Foundation

// 点乘运算符
infix operator .* {}
// 叉乘运算符
infix operator ** {}

public class Vec3 {
    public var x: Float = 0
    public var y: Float = 0
    public var z: Float = 0
    
    public init() {
        
    }
    
    public init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public var length: Float {
        get {
            return sqrt(sqrLength)
        }
    }
    
    public var sqrLength: Float {
        get {
            return x*x + y*y + z*z
        }
    }
    
    public func normalize() -> Vec3 {
        let inv = 1 / length
        return Vec3(x: x*inv, y: y*inv, z: z*inv)
    }
    
    public static func + (left: Vec3, right: Vec3) -> Vec3 {
        return Vec3(x: left.x + right.x,
                    y: left.y + right.y,
                    z: left.z + right.z)
    }
    
    public static prefix func - (vec3: Vec3) -> Vec3 {
        return Vec3(x: -vec3.x, y: -vec3.y, z: -vec3.z)
    }
    
    public static func - (left: Vec3, right: Vec3) -> Vec3 {
        return Vec3(x: left.x-right.x,
                    y: left.y-right.y,
                    z: left.z-right.z)
    }
    
    public static func * (left: Vec3, right: Float) -> Vec3 {
        return Vec3(x: left.x * right,
                    y: left.y * right,
                    z: left.z * right)
    }
    
    public static func * (left: Float, right: Vec3) -> Vec3 {
        return right * left
    }
    
    // 点乘符
    public static func .* (l: Vec3, r: Vec3) -> Float {
        return l.x * r.x +
               l.y * r.y +
               l.z * r.z
    }
    
    // 叉乘符
    public static func ** (l: Vec3, r: Vec3) -> Vec3 {
        return Vec3(x: -l.z*r.y + l.y+r.z,
                    y: l.z*r.x - l.x*r.z,
                    z: -l.y*r.x + l.x*r.y)
    }
    
    public static func / (l: Vec3, r: Float) -> Vec3 {
        return Vec3(x: l.x/r,
                    y: l.y/r,
                    z: l.z/r)
    }
    
    public static func == (left: Vec3, right: Vec3) -> Bool {
        return (left.x == right.x) &&
               (left.y == right.y) &&
               (left.z == right.z)
    }
    
    public static func != (left: Vec3, right: Vec3) -> Bool {
        return (left.x != right.x) ||
               (left.y != right.y) ||
               (left.z != right.z)
    }
}
