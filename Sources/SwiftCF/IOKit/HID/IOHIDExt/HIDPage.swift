#if canImport(IOKit)

import IOKit.hid

public struct HIDPage: RawRepresentable {
    
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}

extension HIDPage: Equatable, Hashable {}

extension HIDPage: Comparable {
    
    public static func < (lhs: HIDPage, rhs: HIDPage) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

private func page(_ raw: Int) -> HIDPage {
    return HIDPage(rawValue: UInt32(raw))
}

public extension HIDPage {
    static let undefined = page(kHIDPage_Undefined)
    static let genericDesktop = page(kHIDPage_GenericDesktop)
    static let simulation = page(kHIDPage_Simulation)
    static let vr = page(kHIDPage_VR)
    static let sport = page(kHIDPage_Sport)
    static let game = page(kHIDPage_Game)
    static let genericDeviceControls = page(kHIDPage_GenericDeviceControls)
    /// USB Device Class Definition for Human Interface Devices (HID). Note: the
    /// usage type for all key codes is Selector (Sel).
    static let keyboardOrKeypad = page(kHIDPage_KeyboardOrKeypad)
    static let leds = page(kHIDPage_LEDs)
    static let button = page(kHIDPage_Button)
    static let ordinal = page(kHIDPage_Ordinal)
    static let telephony = page(kHIDPage_Telephony)
    static let consumer = page(kHIDPage_Consumer)
    static let digitizer = page(kHIDPage_Digitizer)
    
    /* Reserved 0x0E */
    
    /// USB Physical Interface Device definitions for force feedback and related
    /// devices.
    static let pid = page(kHIDPage_PID)
    static let unicode = page(kHIDPage_Unicode)
    
    /* Reserved 0x11 - 0x13 */
    
    static let alphanumericDisplay = page(kHIDPage_AlphanumericDisplay)
    
    /* Reserved 0x15 - 0x1F */
    
    static let sensor = page(kHIDPage_Sensor)
    
    /* Reserved 0x21 - 0x7f */
    
    static let monitor = page(kHIDPage_Monitor)
    static let monitorEnumerated = page(kHIDPage_MonitorEnumerated)
    static let monitorVirtual = page(kHIDPage_MonitorVirtual)
    static let monitorReserved = page(kHIDPage_MonitorReserved)
    
    /* Power 0x84 - 0x87     USB Device Class Definition for Power Devices */
    
    /// Power Device Page
    static let powerDevice = page(kHIDPage_PowerDevice)
    /// Battery System Page
    static let batterySystem = page(kHIDPage_BatterySystem)
    static let powerReserved = page(kHIDPage_PowerReserved)
    static let powerReserved2 = page(kHIDPage_PowerReserved2)
    
    /* Reserved 0x88 - 0x8B */
    
    /// (Point of Sale) USB Device Class Definition for Bar Code Scanner Devices
    static let barCodeScanner = page(kHIDPage_BarCodeScanner)
    /// (Point of Sale) USB Device Class Definition for Weighing Devices
    static let weighingDevice = page(kHIDPage_WeighingDevice)
    /// (Point of Sale) USB Device Class Definition for Scale Devices
    static let scale = page(kHIDPage_Scale)
    static let magneticStripeReader = page(kHIDPage_MagneticStripeReader)
    
    /* ReservedPointofSalepages 0x8F */
    
    /// USB Device Class Definition for Image Class Devices
    static let cameraControl = page(kHIDPage_CameraControl)
    /// OAAF Definitions for arcade and coinop related Devices
    static let arcade = page(kHIDPage_Arcade)
    
    /* Reserved 0x92 - 0xFEFF */
    
    /// VendorDefined 0xFF00 - 0xFFFF
    static let vendorDefinedStart = page(kHIDPage_VendorDefinedStart)
}

#endif // canImport(IOKit)
