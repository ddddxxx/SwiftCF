#if canImport(CoreGraphics)

import SwiftCF
import CoreGraphics

extension CGColor: CFType {}
extension CGColorConversionInfo: CFType {}
extension CGColorSpace: CFType {}
extension CGContext: CFType {}
extension CGDataConsumer: CFType {}
extension CGDataProvider: CFType {}
extension CGFont: CFType {}
extension CGFunction: CFType {}
extension CGImage: CFType {}
extension CGLayer: CFType {}
extension CGPath: CFType {}
extension CGPattern: CFType {}
extension CGPDFDocument: CFType {}
extension CGPDFPage: CFType {}
extension CGShading: CFType {}

#if os(macOS)

extension CGDisplayMode: CFType {}
extension CGDisplayStream: CFType {}
extension CGEvent: CFType {}
extension CGEventSource: CFType {}
extension CGPSConverter: CFType {}

#endif // os(macOS)

#endif // canImport(CoreGraphics)
