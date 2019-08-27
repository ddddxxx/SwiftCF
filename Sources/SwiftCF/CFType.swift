import CoreFoundation

public protocol CFType: AnyObject {
    static var typeID: CFTypeID { get }
}

// MARK: - Conformance

extension CFAllocator: CFType {
    public static let typeID = CFAllocatorGetTypeID()
}

extension CFArray: CFType {
    public static let typeID = CFArrayGetTypeID()
}

extension CFAttributedString: CFType {
    public static let typeID = CFAttributedStringGetTypeID()
}

extension CFBag: CFType {
    public static let typeID = CFBagGetTypeID()
}

extension CFBinaryHeap: CFType {
    public static let typeID = CFBinaryHeapGetTypeID()
}

extension CFBitVector: CFType {
    public static let typeID = CFBitVectorGetTypeID()
}

extension CFBoolean: CFType {
    public static let typeID = CFBooleanGetTypeID()
}

extension CFBundle: CFType {
    public static let typeID = CFBundleGetTypeID()
}

extension CFCalendar: CFType {
    public static let typeID = CFCalendarGetTypeID()
}

extension CFCharacterSet: CFType {
    public static let typeID = CFCharacterSetGetTypeID()
}

extension CFData: CFType {
    public static let typeID = CFDataGetTypeID()
}

extension CFDate: CFType {
    public static let typeID = CFDateGetTypeID()
}

extension CFDateFormatter: CFType {
    public static let typeID = CFDateFormatterGetTypeID()
}

extension CFDictionary: CFType {
    public static let typeID = CFDictionaryGetTypeID()
}

extension CFError: CFType {
    public static let typeID = CFErrorGetTypeID()
}

extension CFFileDescriptor: CFType {
    public static let typeID = CFFileDescriptorGetTypeID()
}

extension CFLocale: CFType {
    public static let typeID = CFLocaleGetTypeID()
}

extension CFMachPort: CFType {
    public static let typeID = CFMachPortGetTypeID()
}

extension CFMessagePort: CFType {
    public static let typeID = CFMessagePortGetTypeID()
}

extension CFNotificationCenter: CFType {
    public static let typeID = CFNotificationCenterGetTypeID()
}

extension CFNull: CFType {
    public static let typeID = CFNullGetTypeID()
}

extension CFNumber: CFType {
    public static let typeID = CFNumberGetTypeID()
}

extension CFNumberFormatter: CFType {
    public static let typeID = CFNumberFormatterGetTypeID()
}

extension CFPlugIn: CFType {
    public static let typeID = CFPlugInGetTypeID()
}

extension CFPlugInInstance: CFType {
    public static let typeID = CFPlugInInstanceGetTypeID()
}

extension CFReadStream: CFType {
    public static let typeID = CFReadStreamGetTypeID()
}

extension CFRunLoop: CFType {
    public static let typeID = CFRunLoopGetTypeID()
}

extension CFRunLoopObserver: CFType {
    public static let typeID = CFRunLoopObserverGetTypeID()
}

extension CFRunLoopSource: CFType {
    public static let typeID = CFRunLoopSourceGetTypeID()
}

extension CFRunLoopTimer: CFType {
    public static let typeID = CFRunLoopTimerGetTypeID()
}

extension CFSet: CFType {
    public static let typeID = CFSetGetTypeID()
}

extension CFSocket: CFType {
    public static let typeID = CFSocketGetTypeID()
}

extension CFString: CFType {
    public static let typeID = CFStringGetTypeID()
}

extension CFStringTokenizer: CFType {
    public static let typeID = CFStringTokenizerGetTypeID()
}

extension CFTimeZone: CFType {
    public static let typeID = CFTimeZoneGetTypeID()
}

extension CFTree: CFType {
    public static let typeID = CFTreeGetTypeID()
}

extension CFURL: CFType {
    public static let typeID = CFURLGetTypeID()
}

#if os(macOS)
extension CFUserNotification: CFType {
    public static let typeID = CFUserNotificationGetTypeID()
}
#endif

extension CFUUID: CFType {
    public static let typeID = CFUUIDGetTypeID()
}

extension CFWriteStream: CFType {
    public static let typeID = CFWriteStreamGetTypeID()
}

// MARK: - Mutable Type

//extension CFMutableArray: CFType {}
//extension CFMutableAttributedString: CFType {}
//extension CFMutableBag: CFType {}
//extension CFMutableBitVector: CFType {}
//extension CFMutableCharacterSet: CFType {}
//extension CFMutableData: CFMutableType {}
//extension CFMutableDictionary: CFMutableType {}
//extension CFMutableSet: CFMutableType {}
//extension CFMutableString: CFMutableType {}

// MARK: Deprecated TypeID

//extension CFPropertyList: CFType {
//    public static let typeID = CFPropertyListGetTypeID()
//}

//extension CFXMLNode: CFType {
//    public static let typeID = CFXMLNodeGetTypeID()
//}

//extension CFXMLParser: CFType {
//    public static let typeID = CFXMLParserGetTypeID()
//}

//extension CFXMLTree: CFType {
//    public static let typeID = CFXMLTreeGetTypeID()
//}
