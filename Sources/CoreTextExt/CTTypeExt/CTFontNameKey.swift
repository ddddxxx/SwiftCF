#if canImport(CoreText)

import SwiftCF
import CoreText

extension CTFont {
    
    /// Name specifier constants provide access to the different names
    /// associated with a font.
    public struct NameKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CTFont.NameKey {
    /// The name specifier for the copyright name.
    static let copyright = kCTFontCopyrightNameKey as CTFont.NameKey
    /// The name specifier for the family name.
    static let family = kCTFontFamilyNameKey as CTFont.NameKey
    /// The name specifier for the subfamily name.
    static let subFamily = kCTFontSubFamilyNameKey as CTFont.NameKey
    /// The name specifier for the style name.
    static let style = kCTFontStyleNameKey as CTFont.NameKey
    /// The name specifier for the unique name.
    ///
    /// Note that this name is often not unique and should not be assumed to be
    /// truly unique.
    static let unique = kCTFontUniqueNameKey as CTFont.NameKey
    /// The name specifier for the full name.
    static let full = kCTFontFullNameKey as CTFont.NameKey
    /// The name specifier for the version name.
    static let version = kCTFontVersionNameKey as CTFont.NameKey
    /// The name specifier for the PostScript name.
    static let postScript = kCTFontPostScriptNameKey as CTFont.NameKey
    /// The name specifier for the trademark name.
    static let trademark = kCTFontTrademarkNameKey as CTFont.NameKey
    /// The name specifier for the manufacturer name.
    static let manufacturer = kCTFontManufacturerNameKey as CTFont.NameKey
    /// The name specifier for the designer name.
    static let designer = kCTFontDesignerNameKey as CTFont.NameKey
    /// The name specifier for the description name.
    static let description = kCTFontDescriptionNameKey as CTFont.NameKey
    /// The name specifier for the vendor url name.
    static let vendorURL = kCTFontVendorURLNameKey as CTFont.NameKey
    /// The name specifier for the designer url name.
    static let designerURL = kCTFontDesignerURLNameKey as CTFont.NameKey
    /// The name specifier for the license name.
    static let license = kCTFontLicenseNameKey as CTFont.NameKey
    /// The name specifier for the license url name.
    static let licenseURL = kCTFontLicenseURLNameKey as CTFont.NameKey
    /// The name specifier for the sample text name string.
    static let sampleText = kCTFontSampleTextNameKey as CTFont.NameKey
    /// The name specifier for the PostScript CID name.
    static let postScriptCID = kCTFontPostScriptCIDNameKey as CTFont.NameKey
}

#endif // canImport(CoreText)
