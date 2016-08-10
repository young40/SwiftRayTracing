//: Playground - noun: a place where people can play

import Cocoa

let a = Vec3(x: 1, y: 2, z: 3)

let b = Vec3(x: 4, y: 5, z: 6)

let c = a + b

let d = a - b

let e = b - a

let f = -d

if (e == f) {
    print("e == f");
}

if (d == e) {
    print("d == e")
} else {
    print("==: d != e")
}

if (d != e) {
    print("!=: d != e")
}

let g = a * 3
let h = 3 * a

let i = Vec3(x: 3, y: 0, z: 0)
let j = Vec3(x: 0, y: 3, z: 0)

let kdot = i .* j //点乘
let kcross = i ** j //叉乘

let l = a.normalize()

let m = a.length
let n = l.length

let o = a / 3
let p = o.length


