import Foundation
import Cocoa

public func Pixel2Color(_ pixel: Pixel) -> NSColor {
    return NSColor.init(deviceRed: CGFloat(Float(pixel.r) / 255.0),
                        green: CGFloat(Float(pixel.g) / 255.0),
                        blue: CGFloat(Float(pixel.b) / 255.0),
                        alpha: CGFloat(Float(pixel.a) / 255.0))
}
