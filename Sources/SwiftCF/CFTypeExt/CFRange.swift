import Foundation
import CoreFoundation

public extension CFRange {
    
    static let zero = CFRange(location: 0, length: 0)
    
    @inlinable var asNS: NSRange {
        return NSRange(location: location, length: length)
    }
    
    @inlinable var asRange: Range<Int> {
        return location..<(location+length)
    }
}

public extension NSRange {
    
    @inlinable var asCF: CFRange {
        return CFRange(location: location, length: length)
    }
}

public extension RangeExpression where Bound: FixedWidthInteger {
    
    @inlinable var asCF: CFRange {
        let r = relative(to: 0..<Bound.max)
        return CFRange(location: numericCast(r.lowerBound), length: numericCast(r.count))
    }
}
