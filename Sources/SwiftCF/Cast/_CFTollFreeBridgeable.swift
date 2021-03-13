import Foundation
import CoreFoundation

// MARK: CFTollFreeBridgeable

public protocol _CFTollFreeBridgeable: CFType {
    associatedtype BridgedNSType where BridgedNSType: NSObject
}

public extension _CFTollFreeBridgeable {
    
    @inlinable
    static func _bridgeFromNS(_ source: BridgedNSType) -> Self {
        return unsafeDowncast(source, to: Self.self)
    }
    
    @inlinable
    func _bridgeToNS() -> BridgedNSType {
        return unsafeDowncast(self, to: BridgedNSType.self)
    }
}

// MARK: - Conformance

extension CFArray: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSArray
}

extension CFAttributedString: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSAttributedString
}

extension CFBoolean: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSNumber
}

extension CFBundle: _CFTollFreeBridgeable {
    public typealias BridgedNSType = Bundle
}

extension CFCalendar: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSCalendar
}

extension CFCharacterSet: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSCharacterSet
}

extension CFData: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSData
}

extension CFDate: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSDate
}

extension CFDateFormatter: _CFTollFreeBridgeable {
    public typealias BridgedNSType = DateFormatter
}

extension CFDictionary: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSDictionary
}

extension CFError: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSError
}

extension CFLocale: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSLocale
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

extension CFNull: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSNull
}

extension CFNumber: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSNumber
}

extension CFReadStream: _CFTollFreeBridgeable {
    public typealias BridgedNSType = InputStream
}

extension CFRunLoopTimer: _CFTollFreeBridgeable {
    public typealias BridgedNSType = Timer
}

extension CFSet: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSSet
}

extension CFString: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSString
}

extension CFTimeZone: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSTimeZone
}

extension CFURL: _CFTollFreeBridgeable {
    public typealias BridgedNSType = NSURL
}

// Not Toll Free Bridged
// extension CFUUID: CFType {}

extension CFWriteStream: _CFTollFreeBridgeable {
    public typealias BridgedNSType = OutputStream
}
