import Foundation
import CoreFoundation

extension CFType {
    
    public static func from<T: _CFConvertible>(_ v: T) -> Self where T._CFType == Self {
        return v._bridgeToCF()
    }
}

extension _CFTollFreeBridgeable {
    
    public static func from(_ v: BridgedNSType) -> Self {
        return ._bridgeFromNS(v)
    }
}

extension CFType {
    
    public func asSwift<T: _CFConvertible>() -> T where T._CFType == Self {
        return T._bridgeFromCF(self)
    }
}

extension _CFTollFreeBridgeable {
    
    public func asNS() -> BridgedNSType {
        return _bridgeToNS()
    }
}
