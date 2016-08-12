//: [Previous](@previous)

import Foundation

let s = Sphere(center: Vec3(x: 6, y: 0, z: 0), radius: 3)

let r1 = Ray(origin: Vec3(), direction: Vec3(x: 1, y: 0, z: 0))

let rs1 = s.intersect(ray: r1)

let r2 = Ray(origin: Vec3(x: 0, y: 1, z: 0), direction: Vec3(x: 1, y: 0, z: 0))

let rs2 = s.intersect(ray: r2)




//: [Next](@next)
