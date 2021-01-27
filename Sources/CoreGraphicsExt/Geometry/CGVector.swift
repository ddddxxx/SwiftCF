#if canImport(CoreGraphics)

import CoreGraphics

public extension CGVector {
    
    @inlinable init(_ point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
    @inlinable init(from: CGPoint, to: CGPoint) {
        self.init(dx: to.x - from.x, dy: to.y - from.y)
    }
    
    @inlinable init(angle: CGFloat, length: CGFloat = 1) {
        self.init(dx: cos(angle) * length, dy: sin(angle) * length)
    }
    
    @inlinable var length: CGFloat {
        get {
            return hypot(dx, dy)
        }
        set {
            guard self != .zero else { return }
            let scale = newValue / length
            dx *= scale
            dy *= scale
        }
    }
    
    /// in radians
    @inlinable var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    @inlinable static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    @inlinable static func +=(lhs: inout CGVector, rhs: CGVector) {
        lhs = lhs + rhs
    }
    
    @inlinable static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
    
    @inlinable static func -=(lhs: inout CGVector, rhs: CGVector) {
        lhs = lhs - rhs
    }
    
    @inlinable static func *(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    @inlinable static func *=(vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    @inlinable static func /(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    @inlinable static func /=(vector: inout CGVector, scalar: CGFloat) {
        vector = vector / scalar
    }
}

#endif // canImport(CoreGraphics)
