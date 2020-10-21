#if canImport(IOKit)

import SwiftCF
import IOKit.hid

extension IOHIDQueue: CFType {
    public static let typeID = IOHIDQueueGetTypeID()
}

extension IOHIDDevice: CFType {
    public static let typeID = IOHIDDeviceGetTypeID()
}

extension IOHIDElement: CFType {
    public static let typeID = IOHIDElementGetTypeID()
}

extension IOHIDManager: CFType {
    public static let typeID = IOHIDManagerGetTypeID()
}

extension IOHIDValue: CFType {
    public static let typeID = IOHIDValueGetTypeID()
}

extension IOHIDTransaction: CFType {
    public static let typeID = IOHIDTransactionGetTypeID()
}

#endif // canImport(IOKit)
