#if canImport(CoreText)

import SwiftCF
import CoreText

extension CTFont {
    
    public struct TraitKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CTFont.TraitKey {
    
    /// The symbolic traits value from the font traits dictionary.
    ///
    /// The value is returned as a CFNumber object.
    static let symbolic = kCTFontSymbolicTrait as CTFont.TraitKey
    
    /// The normalized weight trait from the font traits dictionary.
    ///
    /// The value returned is a CFNumber representing a float value between -1.0
    /// and 1.0 for normalized weight. The value of 0.0 corresponds to the
    /// regular or medium font weight.
    static let weight = kCTFontWeightTrait as CTFont.TraitKey
    
    /// The normalized proportion (width condense or expand) trait from the font
    /// traits dictionary.
    ///
    /// This value corresponds to the relative interglyph spacing for a given
    /// font. The value returned is a CFNumber object representing a float
    /// between -1.0 and 1.0. The value of 0.0 corresponds to regular glyph
    /// spacing, and negative values represent condensed glyph spacing.
    static let width = kCTFontWidthTrait as CTFont.TraitKey
    
    /// The normalized slant angle from the font traits dictionary.
    ///
    /// The value returned is a CFNumber object representing a float value
    /// between -1.0 and 1.0 for normalized slant angle. The value of 0.0
    /// corresponds to 0 degrees clockwise rotation from the vertical and 1.0
    /// corresponds to 30 degrees clockwise rotation.
    static let slant = kCTFontSlantTrait as CTFont.TraitKey
}

#endif // canImport(CoreText)
