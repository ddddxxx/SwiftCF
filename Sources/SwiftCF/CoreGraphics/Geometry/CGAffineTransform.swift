#if canImport(CoreGraphics)

import CoreGraphics

public extension CGAffineTransform {
    
    // MARK: creat
    
    @inlinable init() {
        self = .identity
    }
    
    @inlinable static func translate(x: CGFloat = 0, y: CGFloat = 0) -> CGAffineTransform {
        return CGAffineTransform(translationX: x, y: y)
    }
    
    @inlinable static func scale(x: CGFloat = 1, y: CGFloat = 1) -> CGAffineTransform {
        return CGAffineTransform(scaleX: x, y: y)
    }
    
    @inlinable static func rotate(_ angle: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: angle)
    }
    
    @inlinable static func flip(height: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: height).scaledBy(x: 1, y: -1)
    }
    
    @inlinable static func swap() -> CGAffineTransform {
        return CGAffineTransform(scaleX: -1, y: 1).rotated(by: .pi / 2)
    }
    
    // MARK: mutate
    
    @inlinable func transformed(by t2: CGAffineTransform) -> CGAffineTransform {
        return t2.concatenating(self)
    }
    
    @inlinable mutating func invert() {
        self = inverted()
    }
    
    @inlinable mutating func transform(by t2: CGAffineTransform) {
        self = transformed(by: t2)
    }
    
    @inlinable mutating func translateBy(x: CGFloat = 0, y: CGFloat = 0) {
        self = translatedBy(x: x, y: y)
    }
    
    @inlinable mutating func scaleBy(x: CGFloat = 1, y: CGFloat = 1) {
        self = scaledBy(x: x, y: y)
    }
    
    @inlinable mutating func rotate(by angle: CGFloat) {
        self = rotated(by: angle)
    }
    
    // MARK: operator
    
    @inlinable static func *(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
        return lhs.concatenating(rhs)
    }
    
    @inlinable static func *=(lhs: inout CGAffineTransform, rhs: CGAffineTransform) {
        lhs = lhs * rhs
    }
    
    @inlinable static func /(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
        return lhs.concatenating(rhs.inverted())
    }
    
    @inlinable static func /=(lhs: inout CGAffineTransform, rhs: CGAffineTransform) {
        lhs = lhs / rhs
    }
}

public protocol CGAffineTransformApplying {
    func applying(_ t: CGAffineTransform) -> Self
}

extension CGPoint: CGAffineTransformApplying {}
extension CGSize: CGAffineTransformApplying {}
extension CGRect: CGAffineTransformApplying {}

public extension CGAffineTransformApplying {
    
    mutating func apply(t: CGAffineTransform) {
        self = applying(t)
    }
}

#endif // canImport(CoreGraphics)
