//: [Previous](@previous)

import Foundation
import Cocoa

let white = Pixel.white
let black = Pixel.black
let red = Pixel.red
let green = Pixel.green
let blue = Pixel.blue

Pixel2Color(white)
Pixel2Color(black)
Pixel2Color(red)
Pixel2Color(green)
Pixel2Color(blue)

Pixel2Color(red + green + blue)

Pixel2Color(red + green)
Pixel2Color(red + blue)
Pixel2Color(green + blue)

Pixel2Color(white * 10)
Pixel2Color(black * 10)
Pixel2Color(red * 10)

Pixel2Color(white ** black)
Pixel2Color(red ** green)
Pixel2Color(red ** blue)
Pixel2Color(green ** blue)

let a = Pixel(red: 20, green: 10, blue: 40)
let b = Pixel(red: 2, green: 10, blue: 1)
let c = a ** b

Pixel2Color(c)

//: [Next](@next)
