import Foundation
import CoreFoundation

// TODO: strip it from public API. currently required by `CFStringKey`.
public protocol __CoreFoundationBridgeable {
    func __bridgeToCoreFoundation() -> Any
    static func __bridgeFromCoreFoundation(_ source: Any) -> Self
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
    static func __bridgeFromCoreFoundation(_ source: Any) -> Self {
        guard let s = BridgedCFType.cast(source) else {
            preconditionFailure("failed to bridge \(source) to incompatible CoreFoundation type \(BridgedCFType.self)")
        }
        return _bridgeFromCoreFoundation(s)
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

// MARK: Container

extension Array: _CoreFoundationBridgeable {
    
    // Prevent Swift bridge value types to `_SwiftObject`.
    public func _bridgeToCoreFoundation() -> CFArray {
        let result = NSMutableArray(capacity: count)
        for element in self {
            result.add(_bridgeToCFIfNeeded(element))
        }
        return CFArray._bridgeFromNS(result)
    }
    
    // Linux need this to unwrap `CFStringKey`. `as!` is sufficient on Darwin.
    public static func _bridgeFromCoreFoundation(_ source: CFArray) -> Self {
        return source._bridgeToNS().map(_bridgeFromCFIfNeeded)
    }
}

extension Dictionary: _CoreFoundationBridgeable {
    
    // Prevent Swift bridge value types to _SwiftObject
    public func _bridgeToCoreFoundation() -> CFDictionary {
        let result = NSMutableDictionary(capacity: count)
        for (k, v) in self {
            let key = _bridgeToCFIfNeeded(k)
            let value = _bridgeToCFIfNeeded(v)
            if let key = key as? String {
                result.setValue(value, forKey: key)
            } else if let key = key as? NSCopying {
                result.setObject(value, forKey: key)
            } else {
                preconditionFailure("failed to convert to CFDictionary with invalid key \(k)")
            }
        }
        return CFDictionary._bridgeFromNS(result)
    }
    
    // Linux need this to unwrap `CFStringKey`. `as!` is sufficient on Darwin.
    public static func _bridgeFromCoreFoundation(_ source: CFDictionary) -> Self {
        var result = Self.init(minimumCapacity: source.count)
        source._bridgeToNS().enumerateKeysAndObjects { key, value, stop in
            result[_bridgeFromCFIfNeeded(key)] = _bridgeFromCFIfNeeded(value)
        }
        return result
    }
}

// MARK: - Value

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

extension Locale: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFLocale
}

extension String: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFString
}

#if canImport(Darwin)
extension TimeZone: _CoreFoundationBridgeable {
    public typealias BridgedCFType = CFTimeZone
}
#endif

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

// MARK: -

private func _bridgeToCFIfNeeded<T>(_ v: T) -> Any {
    if let bridgeable = v as? __CoreFoundationBridgeable {
        return bridgeable.__bridgeToCoreFoundation()
    } else {
        return v
    }
}

private func _bridgeFromCFIfNeeded<T>(_ v: Any) -> T {
    if let t = T.self as? __CoreFoundationBridgeable.Type {
        return t.__bridgeFromCoreFoundation(v) as! T
    } else {
        return v as! T
    }
}
