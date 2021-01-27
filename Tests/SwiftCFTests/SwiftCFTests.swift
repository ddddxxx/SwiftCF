import CoreFoundation
import XCTest
import SwiftCF

final class SwiftCFTests: XCTestCase {
    
    func testBridgeContainer() {
        let key = CFError.UserInfoKey.description
        let cfdict = [key: 42]._bridgeToCoreFoundation()
        let bridged = cfdict.value(key: key.rawValue)!
        XCTAssertNotNil(CFNumber.cast(bridged))
    }
    
    func testBridgeNestedContainer() throws {
        let key = CFError.UserInfoKey.description
        let cfarray = [[key: 42]]._bridgeToCoreFoundation()
        let cfdict = CFDictionary.cast(cfarray.value(at: 0))!
        let bridged = cfdict.value(key: key.rawValue)!
        XCTAssertNotNil(CFNumber.cast(bridged))
    }
    
    func testCFArrayCallBacks() {
        let arr = CFMutableArray.create()
        weak var weakObj: AnyObject?
        do {
            let data = CFData.create(bytes: nil, length: 0)
            arr.append(data)
            weakObj = data
        }
        XCTAssertNotNil(weakObj)
    }
}
