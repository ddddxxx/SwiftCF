import Foundation

public protocol CFStringKey: RawRepresentable, ReferenceConvertible, ExpressibleByStringLiteral where RawValue == CFString, ReferenceType == NSString, _ObjectiveCType == NSString {
    init(_ key: CFString)
}

public extension CFStringKey {
    
    init(rawValue: CFString) {
        self.init(rawValue)
    }
    
    init(stringLiteral value: String) {
        self.init(value as CFString)
    }
    
    var description: String {
        return rawValue as String
    }
    
    var debugDescription: String {
        return description
    }
    
    func _bridgeToObjectiveC() -> NSString {
        return rawValue as NSString
    }
    
    static func _forceBridgeFromObjectiveC(_ source: NSString, result: inout Self?) {
        result = .init(source as CFString)
    }
    
    static func _conditionallyBridgeFromObjectiveC(_ source: NSString, result: inout Self?) -> Bool {
        _forceBridgeFromObjectiveC(source, result: &result)
        return true
    }
    
    static func _unconditionallyBridgeFromObjectiveC(_ source: NSString?) -> Self {
        return .init(source! as CFString)
    }
}
