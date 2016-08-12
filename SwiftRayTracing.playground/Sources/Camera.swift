import Foundation

public class PerspectiveCamera {
    var eye: Vec3
    var front: Vec3
    var up: Vec3
    
    var fov: Float
    
    public init(eye: Vec3, front: Vec3, up: Vec3, fov: Float) {
        self.eye = eye
        self.front = front
        self.up = up
        self.fov = fov
    }
    
    var right: Vec3 {
        get {
            return front ** up
        }
    }
    
    var fovScale: Float {
        get {
            return tan(fov * 0.5 * Float.pi / 180) * 2
        }
    }
    
    public func generateRay(x: Float, y: Float) -> Ray {
        let r = right * (x - 0.5) * fovScale
        let u = up * (y - 0.5) * fovScale
        
        return Ray(origin: eye, direction: front + r + u)
    }
}
