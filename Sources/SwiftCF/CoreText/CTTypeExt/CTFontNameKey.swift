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
    static let copyright = Self(kCTFontCopyrightNameKey)
    static let family = Self(kCTFontFamilyNameKey)
    static let subFamily = Self(kCTFontSubFamilyNameKey)
    static let style = Self(kCTFontStyleNameKey)
    static let unique = Self(kCTFontUniqueNameKey)
    static let full = Self(kCTFontFullNameKey)
    static let version = Self(kCTFontVersionNameKey)
    static let postScript = Self(kCTFontPostScriptNameKey)
    static let trademark = Self(kCTFontTrademarkNameKey)
    static let manufacturer = Self(kCTFontManufacturerNameKey)
    static let designer = Self(kCTFontDesignerNameKey)
    static let description = Self(kCTFontDescriptionNameKey)
    static let vendorURL = Self(kCTFontVendorURLNameKey)
    static let designerURL = Self(kCTFontDesignerURLNameKey)
    static let license = Self(kCTFontLicenseNameKey)
    static let licenseURL = Self(kCTFontLicenseURLNameKey)
    static let sampleText = Self(kCTFontSampleTextNameKey)
    static let postScriptCID = Self(kCTFontPostScriptCIDNameKey)
}

#endif // canImport(CoreText)
