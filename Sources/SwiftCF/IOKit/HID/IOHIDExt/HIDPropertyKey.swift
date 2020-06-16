#if canImport(IOKit)

import IOKit.hid
    
public struct HIDPropertyKey: CFStringKey {
    
    public let rawValue: CFString
    
    public init(_ key: CFString) {
        rawValue = key
    }
}

private func key(_ key: String) -> HIDPropertyKey {
    return HIDPropertyKey(key as CFString)
}

public extension HIDPropertyKey {
    /// Number property that describes the transport of the device.
    static let transport = key(kIOHIDTransportKey)
    /// Number property that describes the vendor ID of the device.
    static let vendorID = key(kIOHIDVendorIDKey)
    /// Number property that describes the product ID of the device.
    static let productID = key(kIOHIDProductIDKey)
    /// Number property that describes the version number of the device.
    static let versionNumber = key(kIOHIDVersionNumberKey)
    /// String property that describes the manufacturer of the device.
    static let manufacturer = key(kIOHIDManufacturerKey)
    /// String property that describes the product of the device.
    static let product = key(kIOHIDProductKey)
    /// String property that describes the serial number of the device.
    static let serialNumber = key(kIOHIDSerialNumberKey)
    /// Number property that describes the country code of the device.
    static let countryCode = key(kIOHIDCountryCodeKey)
    /// Number property that describes the location ID of the device.
    static let locationID = key(kIOHIDLocationIDKey)
    /// Array property that describes the top level usages of the device. The
    /// array will have dictionaries of usage pages/usages of each top level
    /// collection that exists on the device.
    static let deviceUsagePairs = key(kIOHIDDeviceUsagePairsKey)
    /// Number property used in the device usage pairs array above. Describes a
    /// usage of the device.
    static let deviceUsage = key(kIOHIDDeviceUsageKey)
    /// Number property used in the device usage pairs array above. Describes a
    /// usage page of the device.
    static let deviceUsagePage = key(kIOHIDDeviceUsagePageKey)
    /// Number property that describes the primary usage page of the device.
    static let primaryUsage = key(kIOHIDPrimaryUsageKey)
    /// Number property that describes the primary usage of the device.
    static let primaryUsagePage = key(kIOHIDPrimaryUsagePageKey)
    /// Number property that describes the max input report size of the device.
    /// This is derived from the report descriptor data provided in the
    /// kIOHIDReportDescriptorKey key.
    static let maxInputReportSize = key(kIOHIDMaxInputReportSizeKey)
    /// Number property that describes the max output report size of the device.
    /// This is derived from the report descriptor data provided in the
    /// kIOHIDReportDescriptorKey key.
    static let maxOutputReportSize = key(kIOHIDMaxOutputReportSizeKey)
    /// Number property that describes the max feature report size of the
    /// device. This is derived from the report descriptor data provided in the
    /// kIOHIDReportDescriptorKey key.
    static let maxFeatureReportSize = key(kIOHIDMaxFeatureReportSizeKey)
    /// Number property set on the device from a client that describes the
    /// interval at which the client wishes to receive reports. It is up to the
    /// device to determine how to handle this key, if it chooses to do so.
    static let reportInterval = key(kIOHIDReportIntervalKey)
    /// Number property set on the device from a client that describes the
    /// interval at which the client wishes to receive batched reports. It is up
    /// to the device to determine how to handle this key, if it chooses to do
    /// so.
    static let batchInterval = key(kIOHIDBatchIntervalKey)
    /// Number property that describes the request timeout in us for
    /// get/setReport calls. It is up to the device to determine how to handle
    /// this key, if it chooses to do so.
    static let requestTimeout = key(kIOHIDRequestTimeoutKey)
    /// Data property that describes the report descriptor of the device.
    static let reportDescriptor = key(kIOHIDReportDescriptorKey)
    /// Number property that describes if the device is built in.
    static let builtIn = key(kIOHIDBuiltInKey)
    /// String property that describes a unique identifier of the device.
    static let physicalDeviceUniqueID = key(kIOHIDPhysicalDeviceUniqueIDKey)
}

public extension HIDPropertyKey {
    static let vendorIDSource = key(kIOHIDVendorIDSourceKey)
    static let standardType = key(kIOHIDStandardTypeKey)
    static let sampleInterval = key(kIOHIDSampleIntervalKey)
    static let reset = key(kIOHIDResetKey)
    static let keyboardLanguage = key(kIOHIDKeyboardLanguageKey)
    static let altHandlerId = key(kIOHIDAltHandlerIdKey)
    static let displayIntegrated = key(kIOHIDDisplayIntegratedKey)
    static let productIDMask = key(kIOHIDProductIDMaskKey)
    static let productIDArray = key(kIOHIDProductIDArrayKey)
    static let powerOnDelayNS = key(kIOHIDPowerOnDelayNSKey)
    static let category = key(kIOHIDCategoryKey)
    static let maxResponseLatency = key(kIOHIDMaxResponseLatencyKey)
    static let uniqueID = key(kIOHIDUniqueIDKey)
    static let modelNumber = key(kIOHIDModelNumberKey)
}

#endif // canImport(IOKit)
