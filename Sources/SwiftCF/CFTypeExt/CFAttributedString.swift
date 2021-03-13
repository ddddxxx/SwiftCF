import Foundation
import CoreFoundation

public extension CFAttributedString {
    
    @inlinable static func create(allocator: CFAllocator = .default, string: CFString, attributes: [Key: Any] = [:]) -> CFAttributedString {
        return CFAttributedStringCreate(allocator, string, .from(attributes))
    }
    
    @inlinable func copy(allocator: CFAllocator = .default) -> CFAttributedString {
        return CFAttributedStringCreateCopy(allocator, self)
    }
    
    @inlinable func mutableCopy(allocator: CFAllocator = .default, capacity: CFIndex = 0) -> CFMutableAttributedString {
        return CFAttributedStringCreateMutableCopy(allocator, capacity, self)
    }
    
    @inlinable var string: CFString {
        return CFAttributedStringGetString(self)
    }
    
    @inlinable var count: CFIndex {
        return CFAttributedStringGetLength(self)
    }
    
    @inlinable var fullRange: CFRange {
        return CFRange(location: 0, length: count)
    }
    
    @inlinable func attributes(at loc: CFIndex) -> (attributes: [Key: Any], effectiveRange: CFRange) {
        var effectiveRange = CFRange()
        let attr: [Key: Any] = CFAttributedStringGetAttributes(self, loc, &effectiveRange)?.asSwift() ?? [:]
        return (attr, effectiveRange)
    }
    
    @inlinable func attribute(at loc: CFIndex, name: Key) -> (attribute: CFTypeRef, effectiveRange: CFRange) {
        var effectiveRange = CFRange()
        let attr = CFAttributedStringGetAttribute(self, loc, name.rawValue, &effectiveRange)!
        return (attr, effectiveRange)
    }
}
