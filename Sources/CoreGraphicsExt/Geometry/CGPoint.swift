import Foundation

public extension CGPoint {
    
    @inlinable func distance(to point: CGPoint) -> CGFloat {
        return hypot(point.x - x, point.y - y)
    }
    
    @inlinable static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    @inlinable static func +=(lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    @inlinable static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    @inlinable static func -=(lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    @inlinable static func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    @inlinable static func *=(point: inout CGPoint, scalar: CGFloat) {
        point = point * scalar
    }
    
    @inlinable static func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / scalar, y: point.y / scalar)
    }
    
    @inlinable static func /=(point: inout CGPoint, scalar: CGFloat) {
        point = point / scalar
    }
}
#if canImport(CoreGraphics)

import CoreGraphics


public extension CGPoint {
    
    @inlinable init(_ vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    @inlinable static func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }
    
    @inlinable static func +=(lhs: inout CGPoint, rhs: CGVector) {
        lhs = lhs + rhs
    }
    
    @inlinable static func -(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }
    
    @inlinable static func -=(lhs: inout CGPoint, rhs: CGVector) {
        lhs = lhs - rhs
    }
}

#endif // canImport(CoreGraphics)
