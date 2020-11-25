import Foundation
import CoreFoundation

public protocol CFStringKey: RawRepresentable, ReferenceConvertible, ExpressibleByStringLiteral where RawValue == CFString, ReferenceType == NSString {
    init(_ key: CFString)
}

public extension CFStringKey {
    
    init(rawValue: CFString) {
        self.init(rawValue)
    }
    
    init(stringLiteral value: String) {
        self.init(value._bridgeToCoreFoundation())
    }
    
    var description: String {
        return String._bridgeFromCoreFoundation(rawValue)
    }
    
    var debugDescription: String {
        return description
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue.cfEqual(to: rhs.rawValue)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue.cfHash)
    }
    
    func _bridgeToObjectiveC() -> NSString {
        return rawValue._bridgeToNS()
    }
    
    static func _forceBridgeFromObjectiveC(_ source: NSString, result: inout Self?) {
        result = Self(CFString._bridgeFromNS(source))
    }
    
    static func _conditionallyBridgeFromObjectiveC(_ source: NSString, result: inout Self?) -> Bool {
        _forceBridgeFromObjectiveC(source, result: &result)
        return true
    }
    
    static func _unconditionallyBridgeFromObjectiveC(_ source: NSString?) -> Self {
        var result: Self?
        _forceBridgeFromObjectiveC(source!, result: &result)
        return result!
    }
}

// MARK: -

@inlinable func _bridge<T: CFStringKey>(_ v: [T]) -> CFArray {
    #if canImport(Darwin)
    return v as CFArray
    #else
    return v.map { $0.rawValue }._bridgeToCoreFoundation()
    #endif
}

@inlinable func _bridge<T: CFStringKey>(_ v: [T: Any]) -> CFDictionary {
    let keys: [NSString] = v.keys.map { $0._bridgeToObjectiveC() }
    let values = v.values.map { ($0 as? __CoreFoundationBridgeable)?.__bridgeToCoreFoundation() ?? $0 }
    let nsObject = NSDictionary(objects: values, forKeys: keys)
    return CFDictionary._bridgeFromNS(nsObject)
}

@inlinable func _bridge<T: CFStringKey>(_ v: CFArray) -> [T] {
    #if canImport(Darwin)
    return v as! [T]
    #else
    return v._bridgeToNS().map { T($0 as! CFString) }
    #endif
}

@inlinable func _bridge<T: CFStringKey>(_ v: CFDictionary) -> [T: Any] {
    #if canImport(Darwin)
    return v as! [T: Any]
    #else
    var result: [T: Any] = [:]
    v._bridgeToNS().enumerateKeysAndObjects(options: []) { key, value, stop in
        let k = key as! NSString
        result[T._unconditionallyBridgeFromObjectiveC(k)] = value
    }
    return result
    #endif
}
