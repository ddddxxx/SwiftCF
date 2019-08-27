import Foundation
import SwiftCF

extension CFAllocator: CFTypeTestDataSource {
    static let testValue: Any = malloc
}

extension CFArray: CFTollFreeBridgingNSTestDataSource, CFTollFreeBridgingSwiftTestDataSource {
    static let testValue: Any = [1, 3.14, "foo"] as CFArray
}

extension CFBoolean: CFTollFreeBridgingNSTestDataSource, CFTollFreeBridgingSwiftTestDataSource {
    static let testValue: Any = CFBoolean.true
}

extension CFData: CFTollFreeBridgingNSTestDataSource, CFTollFreeBridgingSwiftTestDataSource {
    static let testValue: Any = "foo".data(using: .utf8)! as CFData
}

extension CFDictionary: CFTollFreeBridgingNSTestDataSource, CFTollFreeBridgingSwiftTestDataSource {
    static let testValue: Any = [1: "foo", "foo": true]
}

extension CFNumber: CFTollFreeBridgingNSTestDataSource {
    static let testValue: Any = 1 as CFNumber
}

extension CFString: CFTollFreeBridgingNSTestDataSource, CFTollFreeBridgingSwiftTestDataSource {
    static let testValue: Any = "foo" as CFString
}
