import Foundation
import CoreFoundation

public protocol __CoreFoundationBridgeable {
    func __bridgeToCoreFoundation() -> Any
}

public protocol _CoreFoundationBridgeable: __CoreFoundationBridgeable, _ObjectiveCBridgeable {
    
    associatedtype BridgedCFType: CFType
    
    func _bridgeToCoreFoundation() -> BridgedCFType
    
    static func _bridgeFromCoreFoundation(_ source: BridgedCFType) -> Self
}

public extension _CoreFoundationBridgeable {
    func __bridgeToCoreFoundation() -> Any {
        return _bridgeToCoreFoundation()
    }
}

public extension _CoreFoundationBridgeable where BridgedCFType: CFTollFreeBridging, _ObjectiveCType == BridgedCFType.BridgedNSType {
    
    func _bridgeToCoreFoundation() -> BridgedCFType {
        return BridgedCFType._bridgeFromNS(_bridgeToObjectiveC())
    }
    
    static func _bridgeFromCoreFoundation(_ source: BridgedCFType) -> Self {
        return _unconditionallyBridgeFromObjectiveC(source._bridgeToNS())
    }
}

// MARK: -

extension Array: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFArray
}

extension Bool: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFBoolean
}

extension Calendar: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFCalendar
}

extension CharacterSet: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFCharacterSet
}

extension Data: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFData
}

extension Date: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFDate
}

extension Dictionary: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFDictionary
}

extension Locale: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFLocale
}

extension String: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFString
}

extension TimeZone: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFTimeZone
}

extension URL: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFURL
}

// MARK: CFNumber

extension FixedWidthInteger where Self: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFNumber
}

extension FloatingPoint where Self: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFNumber
}

extension Int: _CoreFoundationBridgeable {}
extension Int8: _CoreFoundationBridgeable {}
extension Int16: _CoreFoundationBridgeable {}
extension Int32: _CoreFoundationBridgeable {}
extension Int64: _CoreFoundationBridgeable {}
extension UInt: _CoreFoundationBridgeable {}
extension UInt8: _CoreFoundationBridgeable {}
extension UInt16: _CoreFoundationBridgeable {}
extension UInt32: _CoreFoundationBridgeable {}
extension UInt64: _CoreFoundationBridgeable {}

extension Float32: _CoreFoundationBridgeable {}
extension Float64: _CoreFoundationBridgeable {}
