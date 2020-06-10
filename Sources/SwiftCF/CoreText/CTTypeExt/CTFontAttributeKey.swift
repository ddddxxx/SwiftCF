#if canImport(CoreText)

import CoreText

extension CTFont {
    
    public struct AttributeKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CTFont.AttributeKey {
    
    /// The font URL.
    ///
    /// This is the key for accessing the font URL from the font descriptor. The
    /// value associated with this key is a CFURLRef.
    static let url = kCTFontURLAttribute as CTFont.AttributeKey
    
    /// The PostScript name.
    ///
    /// This is the key for retrieving the PostScript name from the font
    /// descriptor. When matching, this is treated more generically: the system
    /// first tries to find fonts with this PostScript name. If none is found,
    /// the system tries to find fonts with this family name, and, finally, if
    /// still nothing, tries to find fonts with this display name. The value
    /// associated with this key is a CFStringRef. If unspecified, defaults to
    /// "Helvetica", if unavailable falls back to global font cascade list.
    static let name = kCTFontNameAttribute as CTFont.AttributeKey
    
    /// The display name.
    ///
    /// This is the key for accessing the name used to display the font. Most
    /// commonly this is the full name. The value associated with this key is a
    /// CFStringRef.
    static let displayName = kCTFontDisplayNameAttribute as CTFont.AttributeKey
    
    /// The family name.
    ///
    /// This is the key for accessing the family name from the font descriptor.
    /// The value associated with this key is a CFStringRef.
    static let familyName = kCTFontFamilyNameAttribute as CTFont.AttributeKey
    
    /// The style name.
    ///
    /// This is the key for accessing the style name of the font. This name
    /// represents the designer's description of the font's style. The value
    /// associated with this key is a CFStringRef.
    static let styleName = kCTFontStyleNameAttribute as CTFont.AttributeKey
    
    /// The font traits dictionary.
    ///
    /// This is the key for accessing the dictionary of font traits for
    /// stylistic information. See CTFontTraits.h for the list of font traits.
    /// The value associated with this key is a CFDictionaryRef.
    static let traits = kCTFontTraitsAttribute as CTFont.AttributeKey
    
    /// The font variation dictionary.
    ///
    /// This key is used to obtain the font variation instance as a
    /// CFDictionaryRef. If specified in a font descriptor, fonts with the
    /// specified axes will be primary match candidates, if no such fonts exist,
    /// this attribute will be ignored.
    static let variation = kCTFontVariationAttribute as CTFont.AttributeKey
    
    /// The font point size.
    ///
    /// This key is used to obtain or specify the font point size. Creating a
    /// font with this unspecified will default to a point size of 12.0. The
    /// value for this key is represented as a CFNumberRef.
    static let size = kCTFontSizeAttribute as CTFont.AttributeKey
    
    /// The font transformation matrix.
    ///
    /// This key is used to specify the font transformation matrix when creating
    /// a font. The default value is CGAffineTransformIdentity. The value for
    /// this key is a CFDataRef containing a CGAffineTransform, of which only
    /// the a, b, c, and d fields are used.
    static let matrix = kCTFontMatrixAttribute as CTFont.AttributeKey
    
    /// The font cascade list.
    ///
    /// This key is used to specify or obtain the cascade list used for a font
    /// reference. The cascade list is a CFArrayRef containing
    /// CTFontDescriptorRefs. If unspecified, the global cascade list is used.
    /// This list is not consulted for private-use characters on OS X 10.10, iOS
    /// 8, or earlier.
    static let cascadeList = kCTFontCascadeListAttribute as CTFont.AttributeKey
    
    /// The font Unicode character coverage set.
    ///
    /// The value for this key is a CFCharacterSetRef. Creating a font with this
    /// attribute will restrict the font to a subset of its actual character
    /// set.
    static let characterSet = kCTFontCharacterSetAttribute as CTFont.AttributeKey
    
    /// The list of supported languages.
    ///
    /// The value for this key is a CFArrayRef of CFStringRef language
    /// identifiers conforming to UTS #35. It can be requested from any font. If
    /// present in a descriptor used for matching, only fonts supporting the
    /// specified languages will be returned.
    static let languages = kCTFontLanguagesAttribute as CTFont.AttributeKey
    
    /// The baseline adjustment to apply to font metrics.
    ///
    /// The value for this key is a floating-point CFNumberRef. This is
    /// primarily used when defining font descriptors for a cascade list to keep
    /// the baseline of all fonts even.
    static let baselineAdjust = kCTFontBaselineAdjustAttribute as CTFont.AttributeKey
    
    /// The Macintosh encodings (legacy script codes).
    ///
    /// The value associated with this key is a CFNumberRef containing a
    /// bitfield of the script codes in <CoreText/SFNTTypes.h>; bit 0
    /// corresponds to kFontRomanScript, and so on. This attribute is provided
    /// for legacy compatibility.
    static let macintoshEncodings = kCTFontMacintoshEncodingsAttribute as CTFont.AttributeKey
    
