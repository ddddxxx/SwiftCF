import Foundation
import CoreFoundation

public protocol CFStringKey: RawRepresentable, ReferenceConvertible, ExpressibleByStringLiteral, _CFConvertible where RawValue == CFString, ReferenceType == NSString, _CFType == CFString {
    init(_ key: CFString)
}

public extension CFStringKey {
    
    init(rawValue: CFString) {
        self.init(rawValue)
    }
    
    init(stringLiteral value: String) {
        self.init(.from(value))
    }
    
    var description: String {
        return String._bridgeFromCF(rawValue)
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
    
    func _bridgeToCF() -> CFString {
        return rawValue
    }
    
    static func _bridgeFromCF(_ source: CFString) -> Self {
        return self.init(source)
    }
}
