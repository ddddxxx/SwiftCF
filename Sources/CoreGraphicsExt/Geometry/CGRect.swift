#if canImport(CoreGraphics)

import CoreGraphics

public extension CGRect {
    
    @inlinable init(minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        self.init(x: minX,
                  y: minY,
                  width: maxX - minX,
                  height: maxY - minY)
    }
    
    @inlinable init(center: CGPoint, size: CGSize) {
        self.init(x: center.x - size.width / 2,
                  y: center.y - size.height / 2,
                  width: size.width,
                  height: size.height)
    }
    
    @inlinable var area: CGFloat {
        return width * height
    }
    
    @inlinable var center: CGPoint {
        get {
            return CGPoint(x: midX, y: midY)
        }
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
    
    @inlinable func center(on edge: CGRectEdge) -> CGPoint {
        switch edge {
        case .maxXEdge: return CGPoint(x: maxX, y: midY)
        case .maxYEdge: return CGPoint(x: midX, y: maxY)
        case .minXEdge: return CGPoint(x: minX, y: midY)
        case .minYEdge: return CGPoint(x: midX, y: minY)
        }
    }
    
    @inlinable func offsetBy(dx: CGFloat = 0, dy: CGFloat = 0) -> CGRect {
        return CGRect(x: minX + dx, y: minY + dy, width: width, height: height)
    }
    
    @inlinable mutating func formOffsetBy(dx: CGFloat = 0, dy: CGFloat = 0) {
        self = offsetBy(dx: dx, dy: dy)
    }
    
    @inlinable func insetBy(x: CGFloat = 0, y: CGFloat = 0) -> CGRect {
        return insetBy(minX: x, minY: y, maxX: x, maxY: y)
    }
    
    @inlinable mutating func formInsetBy(x: CGFloat = 0, y: CGFloat = 0) {
        self = insetBy(x: x, y: y)
    }
    
    @inlinable func insetBy(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return CGRect(x: self.minX + minX,
                      y: self.minY + minY,
                      width: width - minX - maxX,
                      height: height - minY - maxY)
    }
    
    @inlinable mutating func formInsetBy(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = insetBy(minX: minX, minY: minY, maxX: maxX, maxY: maxY)
    }
    
    @inlinable func extendBy(x: CGFloat = 0, y: CGFloat = 0) -> CGRect {
        return insetBy(x: -x, y: -y)
    }
    
    @inlinable mutating func formExtendBy(x: CGFloat = 0, y: CGFloat = 0) {
        self = extendBy(x: x, y: y)
    }
    
    @inlinable func extendBy(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) -> CGRect {
        return insetBy(minX: -minX, minY: -minY, maxX: -maxX, maxY: -maxY)
    }
    
    @inlinable mutating func formExtendBy(minX: CGFloat = 0, minY: CGFloat = 0, maxX: CGFloat = 0, maxY: CGFloat = 0) {
        self = extendBy(minX: minX, minY: minY, maxX: maxX, maxY: maxY)
    }
}

#endif // canImport(CoreGraphics)
