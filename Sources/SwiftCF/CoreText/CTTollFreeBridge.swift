#if canImport(CoreText)

import CoreText

// TODO: CTFont is not documented as toll free bridgable. Tests needed.

#if canImport(AppKit)

import AppKit

extension CTFont: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = NSFont
}

#elseif canImport(UIKit)

import UIKit

extension CTFont: CFTollFreeBridgingNSType {
    public typealias BridgedNSType = UIFont
}

#endif // canImport(AppKit)

#endif // canImport(CoreText)
