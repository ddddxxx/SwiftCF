#if canImport(IOKit)

import IOKit.hid
    
public struct HIDElementKey: CFStringKey {
    
    public let rawValue: CFString
    
    public init(_ key: CFString) {
        rawValue = key
    }
}

private func key(_ key: String) -> HIDElementKey {
    return key as CFString as HIDElementKey
}

public extension HIDElementKey {
    /// Keys that represents an element property.
    ///
    /// Property for a HID Device or element dictionary. Elements can be
    /// heirarchical, so they can contain other elements.
    static let element = key(kIOHIDElementKey)

    static let cookie = key(kIOHIDElementCookieKey)
    static let type = key(kIOHIDElementTypeKey)
    static let collectionType = key(kIOHIDElementCollectionTypeKey)
    static let usage = key(kIOHIDElementUsageKey)
    static let usagePage = key(kIOHIDElementUsagePageKey)
    static let min = key(kIOHIDElementMinKey)
    static let max = key(kIOHIDElementMaxKey)
    static let scaledMin = key(kIOHIDElementScaledMinKey)
    static let scaledMax = key(kIOHIDElementScaledMaxKey)
    static let size = key(kIOHIDElementSizeKey)
    static let reportSize = key(kIOHIDElementReportSizeKey)
    static let reportCount = key(kIOHIDElementReportCountKey)
    static let reportID = key(kIOHIDElementReportIDKey)
    static let isArray = key(kIOHIDElementIsArrayKey)
    static let isRelative = key(kIOHIDElementIsRelativeKey)
    static let isWrapping = key(kIOHIDElementIsWrappingKey)
    static let isNonLinear = key(kIOHIDElementIsNonLinearKey)
    static let hasPreferredState = key(kIOHIDElementHasPreferredStateKey)
    static let hasNullState = key(kIOHIDElementHasNullStateKey)
    static let flags = key(kIOHIDElementFlagsKey)
    static let unit = key(kIOHIDElementUnitKey)
    static let unitExponent = key(kIOHIDElementUnitExponentKey)
    static let name = key(kIOHIDElementNameKey)
    static let valueLocation = key(kIOHIDElementValueLocationKey)
    static let duplicateIndex = key(kIOHIDElementDuplicateIndexKey)
    static let parentCollection = key(kIOHIDElementParentCollectionKey)
    static let variableSize = key(kIOHIDElementVariableSizeKey)
    static let vendorSpecific = key(kIOHIDElementVendorSpecificKey)
    
    /// The minimum bounds for a calibrated value.
    static let calibrationMin = key(kIOHIDElementCalibrationMinKey)

    /// The maximum bounds for a calibrated value.
    static let calibrationMax = key(kIOHIDElementCalibrationMaxKey)

    /// The mininum tolerance to be used when calibrating a logical element
    /// value.
    /// The saturation property is used to allow for slight differences in the
    /// minimum and maximum value returned by an element.
    static let calibrationSaturationMin = key(kIOHIDElementCalibrationSaturationMinKey)

    /// The maximum tolerance to be used when calibrating a logical element
    /// value.
    /// The saturation property is used to allow for slight differences in the
    /// minimum and maximum value returned by an element.
    static let calibrationSaturationMax = key(kIOHIDElementCalibrationSaturationMaxKey)

    /// The minimum bounds near the midpoint of a logical value in which the
    /// value is ignored.
    /// The dead zone property is used to allow for slight differences in the
    /// idle value returned by an element.
    static let calibrationDeadZoneMin = key(kIOHIDElementCalibrationDeadZoneMinKey)

    /// The maximum bounds near the midpoint of a logical value in which the
    /// value is ignored.
    /// The dead zone property is used to allow for slight differences in the
    /// idle value returned by an element.
    static let calibrationDeadZoneMax = key(kIOHIDElementCalibrationDeadZoneMaxKey)

    /// The scale or level of detail returned in a calibrated element value.
    /// Values are rounded off such that if granularity=0.1, values after
    /// calibration are 0, 0.1, 0.2, 0.3, etc.
    static let calibrationGranularity = key(kIOHIDElementCalibrationGranularityKey)
}

/// Keys used for matching particular elements.
///
/// These keys should only be used with a matching dictionary when searching for
/// elements via copyMatchingElements.
public extension HIDElementKey {
    static let cookieMin = key(kIOHIDElementCookieMinKey)
    static let cookieMax = key(kIOHIDElementCookieMaxKey)
    static let usageMin = key(kIOHIDElementUsageMinKey)
    static let usageMax = key(kIOHIDElementUsageMaxKey)
}

#endif // canImport(IOKit)
