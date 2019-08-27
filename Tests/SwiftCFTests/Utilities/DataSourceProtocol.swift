import SwiftCF

protocol CFTypeTestDataSource: CFType {
    static var testValue: Any { get }
}

protocol CFTollFreeBridgingNSTestDataSource: CFTypeTestDataSource {
    static var testBridgedNSValue: Any { get }
}

protocol CFTollFreeBridgingSwiftTestDataSource: CFTypeTestDataSource {
    static var testBridgedSwiftValue: Any { get }
}

extension CFTypeTestDataSource {
    
    static var testValueTyped: Self {
        return cast(testValue)!
    }
}

extension CFTollFreeBridgingNSTestDataSource where Self: CFTollFreeBridgingNSType {
    
    static var testBridgedNSValue: Any {
        return testBridgedNSValueTyped
    }
    
    static var testBridgedNSValueTyped: BridgedNSType {
        return testValue as! BridgedNSType
    }
}

extension CFTollFreeBridgingSwiftTestDataSource where Self: CFTollFreeBridgingSwiftType {
    
    static var testBridgedSwiftValue: Any {
        return testBridgedSwiftValueTyped
    }
    
    static var testBridgedSwiftValueTyped: BridgedSwiftType {
        return testValue as! BridgedSwiftType
    }
}
