#if canImport(IOKit)

import IOKit.hid

public extension IOHIDReportType {
    static let input = kIOHIDReportTypeInput
    static let output = kIOHIDReportTypeOutput
    static let feature = kIOHIDReportTypeFeature
    static let count = kIOHIDReportTypeCount
}

public extension IOHIDElementCommitDirection {
    static let `in` = kIOHIDElementCommitDirectionIn
    static let out = kIOHIDElementCommitDirectionOut
}

public extension IOHIDElementType {
    static let input_Misc = kIOHIDElementTypeInput_Misc
    static let input_Button = kIOHIDElementTypeInput_Button
    static let input_Axis = kIOHIDElementTypeInput_Axis
    static let input_ScanCodes = kIOHIDElementTypeInput_ScanCodes
    static let input_NULL = kIOHIDElementTypeInput_NULL
    static let output = kIOHIDElementTypeOutput
    static let feature = kIOHIDElementTypeFeature
    static let collection = kIOHIDElementTypeCollection
}

public extension IOHIDElementCollectionType {
    static let physical = kIOHIDElementCollectionTypePhysical
    static let application = kIOHIDElementCollectionTypeApplication
    static let logical = kIOHIDElementCollectionTypeLogical
    static let report = kIOHIDElementCollectionTypeReport
    static let namedArray = kIOHIDElementCollectionTypeNamedArray
    static let usageSwitch = kIOHIDElementCollectionTypeUsageSwitch
    static let usageModifier = kIOHIDElementCollectionTypeUsageModifier
}

#endif // canImport(IOKit)
