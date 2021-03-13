import Foundation
import CoreFoundation

/// _CFConvertible without associatedtype
public protocol __CFConvertible {
    
    func __bridgeToCF() -> CFTypeRef
    
    static func __bridgeFromCF(_ source: CFTypeRef) -> Self
}

// TODO: strip it from public API. currently required by `CFStringKey`.
public protocol _CFConvertible: __CFConvertible, _ObjectiveCBridgeable {
    
    associatedtype _CFType: CFType
    
    func _bridgeToCF() -> _CFType
    
    static func _bridgeFromCF(_ source: _CFType) -> Self
}

public extension _CFConvertible {
    
    func __bridgeToCF() -> CFTypeRef {
        return _bridgeToCF()
    }
    
    static func __bridgeFromCF(_ source: CFTypeRef) -> Self {
        guard let s = _CFType.cast(source) else {
            preconditionFailure("failed to bridge \(source) to incompatible CoreFoundation type \(_CFType.self)")
        }
        return _bridgeFromCF(s)
    }
}

public extension _CFConvertible where _CFType: _CFTollFreeBridgeable, _ObjectiveCType == _CFType.BridgedNSType {
    
    func _bridgeToCF() -> _CFType {
        return _CFType._bridgeFromNS(_bridgeToObjectiveC())
    }
    
    static func _bridgeFromCF(_ source: _CFType) -> Self {
        return _unconditionallyBridgeFromObjectiveC(source._bridgeToNS())
    }
}

// MARK: Container

extension Array: _CFConvertible {
    
    // Prevent Swift bridge value types to `_SwiftObject`.
    public func _bridgeToCF() -> CFArray {
        return CFArray._bridgeFromNS(map(_bridgeToCFIfNeeded)._bridgeToObjectiveC())
    }
    
    public static func _bridgeFromCF(_ source: CFArray) -> [Element] {
        #if canImport(Darwin)
        return source as! [Element]
        #else
        return source._bridgeToNS().map(_bridgeFromCFIfNeeded)
        #endif
    }
}

extension Dictionary: _CFConvertible {
    
    // Prevent Swift bridge value types to _SwiftObject
    public func _bridgeToCF() -> CFDictionary {
        return CFDictionary._bridgeFromNS(mapValues(_bridgeToCFIfNeeded)._bridgeToObjectiveC())
    }
    
    public static func _bridgeFromCF(_ source: CFDictionary) -> [Key: Value] {
        #if canImport(Darwin)
        return source as! [Key: Value]
        #else
        var result = [Key: Value](minimumCapacity: source.count)
        source._bridgeToNS().enumerateKeysAndObjects { key, value, stop in
            result[_bridgeFromCFIfNeeded(key)] = _bridgeFromCFIfNeeded(value)
        }
        return result
        #endif
    }
}

// MARK: - Value

extension Bool: _CFConvertible {
    public typealias _CFType = CFBoolean
}

extension Calendar: _CFConvertible {
    public typealias _CFType = CFCalendar
}

extension CharacterSet: _CFConvertible {
    public typealias _CFType = CFCharacterSet
}

extension Data: _CFConvertible {
    public typealias _CFType = CFData
}

extension Date: _CFConvertible {
    public typealias _CFType = CFDate
}

extension Locale: _CFConvertible {
    public typealias _CFType = CFLocale
}

extension String: _CFConvertible {
    public typealias _CFType = CFString
}

#if canImport(Darwin)
extension TimeZone: _CFConvertible {
    public typealias _CFType = CFTimeZone
}
#endif

extension URL: _CFConvertible {
    public typealias _CFType = CFURL
}

// MARK: CFNumber

extension FixedWidthInteger where Self: _CFConvertible {
    public typealias _CFType = CFNumber
}

extension FloatingPoint where Self: _CFConvertible {
    public typealias _CFType = CFNumber
}

extension Int: _CFConvertible {}
extension Int8: _CFConvertible {}
extension Int16: _CFConvertible {}
extension Int32: _CFConvertible {}
extension Int64: _CFConvertible {}
extension UInt: _CFConvertible {}
extension UInt8: _CFConvertible {}
extension UInt16: _CFConvertible {}
extension UInt32: _CFConvertible {}
extension UInt64: _CFConvertible {}

extension Float32: _CFConvertible {}
extension Float64: _CFConvertible {}

// MARK: - Helper

private func _bridgeToCFIfNeeded<T>(_ v: T) -> Any {
    if let bridgeable = v as? __CFConvertible {
        return bridgeable.__bridgeToCF()
    } else {
        return v
    }
}

private func _bridgeFromCFIfNeeded<T>(_ v: Any) -> T {
    if let t = T.self as? __CFConvertible.Type {
        return t.__bridgeFromCF(v as CFTypeRef) as! T
    } else {
        return v as! T
    }
}
