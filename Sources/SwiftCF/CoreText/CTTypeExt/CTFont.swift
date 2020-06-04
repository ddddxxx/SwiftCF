#if canImport(CoreText)

import Foundation
import CoreText

public extension CTFont {
    
    typealias Options = CTFontOptions
    typealias UIFontType = CTFontUIFontType
    typealias SymbolicTraits = CTFontSymbolicTraits
    
    // MARK: create
    
    /// Returns a new font reference for the given name.
    ///
    /// The name parameter is the only required parameter, and default values are used for unspecified
    /// parameters (0.0 for size and NULL for matrix and options). If all parameters cannot be matched
    /// identically, a best match is found.
    ///
    /// - Parameters:
    ///   - name: The font name for which you wish to create a new font reference. A valid PostScript
    ///   name is preferred, although other font name types are matched in a fallback manner.
    ///   - size: The point size for the font reference. If 0.0 is specified, the default font size of 12.0 is
    ///   used. This parameter is optional.
    ///   - matrix: The transformation matrix for the font. In most cases, set this parameter to be
    ///   NULL. If NULL is specified, the identity matrix is used. This parameter is optional.
    ///   - options: Options flags. See CTFontOptions for values. This parameter is optional.
    @inlinable static func create(name: CFString, size: CGFloat = 0, matrix: CGAffineTransform = .identity, options: Options = []) -> CTFont {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreateWithNameAndOptions(name, size, mtx, options)
        }
    }
    
    /// Returns a new font reference that best matches the given font descriptor.
    ///
    /// The size and matrix parameters override any specified in the font descriptor, unless they are
    /// unspecified (0.0 for size and NULL for matrix and options). A best match font is always returned, and
    /// default values are used for any unspecified.
    ///
    /// - Parameters:
    ///   - descriptor: A font descriptor containing attributes that specify the requested font.
    ///   - size: The point size for the font reference. If 0.0 is specified, the default font size of 12.0 is
    ///   used. This parameter is optional.
    ///   - matrix: The transformation matrix for the font. In most cases, set this parameter to be
    ///   NULL. If NULL is specified, the identity matrix is used. This parameter is optional.
    ///   - options: Options flags. See CTFontOptions for values. This parameter is optional.
    @inlinable static func create(descriptor: CTFontDescriptor, size: CGFloat = 0, matrix: CGAffineTransform = .identity, options: Options = []) -> CTFont {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreateWithFontDescriptorAndOptions(descriptor, size, mtx, options)
        }
    }
    
    /// Returns the special user-interface font for the given language and user-interface type.
    /// - Parameters:
    ///   - type: A constant specifying the intended user-interface use for the requested font reference.
    ///   See Enumerations for possible values.
    ///   - size: The point size for the font reference. If 0.0 is specified, the default size for the
    ///   requested user-interface type is used.
    ///   - language: Language specifier string to select a font for a particular localization. If NULL is
    ///   specified, the current system language is used. The format of the language identifier should
    ///   conform to the RFC 3066bis standard.
    @inlinable static func uiFont(type: UIFontType, size: CGFloat = 0, language: CFString? = nil) -> CTFont? {
        return CTFontCreateUIFontForLanguage(type, size, language)
    }
    
    // MARK: accessor
    
    /// Returns the normalized font descriptor for the given font reference.
    ///
    /// A normalized font descriptor for a font containing enough information to recreate this font at a later
    /// time.
    @inlinable func fontDescriptor() -> CTFontDescriptor {
        return CTFontCopyFontDescriptor(self)
    }
    
    /// Returns the value associated with an arbitrary attribute of the given font.
    ///
    /// Refer to the attribute definitions documentation for information as to how each attribute is packaged
    /// as a CFType.
    ///
    /// - Parameter attribute: The requested attribute.
    @inlinable func attribute(key: AttributeKey) -> CFTypeRef? {
        return CTFontCopyAttribute(self, key.rawValue)
    }
    
    /// Returns the point size of the given font.
    ///
    /// The point size of the given font reference. This is the point size provided when the font was created.
    @inlinable var size: CGFloat {
        return CTFontGetSize(self)
    }
    
    /// Returns the transformation matrix of the given font.
    ///
    /// The transformation matrix for the given font reference. This is the matrix that was provided when the
    /// font was created.
    @inlinable var matrix: CGAffineTransform {
        return CTFontGetMatrix(self)
    }
    
    /// Returns the symbolic traits of the given font.
    ///
    /// The symbolic traits of the font. This is equivalent to the kCTFontSymbolicTrait value of the traits
    /// dictionary.
    @inlinable var symbolicTraits: SymbolicTraits {
        return CTFontGetSymbolicTraits(self)
    }
    
    /// Returns the traits dictionary of the given font.
    ///
    /// A retained reference to the font traits dictionary. Individual traits can be accessed with the trait key constants.
    @inlinable func traits() -> [TraitKey: Any] {
        return CTFontCopyTraits(self) as! [TraitKey: Any]
    }
    
    // MARK: name
    
    /// Returns the PostScript name of the given font.
    @inlinable func postScriptName() -> CFString { return CTFontCopyPostScriptName(self) }
    
    /// Returns the family name of the given font.
    @inlinable func familyName() -> CFString { return CTFontCopyFamilyName(self) }
    
    /// Returns the full name of the given font.
    @inlinable func fullName() -> CFString { return CTFontCopyFullName(self) }
    
    /// Returns the display name of the given font.
    @inlinable func displayName() -> CFString { return CTFontCopyDisplayName(self) }
    
    /// Returns a reference to the requested name of the given font.
    ///
    /// The requested name for the font, or NULL if the font does not have an entry for the requested name.
    /// The Unicode version of the name is preferred, otherwise the first available version is returned.
    ///
    /// - Parameter key: The name specifier.
    @inlinable func name(key: NameKey) -> CFString? {
        return CTFontCopyName(self, key.rawValue)
    }
    
    /// Returns a reference to the requested name of the given font.
    ///
    /// The name is localized based on the user's global language preference precedence. That is, the
    /// user’s language preference is a list of languages in order of precedence. So, for example, if the list
    /// had Japanese and English, in that order, then a font that did not have Japanese name strings but
    /// had English strings would return the English strings.
    ///
    /// - Parameter key: The name specifier. See Name Specifier Constants for possible values.
    /// - Returns
    ///   - name: A specific localized name from the font reference or NULL if the font does not have an
    ///   entry for the requested name key.
    ///   - language: On output, points to the language string of the returned name string. The format of
    ///   the language identifier conforms to the RFC 3066bis standard.
    @inlinable func localizedName(key: NameKey) -> (name: CFString, language: CFString)? {
        var lan: Unmanaged<CFString>?
        guard let name = CTFontCopyLocalizedName(self, key.rawValue, &lan) else {
            return nil
        }
        return (name, lan!.takeUnretainedValue())
    }
    
    // MARK: encoding
    
    /// Returns the Unicode character set of the font.
    ///
    /// The returned character set covers the nominal referenced by the font's Unicode 'cmap’ table.
    @inlinable func characterSet() -> CFCharacterSet { return CTFontCopyCharacterSet(self) }
    
    /// Returns the best string encoding for legacy format support.
    @inlinable var stringEncoding: CFStringEncoding { return CTFontGetStringEncoding(self) }
    
    /// Returns an array of languages supported by the font.
    ///
    /// A retained reference to an array of languages supported by the font. The array contains language
    /// identifier strings as CFStringRef objects. The format of the language identifier conforms to the RFC
    /// 3066bis standard.
    @inlinable func supportedLanguages() -> [CFString] { return CTFontCopySupportedLanguages(self) as! [CFString] }
    
    /// Provides basic Unicode encoding for the given font, returning by reference an array of CGGlyph
    /// values corresponding to a given array of Unicode characters for the given font.
    ///
    /// If a glyph could not be encoded, a value of 0 is passed back at the corresponding index in the glyphs
    /// array and the function returns False. It is the responsibility of the caller to handle the Unicode
    /// properties of the input characters.
    ///
    /// - Parameter characters: An array of Unicode characters.
    /// - Returns:
    ///   - glyphs: On output, points to an array of glyph values.
    ///   - allMapped: True if the font could encode all Unicode characters; otherwise False.
    @inlinable func glyphsForCharacters(_ characters: [unichar]) -> (glyphs: [CGGlyph], allMapped: Bool) {
        guard !characters.isEmpty else { return ([], true) }
        var allMapped = false
        let glyphs = Array<CGGlyph>(unsafeUninitializedCapacity: characters.count) { p, count in
            allMapped = CTFontGetGlyphsForCharacters(self, characters, p.baseAddress!, p.count)
            count = p.count
        }
        return (glyphs, allMapped)
    }
    
    // MARK: metrics
    
    /// The font-ascent metric scaled according to the point size and matrix of the font reference.
    @inlinable var ascent: CGFloat { return CTFontGetAscent(self) }
    
    /// The font-descent metric scaled according to the point size and matrix of the font reference.
    @inlinable var descent: CGFloat { return CTFontGetDescent(self) }
    
    /// The font-leading metric scaled according to the point size and matrix of the font reference.
    @inlinable var leading: CGFloat { return CTFontGetLeading(self) }
    
    /// The units per em of the font.
    @inlinable var unitsPerEm: UInt32 { return CTFontGetUnitsPerEm(self) }
    
    /// The number of glyphs in the font.
    @inlinable var glyphCount: CFIndex { return CTFontGetGlyphCount(self) }
    
    /// The design bounding box of the font, which is the rectangle defined by xMin, yMin, xMax, and yMax
    /// values for the font. Returns null on error.
    @inlinable var boundingBox: CGRect { return CTFontGetBoundingBox(self) }
    
    /// The font underline-position metric scaled according to the point size and matrix of the font reference.
    @inlinable var underlinePosition: CGFloat { return CTFontGetUnderlinePosition(self) }
    
    /// The font underline-thickness metric scaled according to the point size and matrix of the font reference.
    @inlinable var underlineThickness: CGFloat { return CTFontGetUnderlineThickness(self) }
    
    /// The transformed slant angle of the font. This is equivalent to the italic or caret angle with any skew
    /// from the transformation matrix applied.
    @inlinable var slantAngle: CGFloat { return CTFontGetSlantAngle(self) }
    
    /// The font cap-height metric scaled according to the point size and matrix of the font reference.
    @inlinable var capHeight: CGFloat { return CTFontGetCapHeight(self) }
    
    /// The font x-height metric scaled according to the point size and matrix of the font reference.
    @inlinable var xHeight: CGFloat { return CTFontGetXHeight(self) }
    
    // MARK: glyph
    
    /// Returns the CGGlyph value for the specified glyph name in the given font.
    ///
    /// The returned CGGlyph object can be used with any of the subsequent glyph data accessors or
    /// directly with Core Graphics.
    ///
    /// - Parameter name: The glyph name as a CFString object.
    /// - Returns: The glyph value for the named glyph as a CGGlyph object, or if the glyph name is not
    /// recognized, the .notdef glyph index value.
    @inlinable func glyph(name: CFString) -> CGGlyph {
        return CTFontGetGlyphWithName(self, name)
    }
    
    /// Creates a path for the specified glyph.
    ///
    /// Creates a path from the outlines of the glyph for the specified font. The path reflects the font point
    /// size, matrix, and transform parameter, applied in that order. The transform parameter is most
    /// commonly be used to provide a translation to the desired glyph origin.
    ///
    /// - Parameters:
    ///   - glyph: The glyph.
    ///   - transform: An affine transform applied to the path. Can be NULL. If NULL, identity is used.
    /// - Returns: A CGPath object containing the glyph outlines, NULL on error. Must be released by caller.
    @inlinable func path(glyph: CGGlyph, transform: CGAffineTransform = .identity) -> CGPath? {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreatePathForGlyph(self, glyph, mtx)
        }
    }
}

#endif // canImport(CoreText)
