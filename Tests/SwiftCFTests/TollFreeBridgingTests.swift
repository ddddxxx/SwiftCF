import CoreFoundation
import XCTest
import SwiftCF

final class TollFreeBridgingTests: XCTestCase {
    
    func testCast() {
        let num = CFNumber._bridgeFromNS(NSNumber(value: 42))
        XCTAssertNotNil(CFNumber.cast(num as Any))
        XCTAssertNil(CFString.cast(num as Any))
    }
    
    func testCastMutable() {
        let str = CFString._bridgeFromNS(NSString(string: "foo"))
        let mutable = str.mutableCopy()
        XCTAssertNotNil(CFString.cast(str as Any))
        XCTAssertNotNil(CFString.cast(mutable as Any))
        XCTAssertNotNil(CFMutableString.cast(mutable as Any))
        // FIXME: cast mutable bridgeable type
//        XCTAssertNil(cfCast(str as Any, to: CFMutableString.self))
    }
}