    /// The array of font features.
    ///
    /// This key is used to specify or obtain the font features for a font
    /// reference. The value associated with this key is a CFArrayRef of font
    /// feature dictionaries. This features list contains the feature
    /// information from the 'feat' table of the font. See the
    /// CTFontCopyFeatures() API in   CTFont.h.
    static let features = kCTFontFeaturesAttribute as CTFont.AttributeKey
    
    /// The array of typographic feature settings.
    ///
    /// This key is used to specify an array of zero or more feature settings.
    /// Each setting dictionary indicates which setting should be applied. In
    /// the case of duplicate or conflicting settings the last setting in the
    /// list will take precedence. In the case of AAT settings, it is the
    /// caller's responsibility to handle exclusive and non-exclusive settings
    /// as necessary.
    ///
    /// An AAT setting dictionary contains a tuple of a
    /// kCTFontFeatureTypeIdentifierKey key-value pair and a
    /// kCTFontFeatureSelectorIdentifierKey key-value pair.
    ///
    /// An OpenType setting dictionary contains a tuple of a
    /// kCTFontOpenTypeFeatureTag key-value pair and a
    /// kCTFontOpenTypeFeatureValue key-value pair.
    ///
    /// Starting with OS X 10.10 and iOS 8.0, settings are also accepted (but
    /// not returned) in the following simplified forms:
    ///
    /// An OpenType setting can be either an array pair of tag string and value
    /// number, or a tag string on its own. For example: @[ @"c2sc", @1 ] or
    /// simply @"c2sc". An unspecified value enables the feature and a value of
    /// zero disables it.
    ///
    /// An AAT setting can be specified as an array pair of type and selector
    /// numbers. For example: @[ @(kUpperCaseType),
    /// @(kUpperCaseSmallCapsSelector) ].
    static let featureSettings = kCTFontFeatureSettingsAttribute as CTFont.AttributeKey
    
    /// Specifies advance width.
    ///
    /// This key is used to specify a constant advance width, which affects the
    /// glyph metrics of any font instance created with this key; it overrides
    /// font values and the font transformation matrix, if any. The value
    /// associated with this key must be a CFNumberRef.
    ///
    /// Starting with macOS 10.14 and iOS 12.0, this only affects glyph advances
    /// that have non-zero width when this attribute is not present.
    static let fixedAdvance = kCTFontFixedAdvanceAttribute as CTFont.AttributeKey
    
    /// The orientation attribute.
    ///
    /// This key is used to specify a particular orientation for the glyphs of
    /// the font. The value associated with this key is a int as a CFNumberRef.
    /// If you want to receive vertical metrics from a font for vertical
    /// rendering, specify kCTFontVerticalOrientation. If unspecified, the font
    /// will use its native orientation.
    static let orientation = kCTFontOrientationAttribute as CTFont.AttributeKey

    /// Specifies the recognized format of the font.
    ///
    /// The attribute is used to specify or obtain the format of the font. The
    /// returned value is a CFNumber containing one of the constants defined
    /// below.
    static let format = kCTFontFormatAttribute as CTFont.AttributeKey

    /// Specifies the font descriptor's registration scope.
    ///
    /// The attribute is used to specify or obtain the font registration scope.
    /// The value returned is a CFNumberRef containing one of the
    /// CTFontManagerScope enumerated values. A value of NULL can be returned
    /// for font descriptors that are not registered.
    static let registrationScope = kCTFontRegistrationScopeAttribute as CTFont.AttributeKey
    
    /// The font descriptors priority when resolving duplicates and sorting
    /// match results.
    ///
    /// This key is used to obtain or specify the font priority. The value
    /// returned is a CFNumberRef containing an integer value as defined below.
    /// The higher the value, the higher the priority of the font. Only
    /// registered fonts will have a priority. Unregistered font descriptors
    /// will return NULL.
    static let priority = kCTFontPriorityAttribute as CTFont.AttributeKey

    /// The font enabled state.
    ///
    /// This key is used to obtain the font state. The returned value is a
    /// CFNumberRef representing a boolean value. Unregistered font descriptors
    /// will return NULL, which is equivalent to false.
    static let enabled = kCTFontEnabledAttribute as CTFont.AttributeKey

    /// The font downloadable state.
    ///
    /// The value associated with this key is a CFBoolean.  If it is
    /// kCFBooleanTrue, CoreText attempts to download a font if necessary when
    /// matching a descriptor.
    static let downloadable = kCTFontDownloadableAttribute as CTFont.AttributeKey

    /// The download state.
    ///
    /// The value associated with this key is a CFBoolean.  If it is
    /// kCFBooleanTrue, corresponding FontAsset has been downloaded. (but still
    /// it may be necessary to call appropriate API in order to use the font
    /// in the FontAsset.)
    @available(macOS 10.12, iOS 7.0, tvOS 9.0, watchOS 2.0, *)
    static let downloaded = kCTFontDownloadedAttribute as CTFont.AttributeKey
}

#endif // canImport(CoreText)
