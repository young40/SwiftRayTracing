//
//  Ray.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/11/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

import Foundation

public class Ray {
    var origin: Vec3
    var direction: Vec3
    
    public init(origin: Vec3, direction: Vec3) {
        self.origin = origin
        self.direction = direction.normalize() //direction 为单位向量
    }
    
    public func getPoint(t: Float) -> Vec3 {
        return origin + direction * t
    }
}
