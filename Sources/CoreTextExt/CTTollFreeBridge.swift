#if canImport(CoreText)

import SwiftCF
import CoreText

// TODO: CTFont is not documented as toll free bridgable. Tests needed.

#if canImport(AppKit)

import AppKit

extension CTFont: CFTollFreeBridging {
    public typealias BridgedNSType = NSFont
}

#elseif canImport(UIKit)

import UIKit

extension CTFont: CFTollFreeBridging {
    public typealias BridgedNSType = UIFont
}

#endif // canImport(AppKit)

#endif // canImport(CoreText)
