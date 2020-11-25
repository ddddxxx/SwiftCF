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
        self.init(.from(value._bridgeToObjectiveC()))
    }
    
    var description: String {
        return String._unconditionallyBridgeFromObjectiveC(rawValue.asNS)
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
        return rawValue.asNS
    }
    
    static func _forceBridgeFromObjectiveC(_ source: NSString, result: inout Self?) {
        result = Self(.from(source))
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

extension CFStringKey {
    
    @inlinable
    func asCF() -> CFString {
        return rawValue
    }
}

extension Dictionary where Key: CFStringKey {
    
    @inlinable
    func asCF() -> CFDictionary {
        #if canImport(Darwin)
        return self as CFDictionary
        #else
        let nsObject = NSDictionary(objects: Array(values), forKeys: Array(keys.map { $0.rawValue.asNS }))
        return .from(nsObject)
        #endif
    }
}

extension CFDictionary {
    
    @inlinable
    func asSwift<Key: CFStringKey>(keyType: Key.Type = Key.self) -> [Key: Any] {
        #if canImport(Darwin)
        return self as! [Key: Any]
        #else
        var result: [Key: Any] = [:]
        asNS.enumerateKeysAndObjects(options: []) { key, value, stop in
            let k = key as! CFString
            result[Key(k)] = value
        }
        return result
        #endif
    }
}

extension Array where Element: CFStringKey {
    
    @inlinable
    func asCF() -> CFArray {
        #if canImport(Darwin)
        return self as CFArray
        #else
        let nsObject = NSArray(array: self.map { $0.rawValue })
        return .from(nsObject)
        #endif
    }
}

extension CFArray {
    
    @inlinable
    func asSwift<Element: CFStringKey>(elementType: Element.Type = Element.self) -> [Element] {
        #if canImport(Darwin)
        return self as! [Element]
        #else
        return asNS.map { Element($0 as! CFString) }
        #endif
    }
}
