import Foundation
import CoreFoundation

public protocol _CoreFoundationBridgeable: _ObjectiveCBridgeable {
    
    associatedtype BridgedCFType: CFType
    
    func _bridgeToCoreFoundation() -> BridgedCFType
    
    static func _bridgeFromCoreFoundation(_ source: BridgedCFType) -> Self
}

public extension _CoreFoundationBridgeable where BridgedCFType: CFTollFreeBridging, _ObjectiveCType == BridgedCFType.BridgedNSType {
    
    func _bridgeToCoreFoundation() -> BridgedCFType {
        return BridgedCFType.from(_bridgeToObjectiveC())
    }
    
    static func _bridgeFromCoreFoundation(_ source: BridgedCFType) -> Self {
        return _unconditionallyBridgeFromObjectiveC(source.asNS)
    }
}

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
