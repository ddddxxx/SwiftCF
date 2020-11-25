#if canImport(Darwin)

import CoreFoundation
import SwiftCF

extension CFAllocator: CFTypeTestDataSource {
    static let testValue: Any = malloc
}

extension CFArray: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = [1, 3.14, "foo"] as CFArray
}

extension CFBoolean: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = CFBoolean.true
}

extension CFData: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = "foo".data(using: .utf8)! as CFData
}

extension CFDictionary: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = [1: "foo", "foo": true] as CFDictionary
}

extension CFNumber: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = 1 as CFNumber
}

extension CFString: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = "foo" as CFString
}

#endif
