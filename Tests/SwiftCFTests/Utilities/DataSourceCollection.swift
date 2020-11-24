#if canImport(Darwin)

import CoreFoundation
import SwiftCF

var allCFTypes: [CFType.Type] = {
    var allCFTypes: [CFType.Type] = [
        CFAllocator.self,
        CFArray.self,
        CFAttributedString.self,
        CFBag.self,
        CFBinaryHeap.self,
        CFBitVector.self,
        CFBoolean.self,
        CFBundle.self,
        CFCalendar.self,
        CFCharacterSet.self,
        CFData.self,
        CFDate.self,
        CFDateFormatter.self,
        CFDictionary.self,
        CFError.self,
        CFLocale.self,
        CFMessagePort.self,
        CFMutableArray.self,
        CFMutableAttributedString.self,
        CFMutableBag.self,
        CFMutableBitVector.self,
        CFMutableCharacterSet.self,
        CFMutableData.self,
        CFMutableDictionary.self,
        CFMutableSet.self,
        CFMutableString.self,
        CFNotificationCenter.self,
        CFNull.self,
        CFNumber.self,
        CFNumberFormatter.self,
        CFPlugIn.self,
        CFPlugInInstance.self,
        CFReadStream.self,
        CFRunLoop.self,
        CFRunLoopObserver.self,
        CFRunLoopSource.self,
        CFRunLoopTimer.self,
        CFSet.self,
        CFSocket.self,
        CFString.self,
        CFTimeZone.self,
        CFTree.self,
        CFURL.self,
        CFUUID.self,
        CFWriteStream.self,
    ]
    
    #if os(macOS)
    allCFTypes += [
        CFUserNotification.self,
    ]
    #endif

    #if canImport(Darwin)
    allCFTypes += [
        CFFileDescriptor.self,
        CFMachPort.self,
        CFStringTokenizer.self,
    ]
    #endif
    
    return allCFTypes
}()

enum CFTestData {
    
    static let dataSourceTypes: [CFTypeTestDataSource.Type] = allCFTypes.compactMap {
        $0 as? CFTypeTestDataSource.Type
    }
    
    static let dataSourceTypesExceptMutable: [CFTypeTestDataSource.Type] = dataSourceTypes.filter {
        !($0 is _CFMutableTypeWithImmutablePair.Type)
    }
    
    static let allValuesExceptMutable: [Any] = dataSourceTypes.flatMap { $0.allTestValues }
    
    static func valuesExceptMutableAnd(type: CFTypeTestDataSource.Type) -> [Any] {
        return dataSourceTypesExceptMutable.filter {
            $0 != type
        }.flatMap {
            $0.allTestValues
        }
    }
}

extension CFTypeTestDataSource {
    
    static var allTestValues: [Any] {
        var values = [testValue]
        if let type = self as? CFTollFreeBridgingNSTestDataSource.Type {
            values.append(type.testBridgedNSValue)
        }
        if let type = self as? CFTollFreeBridgingSwiftTestDataSource.Type {
            values.append(type.testBridgedSwiftValue)
        }
        return values
    }
}

#endif
