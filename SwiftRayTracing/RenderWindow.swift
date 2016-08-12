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
    var textView: NSTextView!
    
    func windowDidResize(_ notification: Notification) {
        draw()
    }
    
    func _init() {
        imageView = NSImageView()
        self.contentView?.addSubview(imageView)
        
        textView = NSTextView(frame: NSRect(x: 0, y: 0, width: 2000, height: 20))
        
        textView.isSelectable = false
        textView.isEditable = false
        textView.backgroundColor = NSColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
        
        self.contentView?.addSubview(textView)
    }
    
    func draw() {
        let frame = self.contentView?.frame
        
        imageView.frame = frame!
        
        let w = Int(frame!.width)
        let h = Int(frame!.height)
        
        let start = Date()
        
//        let data = getData1BasePink(w: w, h: h)
//        let data = getData2LinerColor(w: w, h: h)
//        let data = getData3Deep(w: w, h: h)
        let data = getData4Normal(w: w, h: h)
        
        let dataTime = Date()
        let dataInterval = dataTime.timeIntervalSince(start)
        
        imageView.image = dataToImage(data: data)
        let imageTime = Date()
        let imageInterval = imageTime.timeIntervalSince(dataTime)
        let totalInterval = imageTime.timeIntervalSince(start)
        
        let doubleFormat = ".3"
        
        textView.string = "\(w) * \(h) = \(w*h) 渲染:\(dataInterval.format(doubleFormat)) 显示:\(imageInterval.format( doubleFormat)) 共:\(totalInterval.format(doubleFormat))"
        textView.textColor = NSColor.white
    }
    
    func getData1BasePink(w width: Int, h height: Int) -> [[Pixel]] {
        var data = [[Pixel]]()
        
        for _ in 0 ..< height {
            var rowData = [Pixel]()
            for _ in 0 ..< width {
                let v = Pixel(red: 255, green: 192, blue: 203)
                rowData.append(v)
            }
            
            data.append(rowData)
        }
        
        return data
    }
    
    func getData2LinerColor(w width: Int, h height: Int) -> [[Pixel]] {
        var data = [[Pixel]]()
        
        for y in 0 ..< height {
            var rowData = [Pixel]()
            for x in 0 ..< width {
                let v = Pixel(red: 255*x/width,
                              green: 255*y/height,
                              blue: 0)
                
                rowData.append(v)
            }
            
            data.append(rowData)
        }
        
        return data
    }
    
    func getData3Deep(w width: Int, h height: Int) -> [[Pixel]] {
        var data = [[Pixel]]()
        
        let sphere = Sphere(center: Vec3(x: 0, y: 10, z: -10), radius: 10)
        let camera = PerspectiveCamera(eye: Vec3(x: 0, y: 10, z: 10),
                                       front: Vec3(x: 0, y: 0, z: -1),
                                       up: Vec3(x: 0, y: 1, z: 0),
                                       fov: 90)
        
        let maxDepth: Float = 20.0
        
        for y in 0 ..< height {
            var rowData = [Pixel]()
            
            let sy = Float(y) / Float(height)
            
            for x in 0 ..< width {
                let sx = Float(x) / Float(width)
                
                let ray = camera.generateRay(x: sx, y: sy)
                
                if let rs = sphere.intersect(ray: ray) {
                    let depth = Int(255 - min(255 * rs.distance/maxDepth, 255))
                    
                    rowData.append(Pixel(red: depth, green: depth, blue: depth))
                } else {
                    rowData.append(Pixel.black)
                }
            }
            
            data.append(rowData)
        }
        
        return data
    }
    
    func getData4Normal(w width: Int, h height: Int) -> [[Pixel]] {
        var data = [[Pixel]]()
        
        let sphere = Sphere(center: Vec3(x: 0, y: 10, z: -10), radius: 10)
        let camera = PerspectiveCamera(eye: Vec3(x: 0, y: 10, z: 10),
                                       front: Vec3(x: 0, y: 0, z: -1),
                                       up: Vec3(x: 0, y: 1, z: 0),
                                       fov: 90)
        
        for y in 0 ..< height {
            var rowData = [Pixel]()
            
            let sy = Float(y) / Float(height)
            
            for x in 0 ..< width {
                let sx = Float(x) / Float(width)
                
                let ray = camera.generateRay(x: sx, y: sy)
                
                if let rs = sphere.intersect(ray: ray) {
                    rowData.append(Pixel(red: min(Int(rs.normal.x * 128 + 128), 255),
                                         green: min(Int(rs.normal.y * 128 + 128), 255),
                                         blue: min(Int(rs.normal.z * 128 + 128), 255)))
                } else {
                    rowData.append(Pixel.black)
                }
            }
            
            data.append(rowData)
        }
        
        return data
    }
    
    func dataToImage(data: [[Pixel]]) -> NSImage {
        let w = data[0].count
        let h = data.count
        
        var pixels = [Pixel]()
        
        for i in 0 ..< w*h {
            let x = i % w
            let y = i / w
            
            pixels.append(data[y][x])
        }
        
        let bitsPerComponent = 8
        let bitsPerPixel = 32
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        let providerRef = CGDataProvider.init(data: NSData(bytes: pixels,
                                                           length:pixels.count * sizeof(Pixel.self)))
        
        let cgImage = CGImage.init(width: w,
                                   height: h,
                                   bitsPerComponent: bitsPerComponent,
                                   bitsPerPixel: bitsPerPixel,
                                   bytesPerRow: w*sizeof(Pixel.self),
                                   space: rgbColorSpace,
                                   bitmapInfo: bitmapInfo,
                                   provider: providerRef!,
                                   decode: nil,
                                   shouldInterpolate: true,
                                   intent: CGColorRenderingIntent.defaultIntent)
        
        let ciImage = CIImage(cgImage: cgImage!)
        let rep = NSCIImageRep(ciImage: ciImage)
        
        let image = NSImage(size: ciImage.extent.size)
        image.addRepresentation(rep)
        
        return image
    }
}
