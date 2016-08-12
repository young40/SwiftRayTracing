import Foundation

public struct IntersectResult {
    var geometry :Sphere? = nil
    var distance : Float = 0.0
    var position = Vec3()
    var normal = Vec3()
}

public class Sphere {
    var center: Vec3
    var radius: Float
    
    public init(center :Vec3, radius :Float) {
        self.center = center
        self.radius = radius
    }
    
    public var sqrRadius :Float {
        get {
            return radius * radius
        }
    }
    
    public func intersect(ray :Ray) -> IntersectResult? {
        let v = ray.origin - center
        let a0 = v.sqrLength - sqrRadius
        let ddotV = ray.direction .* v
        
        if (ddotV <= 0) {
            let discr = ddotV * ddotV - a0
            if (discr >= 0)
            {
                var rs = IntersectResult()
                
                rs.geometry = self
                rs.distance = -ddotV - sqrt(discr)
                rs.position = ray.getPoint(t: rs.distance)
                rs.normal = (rs.position - self.center).normalize()
                
                return rs
            }
        }
        
        return nil
    }
}
