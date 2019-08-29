#if canImport(CoreText)

import CoreText

extension CTFont {
    
    public struct NameKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CTFont.NameKey {
    static let copyright = CTFont.NameKey(kCTFontCopyrightNameKey)
    static let family = CTFont.NameKey(kCTFontFamilyNameKey)
    static let subFamily = CTFont.NameKey(kCTFontSubFamilyNameKey)
    static let style = CTFont.NameKey(kCTFontStyleNameKey)
    static let unique = CTFont.NameKey(kCTFontUniqueNameKey)
    static let full = CTFont.NameKey(kCTFontFullNameKey)
    static let version = CTFont.NameKey(kCTFontVersionNameKey)
    static let postScript = CTFont.NameKey(kCTFontPostScriptNameKey)
    static let trademark = CTFont.NameKey(kCTFontTrademarkNameKey)
    static let manufacturer = CTFont.NameKey(kCTFontManufacturerNameKey)
    static let designer = CTFont.NameKey(kCTFontDesignerNameKey)
    static let description = CTFont.NameKey(kCTFontDescriptionNameKey)
    static let vendorURL = CTFont.NameKey(kCTFontVendorURLNameKey)
    static let designerURL = CTFont.NameKey(kCTFontDesignerURLNameKey)
    static let license = CTFont.NameKey(kCTFontLicenseNameKey)
    static let licenseURL = CTFont.NameKey(kCTFontLicenseURLNameKey)
    static let sampleText = CTFont.NameKey(kCTFontSampleTextNameKey)
    static let postScriptCID = CTFont.NameKey(kCTFontPostScriptCIDNameKey)
}

#endif // canImport(CoreText)
