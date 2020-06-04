#if canImport(QuartzCore)

import QuartzCore

public extension CATransform3D {
    
    @inlinable var cameraDistance: CGFloat {
        get {
            return -1 / m34
        }
        set {
            m34 = -1 / newValue
        }
    }
    
    // MARK: create
    
    @inlinable init() {
        self = .identity
    }
    
    @inlinable static func translation(x tx: CGFloat = 0, y ty: CGFloat = 0, z tz: CGFloat = 0) -> CATransform3D {
        return CATransform3DMakeTranslation(tx, ty, tz)
    }
    
    @inlinable static func scale(x sx: CGFloat = 1, y sy: CGFloat = 1, z sz: CGFloat = 1) -> CATransform3D {
        return CATransform3DMakeScale(sx, sy, sz)
    }
    
    @inlinable static func rotation(angle: CGFloat, x: CGFloat = 0, y: CGFloat = 0, z: CGFloat = 0) -> CATransform3D {
        return CATransform3DMakeRotation(angle, x, y, z)
    }
    
    @inlinable static var identity: CATransform3D {
        return CATransform3DIdentity
    }
    
    // MARK: affine
    
    @inlinable init(_ affineTransform: CGAffineTransform) {
        self = CATransform3DMakeAffineTransform(affineTransform)
    }
    
    @inlinable var isAffine: Bool {
        return CATransform3DIsAffine(self)
    }
    
    @inlinable var affineTransform: CGAffineTransform {
        return CATransform3DGetAffineTransform(self)
    }
    
    // MARK: transform
    
    @inlinable var inverse: CATransform3D {
        return CATransform3DInvert(self)
    }
    
    @inlinable func translatedBy(x tx: CGFloat = 0, y ty: CGFloat = 0, z tz: CGFloat = 0) -> CATransform3D {
        return CATransform3DTranslate(self, tx, ty, tz)
    }
    
    @inlinable func scaledBy(x sx: CGFloat = 1, y sy: CGFloat = 1, z sz: CGFloat = 1) -> CATransform3D {
        return CATransform3DScale(self, sx, sy, sz)
    }
    
    @inlinable func rotatedBy(angle: CGFloat, x: CGFloat = 0, y: CGFloat = 0, z: CGFloat = 0) -> CATransform3D {
        return CATransform3DRotate(self, angle, x, y, z)
    }
    
    @inlinable func transformed(by t2: CATransform3D) -> CATransform3D {
        return CATransform3DConcat(t2, self)
    }
    
    @inlinable func concatenating(_ t2: CATransform3D) -> CATransform3D {
        return CATransform3DConcat(self, t2)
    }
    
    // MARK: mutate
    
    @inlinable mutating func invert() {
        self = inverse
    }
    
    @inlinable mutating func scaleBy(x sx: CGFloat = 1, y sy: CGFloat = 1, z sz: CGFloat = 1) {
        self = scaledBy(x: sx, y: sy, z: sz)
    }
    
    @inlinable mutating func rotateBy(angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) {
        self = rotatedBy(angle: angle, x: x, y: y, z: z)
    }
    
    @inlinable mutating func transforme(by t2: CATransform3D) {
        self = transformed(by: t2)
    }
    
    @inlinable mutating func translateBy(x tx: CGFloat = 0, y ty: CGFloat = 0, z tz: CGFloat = 0) {
        self = translatedBy(x: tx, y: ty, z: tz)
    }
    
    @inlinable mutating func concat(_ t2: CATransform3D) {
        self = concatenating(t2)
    }
    
    // MARK: operator
    
    @inlinable static func *(lhs: CATransform3D, rhs: CATransform3D) -> CATransform3D {
        return lhs.concatenating(rhs)
    }
    
    @inlinable static func *=(lhs: inout CATransform3D, rhs: CATransform3D) {
        lhs = lhs * rhs
    }
    
    @inlinable static func /(lhs: CATransform3D, rhs: CATransform3D) -> CATransform3D {
        return lhs.concatenating(rhs.inverse)
    }
    
    @inlinable static func /=(lhs: inout CATransform3D, rhs: CATransform3D) {
        lhs = lhs / rhs
    }
}

extension CATransform3D: Equatable {
    
    @inlinable public static func == (lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        return CATransform3DEqualToTransform(lhs, rhs)
    }
}

#endif // canImport(QuartzCore)
