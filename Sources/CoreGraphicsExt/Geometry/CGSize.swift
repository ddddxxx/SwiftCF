import Foundation

public extension CGSize {
    
    @inlinable var area: CGFloat {
        return width * height
    }
    
    @inlinable var aspectRatio: CGFloat {
        guard height != 0 else { return 0 }
        return width / height
    }
    
    @inlinable func aspectFit(to size: CGSize) -> CGSize {
        let xScale = size.width / width
        let yScale = size.height / height
        return self * min(xScale, yScale)
    }
    
    @inlinable func aspectFill(to size: CGSize) -> CGSize {
        let xScale = size.width / width
        let yScale = size.height / height
        return self * max(xScale, yScale)
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
}
