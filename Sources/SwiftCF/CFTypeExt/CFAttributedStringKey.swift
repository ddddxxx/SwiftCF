import Foundation
import CoreFoundation

#if !canImport(Darwin) && swift(<5.1)
public extension NSAttributedString {
    typealias Key = NSAttributedStringKey
}
#endif

extension CFAttributedString {
    
    public struct Key: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CFAttributedString.Key {
    
    func ns(_ key: NSAttributedString.Key) -> CFAttributedString.Key {
        return .init(key.rawValue._bridgeToCoreFoundation())
    }
}
