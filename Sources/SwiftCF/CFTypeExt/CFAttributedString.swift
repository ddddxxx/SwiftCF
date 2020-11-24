import Foundation
import CoreFoundation

public extension CFAttributedString {
    
    #if swift(>=5.1) || canImport(Darwin)
    typealias Key = NSAttributedString.Key
    #else
    typealias Key = NSAttributedStringKey
    #endif
    
    @inlinable var string: CFString {
        return CFAttributedStringGetString(self)
    }
    
    @inlinable var count: CFIndex {
        return CFAttributedStringGetLength(self)
    }
    
    @inlinable var fullRange: CFRange {
        return CFRange(location: 0, length: count)
    }
    
    @inlinable func attributes(loc: CFIndex) -> (attributes: [Key: Any], effectiveRange: CFRange) {
        var effectiveRange = CFRange()
        let attr = CFAttributedStringGetAttributes(self, loc, &effectiveRange)! as! [Key: Any]
        return (attr, effectiveRange)
    }
    
    #if canImport(Darwin)
    
    @inlinable static func create(allocator: CFAllocator = .default, string: CFString, attributes: [Key: Any] = [:]) -> CFAttributedString {
        return CFAttributedStringCreate(allocator, string, .from(attributes))
    }
    
    @inlinable func attribute(loc: CFIndex, name: Key) -> (attribute: CFTypeRef, effectiveRange: CFRange) {
        var effectiveRange = CFRange()
        let attr = CFAttributedStringGetAttribute(self, loc, .from(name.rawValue), &effectiveRange)!
        return (attr, effectiveRange)
    }
    
    #endif
}
