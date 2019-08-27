#if canImport(CoreGraphics)

import CoreGraphics

public extension CGSize {
    
    @inlinable var area: CGFloat {
        return width * height
    }
    
    @inlinable func aspectFit(to size: CGSize) -> CGSize {
        let xScale = size.width / width
        let yScale = size.height / height
        return self * min(xScale, yScale)
    }
    
    @inlinable var aspectFitSquare: CGSize {
        let minSide = min(width, height)
        return CGSize(width: minSide, height: minSide)
    }
    
    @inlinable func aspectFill(to size: CGSize) -> CGSize {
        let xScale = size.width / width
        let yScale = size.height / height
        return self * max(xScale, yScale)
    }
    
    @inlinable var aspectFillSquare: CGSize {
        let maxSide = max(width, height)
        return CGSize(width: maxSide, height: maxSide)
    }
    
    @inlinable static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    @inlinable static func +=(lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs + rhs
    }
    
    @inlinable static func -(lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    @inlinable static func -=(lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs - rhs
    }
    
    @inlinable static func *(size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
    
    @inlinable static func *=(size: inout CGSize, scalar: CGFloat) {
        size = size * scalar
    }
    
    @inlinable static func /(size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width / scalar, height: size.height / scalar)
    }
    
    @inlinable static func /=(size: inout CGSize, scalar: CGFloat) {
        size = size / scalar
    }
    
    @inlinable mutating func apply(t: CGAffineTransform) {
        self = applying(t)
    }
}

#endif // canImport(CoreGraphics)
