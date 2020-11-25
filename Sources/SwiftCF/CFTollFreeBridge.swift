import Foundation
import CoreFoundation

// MARK: CFTollFreeBridging

public protocol CFTollFreeBridging: CFType {
    associatedtype BridgedNSType where BridgedNSType: NSObject
}

public extension CFTollFreeBridging {
    
    @inlinable static func from(_ v: BridgedNSType) -> Self {
        return unsafeDowncast(v, to: Self.self)
    }
    
    @inlinable var asNS: BridgedNSType {
        return unsafeDowncast(self, to: BridgedNSType.self)
    }
}

// MARK: BridgedMutable

public typealias CFTollFreeBridgingMutableType = CFMutableType & CFTollFreeBridging

// MARK: - Conformance

extension CFArray: CFTollFreeBridging {
    public typealias BridgedNSType = NSArray
}

extension CFAttributedString: CFTollFreeBridging {
    public typealias BridgedNSType = NSAttributedString
}

extension CFBoolean: CFTollFreeBridging {
    public typealias BridgedNSType = NSNumber
}

extension CFBundle: CFTollFreeBridging {
    public typealias BridgedNSType = Bundle
}

extension CFCalendar: CFTollFreeBridging {
    public typealias BridgedNSType = NSCalendar
}

extension CFCharacterSet: CFTollFreeBridging {
    public typealias BridgedNSType = NSCharacterSet
}

extension CFData: CFTollFreeBridging {
    public typealias BridgedNSType = NSData
}

extension CFDate: CFTollFreeBridging {
    public typealias BridgedNSType = NSDate
}

extension CFDateFormatter: CFTollFreeBridging {
    public typealias BridgedNSType = DateFormatter
}

extension CFDictionary: CFTollFreeBridging {
    public typealias BridgedNSType = NSDictionary
}

extension CFError: CFTollFreeBridging {
    public typealias BridgedNSType = NSError
}

extension CFLocale: CFTollFreeBridging {
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

extension CFNull: CFTollFreeBridging {
    public typealias BridgedNSType = NSNull
}

extension CFNumber: CFTollFreeBridging {
    public typealias BridgedNSType = NSNumber
}

extension CFReadStream: CFTollFreeBridging {
    public typealias BridgedNSType = InputStream
}

extension CFRunLoopTimer: CFTollFreeBridging {
    public typealias BridgedNSType = Timer
}

extension CFSet: CFTollFreeBridging {
    public typealias BridgedNSType = NSSet
}

extension CFString: CFTollFreeBridging {
    public typealias BridgedNSType = NSString
}

extension CFTimeZone: CFTollFreeBridging {
    public typealias BridgedNSType = NSTimeZone
}

extension CFURL: CFTollFreeBridging {
    public typealias BridgedNSType = NSURL
}

// Not Toll Free Bridged
// extension CFUUID: CFType {}

extension CFWriteStream: CFTollFreeBridging {
    public typealias BridgedNSType = OutputStream
}
