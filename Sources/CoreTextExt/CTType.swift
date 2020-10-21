#if canImport(CoreText)

import SwiftCF
import CoreText

extension CTFont: CFType {
    public static var typeID = CTFontCollectionGetTypeID()
}

extension CTFontCollection: CFType {
    public static var typeID = CTFontCollectionGetTypeID()
}

extension CTFontDescriptor: CFType {
    public static var typeID = CTFontDescriptorGetTypeID()
}

extension CTFrame: CFType {
    public static var typeID = CTFrameGetTypeID()
}

extension CTFramesetter: CFType {
    public static var typeID = CTFramesetterGetTypeID()
}

extension CTGlyphInfo: CFType {
    public static var typeID = CTGlyphInfoGetTypeID()
}

extension CTLine: CFType {
    public static var typeID = CTLineGetTypeID()
}

extension CTParagraphStyle: CFType {
    public static var typeID = CTParagraphStyleGetTypeID()
}

extension CTRubyAnnotation: CFType {
    public static var typeID = CTRubyAnnotationGetTypeID()
}

extension CTRun: CFType {
    public static var typeID = CTRunGetTypeID()
}

extension CTTextTab: CFType {
    public static var typeID = CTTextTabGetTypeID()
}

extension CTTypesetter: CFType {
    public static var typeID = CTTypesetterGetTypeID()
}

// MARK: - Mutable Type

//extension CTMutableFontCollection: CFType {}

#endif // canImport(CoreText)
