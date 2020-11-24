import Foundation
import CoreFoundation

// MARK: NSBridged

public protocol _CFTollFreeBridgingNSType: CFType {
    static var bridgedNSType: NSObject.Type { get }
}

public protocol CFTollFreeBridgingNSType: _CFTollFreeBridgingNSType {
    associatedtype BridgedNSType
}

public extension CFTollFreeBridgingNSType {
    
    @inlinable static var bridgedNSType: NSObject.Type {
        return BridgedNSType.self as! NSObject.Type
    }
    
    @inlinable static func from(_ v: BridgedNSType) -> Self {
        #if canImport(Darwin)
        return v as! Self
        #else
        return unsafeBitCast(v, to: Self.self)
        #endif
    }
    
    @inlinable var asNS: BridgedNSType {
        #if canImport(Darwin)
        return self as! BridgedNSType
        #else
        return unsafeBitCast(self, to: BridgedNSType.self)
        #endif
    }
}

// MARK: SwiftBridged

public protocol _CFTollFreeBridgingSwiftType: CFType {
    #if canImport(Darwin)
    static var bridgedSwiftType: Any.Type { get }
    #endif
}

public protocol CFTollFreeBridgingSwiftType: _CFTollFreeBridgingSwiftType {
    associatedtype BridgedSwiftType
}

public extension CFTollFreeBridgingSwiftType where BridgedSwiftType: ReferenceConvertible {
    typealias BridgedNSType = BridgedSwiftType.ReferenceType
}

#if canImport(Darwin)

public extension CFTollFreeBridgingSwiftType {
    
    @inlinable static var bridgedSwiftType: Any.Type {
        return BridgedSwiftType.self
    }
    
    @inlinable static func from(_ v: BridgedSwiftType) -> Self {
        return v as! Self
    }
    
    @inlinable var asSwift: BridgedSwiftType {
        return self as! BridgedSwiftType
    }
}

public extension CFTollFreeBridgingSwiftType where Self: CFMutableType {
    
    // FIXME: Cannot make it unavailable or obsoleted
    @available(*, deprecated, message: "Cast CoreFoundation mutable type from bridged Swift type is not supported. Use `copyFrom(:)` instead.", renamed: "copyFrom(_:)")
    @inlinable static func from(_ v: BridgedSwiftType) -> Self {
        fatalError("Cast CoreFoundation mutable type '\(self)' from bridged Swift type '\(BridgedSwiftType.self)' is not supported. Use `copyFrom(:)` instead.")
    }
}

public extension CFTollFreeBridgingSwiftType where Self: CFMutableTypeWithImmutablePair , ImmutableType: CFMutableCopying {
    
    @inlinable static func copyFrom(_ v: BridgedSwiftType) -> Self {
        return (v as! ImmutableType).mutableCopy() as! Self
    }
}

#endif

// MARK: BridgedMutable

public typealias _CFTollFreeBridgingMutableType = _CFMutableCopying & _CFTollFreeBridgingNSType

public typealias CFTollFreeBridgingMutableType = CFMutableType & CFTollFreeBridgingNSType

// MARK: - Conformance

extension CFArray: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedNSType = NSArray
    public typealias BridgedSwiftType = Array<Any>
}

extension CFAttributedString: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSAttributedString
}

extension CFBoolean: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedNSType = NSNumber
    public typealias BridgedSwiftType = Bool
}

extension CFBundle: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = Bundle
}

extension CFCalendar: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = Calendar
}

extension CFCharacterSet: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = CharacterSet
}

extension CFData: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = Data
}

extension CFDate: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = Date
}

extension CFDateFormatter: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = DateFormatter
}

extension CFDictionary: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedNSType = NSDictionary
    public typealias BridgedSwiftType = Dictionary<AnyHashable, Any>
}

extension CFError: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSError
}

extension CFLocale: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = Locale
}

extension CFMutableArray {
    public typealias BridgedNSType = NSMutableArray
}

extension CFMutableAttributedString {
    public typealias BridgedNSType = NSMutableAttributedString
}

extension CFMutableCharacterSet {
    public typealias BridgedNSType = NSMutableCharacterSet
}

extension CFMutableData {
    public typealias BridgedNSType = NSMutableData
}

extension CFMutableDictionary {
    public typealias BridgedNSType = NSMutableDictionary
}

extension CFMutableSet {
    public typealias BridgedNSType = NSMutableSet
}

extension CFMutableString {
    public typealias BridgedNSType = NSMutableString
}

extension CFNull: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSNull
}

extension CFNumber: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSNumber
}

extension CFReadStream: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = InputStream
}

extension CFRunLoopTimer: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = Timer
}

extension CFSet: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSSet
}

extension CFString: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedNSType = NSString
    public typealias BridgedSwiftType = String
}

extension CFTimeZone: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = TimeZone
}

extension CFURL: CFTollFreeBridgingNSType, CFTollFreeBridgingSwiftType {
    public typealias BridgedSwiftType = URL
}

// Not Toll Free Bridged
// extension CFUUID: CFType {}

extension CFWriteStream: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = OutputStream
}
