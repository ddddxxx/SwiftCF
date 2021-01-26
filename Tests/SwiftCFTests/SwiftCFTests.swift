import CoreFoundation
import XCTest
import SwiftCF

final class SwiftCFTests: XCTestCase {
    
    #if canImport(Darwin)
    
    func testTypeCasting() {
        for type in CFTestData.dataSourceTypesExceptMutable {
            for value in type.allTestValues {
                let model = type.cast(type.testValue)!
                let typed = type.cast(value)
                XCTAssertNotNil(typed)
                XCTAssert(typed!.cfEqual(to: model))
            }
            for value in CFTestData.valuesExceptMutableAnd(type: type) {
                XCTAssertNil(type.cast(value))
            }
        }
    }
    
    func testCollectionProtocolConformance() {
        let arr = [1, 3.14, "foo"] as CFArray
        for _ in arr {
            
        }
    }
    
    #endif
    
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
    
    static var allTests = [
        ("testCFArrayCallBacks", testCFArrayCallBacks),
        ("testBridgeContainer", testBridgeContainer),
        ("testBridgeNestedContainer", testBridgeNestedContainer),
    ]
}
