#if canImport(CoreGraphics)

import CoreGraphics

public extension CGFloat {
    
    /// degrees to radians
    @inlinable var toRadians: CGFloat {
        return self * .pi / 180
    }
    
    /// radians to degrees
    @inlinable var toDegrees: CGFloat {
        return self * 180 / .pi
    }
}

#endif // canImport(CoreGraphics)
