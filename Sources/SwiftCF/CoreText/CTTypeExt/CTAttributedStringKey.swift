#if canImport(CoreText)

import CoreText

public extension CFAttributedString.Key {
    
    /// The font.
    ///
    /// Value must be a CTFontRef. Default is Helvetica 12.
    static let ctFont = kCTFontAttributeName as CFAttributedString.Key
    
    /// Never set a foreground color in the CGContext; use what is set as the
    /// context's fill color.
    ///
    /// Value must be a CFBooleanRef. Default is false. The reason why this
    /// exists is because an NSAttributedString defaults to a black color if no
    /// color attribute is set. This forces CoreText to set the color in the
    /// context. This will allow developers to sidestep this, making CoreText
    /// set nothing but font information in the CGContext. If set, this
    /// attribute also determines the color used by
    /// kCTUnderlineStyleAttributeName, in which case it overrides the
    /// foreground color.
    static let ctForegroundColorFromContext = kCTForegroundColorFromContextAttributeName as CFAttributedString.Key
    
    /// A kerning adjustment.
    ///
    /// Value must be a CFNumberRef float. Default is standard kerning. The
    /// kerning attribute indicate how many points the following character
    /// should be shifted from its default offset as defined by the current
    /// character's font in points; a positive kern indicates a shift farther
    /// along and a negative kern indicates a shift closer to the current
    /// character. If this attribute is not present, standard kerning will be
    /// used. If this attribute is set to 0.0, no kerning will be done at all.
    static let ctKern = kCTKernAttributeName as CFAttributedString.Key
    
    /// Applies tracking (letterspacing).
    ///
    /// Value must be a CFNumber. Default is zero (no tracking). The tracking
    /// attribute indicates how much additional space, in points, should be
    /// added to each character cluster after layout. The effect of this
    /// attribute is similar to kCTKernAttributeName but differs in that the
    /// added tracking is treated as trailing whitespace and a non-zero amount
    /// disables non-essential ligatures unless overridden by
    /// kCTLigatureAttributeName being present. If both kCTKernAttributeName and
    /// kCTTrackingAttributeName are present kCTKernAttributeName will be
    /// ignored unless zero; kCTTrackingAttributeName will still be honored.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static let ctTracking = kCTTrackingAttributeName as CFAttributedString.Key
    
    /// Controls ligature formation.
    ///
    /// Value must be a CFNumberRef. Default is int value 1. The ligature
    /// attribute determines what kinds of ligatures should be used when
    /// displaying the string. A value of 0 indicates that only ligatures
    /// essential for proper rendering of text should be used, 1 indicates that
    /// standard ligatures should be used, and 2 indicates that all available
    /// ligatures should be used. Which ligatures are standard depends on the
    /// script and possibly the font. Arabic text, for example, requires
    /// ligatures for many character sequences, but has a rich set of additional
    /// ligatures that combine characters. English text has no essential
    /// ligatures, and typically has only two standard ligatures, those for "fi"
    /// and "fl" -- all others being considered more advanced or fancy.
    ///
    /// On iOS releases prior to 6.0 essential ligatures are applied if the font
    /// contains glyphs for any of U+FB00 through U+FB04 and the font lacks AAT
    /// or OpenType shaping tables, but as of 6.0 shaping tables (or the lack
    /// thereof) are treated as definitive.
    static let ctLigature = kCTLigatureAttributeName as CFAttributedString.Key
    
    /// The foreground color.
    ///
    /// Value must be a CGColorRef. Default value is black.
    static let ctForegroundColor = kCTForegroundColorAttributeName as CFAttributedString.Key
    
    /// The background color.
    ///
    /// Value must be a CGColorRef. Default is no background color.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static let ctBackgroundColor = kCTBackgroundColorAttributeName as CFAttributedString.Key
    
    /// A CTParagraphStyle object which is used to specify things like line
    /// alignment, tab rulers, writing direction, etc.
    ///
    /// Value must be a CTParagraphStyleRef. Default is an empty
    /// CTParagraphStyle object: see CTParagraphStyle.h for more information.
    /// The value of this attribute must be uniform over the range of any
    /// paragraphs to which it is applied.
    static let ctParagraphStyle = kCTParagraphStyleAttributeName as CFAttributedString.Key
    
    /// The stroke width.
    ///
    /// Value must be a CFNumberRef. Default value is 0.0, or no stroke. This
    /// attribute, interpreted as a percentage of font point size, controls the
    /// text drawing mode: positive values effect drawing with stroke only;
    /// negative values are for stroke and fill. A typical value for outlined
    /// text is 3.0.
    static let ctStrokeWidth = kCTStrokeWidthAttributeName as CFAttributedString.Key
    
    /// The stroke color.
    ///
    /// Value must be a CGColorRef. Default is the foreground color.
    static let ctStrokeColor = kCTStrokeColorAttributeName as CFAttributedString.Key
    
    /// Allows the setting of an underline to be applied at render time.
    ///
    /// Value must be a CFNumberRef. Default is kCTUnderlineStyleNone. Set a
    /// value of something other than kCTUnderlineStyleNone to draw an underline.
    /// In addition, the CTUnderlineStyleModifiers can be used to modify the
    /// look of the underline. The underline color will be determined by the
    /// text's foreground color unless otherwise specified by
    /// kCTUnderlineColorAttributeName.
    static let ctUnderlineStyle = kCTUnderlineStyleAttributeName as CFAttributedString.Key
    
    /// Controls vertical text positioning.
    ///
    /// Value must be a CFNumberRef. Default is int value 0. If supported by the
    /// specified font, a value of 1 enables superscripting and a value of -1
    /// enables subscripting.
    static let ctSuperscript = kCTSuperscriptAttributeName as CFAttributedString.Key
    
    /// The underline color.
    ///
    /// Value must be a CGColorRef. Default is the foreground color.
    static let ctUnderlineColor = kCTUnderlineColorAttributeName as CFAttributedString.Key
    
    /// Controls glyph orientation.
    ///
    /// Value must be a CFBooleanRef. Default is false. A value of false
    /// indicates that horizontal glyph forms are to be used, true indicates
    /// that vertical glyph forms are to be used.
    static let ctVerticalForms = kCTVerticalFormsAttributeName as CFAttributedString.Key
    
    /// Setting text in tate-chu-yoko form (horizontal numerals in vertical
    /// text).
    ///
    /// Value must be a CFNumberRef. Default is int value 0. A value of 1 to 4
    /// indicates the number of digits or letters to set in horizontal form.
    /// This is to apply the correct feature settings for the text. This
    /// attribute only works when kCTVerticalFormsAttributeName is set to true.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static let ctHorizontalInVerticalForms = kCTHorizontalInVerticalFormsAttributeName as CFAttributedString.Key
    
    /// Allows the use of unencoded glyphs.
    ///
    /// Value must be a CTGlyphInfoRef. The glyph specified by this CTGlyphInfo
    /// object is assigned to the entire attribute range, provided that its
    /// contents match the specified base string and that the specified glyph is
    /// available in the font specified by kCTFontAttributeName. See
    /// CTGlyphInfo.h for more information.
    static let ctGlyphInfo = kCTGlyphInfoAttributeName as CFAttributedString.Key
    
    /// Specifies text language.
    ///
    /// Value must be a CFStringRef containing a locale identifier. Default is
    /// unset. When this attribute is set to a valid identifier, it will be used
    /// to select localized glyphs (if supported by the font) and
    /// locale-specific line breaking rules.
    static let ctLanguage = kCTLanguageAttributeName as CFAttributedString.Key
    
    /// Allows customization of certain aspects of a range of text's appearance.
    ///
    /// Value must be a CTRunDelegateRef. The values returned by the embedded
    /// object for an attribute range apply to each glyph resulting from the
    /// text in that range. Because an embedded object is only a display-time
    /// modification, care should be taken to avoid applying this attribute to
    /// a range of text with complex behavior, such as a change of writing
    /// direction, combining marks, etc. Consequently, it is recommended that
    /// this attribute be applied to a range containing the single character
    /// U+FFFC. See CTRunDelegate.h for more information.
    static let ctRunDelegate = kCTRunDelegateAttributeName as CFAttributedString.Key
    
    /// Key to reference a baseline class override.
    ///
    /// Value must be one of the kCTBaselineClass constants. Normally, glyphs on
    /// the line will be assigned baseline classes according to the 'bsln' or
    /// 'BASE' table in the font. This attribute may be used to change this
    /// assignment.
    static let ctBaselineClass = kCTBaselineClassAttributeName as CFAttributedString.Key
    
    /// Key to reference a baseline info dictionary.
    ///
    /// Value must be a CFDictionaryRef. Normally, baseline offsets will be
    /// assigned based on the 'bsln' or 'BASE' table in the font. This attribute
    /// may be used to assign different offsets. Each key in the dictionary is
    /// one of the kCTBaselineClass constants and the value is a CFNumberRef of
    /// the baseline offset in points. You only need to specify the offsets you
    /// wish to change.
    static let ctBaselineInfo = kCTBaselineInfoAttributeName as CFAttributedString.Key
    
    /// Key to reference a baseline info dictionary for the reference baseline.
    ///
    /// Value must be a CFDictionaryRef. All glyphs in a run are assigned a
    /// baseline class and then aligned to the offset for that class in the
    /// reference baseline baseline info. See the discussion of
    /// kCTBaselineInfoAttributeName for information about the contents of the
    /// dictionary. You can also use the kCTBaselineReferenceFont key to specify
    /// that the baseline offsets of a particular CTFontRef should be used as
    /// the reference offsets.
    static let ctBaselineReferenceInfo = kCTBaselineReferenceInfoAttributeName as CFAttributedString.Key
    
    /// Controls vertical text positioning.
    ///
    /// Value must be a CFNumberRef float. Default is standard positioning. The
    /// baseline attribute indicates how many points the characters should be
    /// shifted perpendicular to their baseline. A positive baseline value
    /// indicates a shift above (or to the right for vertical text) the text
    /// baseline and a negative baseline value indicates a shift below (or to
    /// the left for vertical text) the text baseline. If this value is set to
    /// 0.0, no baseline shift will be performed.
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let ctBaselineOffset = kCTBaselineOffsetAttributeName as CFAttributedString.Key
    
    /// Specifies a bidirectional override or embedding.
    ///
    ///  Value must be a CFArray of CFNumberRefs, each of which should have a
    ///  value of either kCTWritingDirectionLeftToRight or
    ///  kCTWritingDirectionRightToLeft, plus one of
    ///  kCTWritingDirectionEmbedding or kCTWritingDirectionOverride. This array
    ///  represents a sequence of nested bidirectional embeddings or overrides,
    ///  in order from outermost to innermost, with
    ///  (kCTWritingDirectionLeftToRight | kCTWritingDirectionEmbedding)
    ///  corresponding to a LRE/PDF pair in plain text or
    ///  `<span dir="ltr"></span>` in HTML, (kCTWritingDirectionRightToLeft |
    ///  kCTWritingDirectionEmbedding) corresponding to a RLE/PDF pair in plain
    ///  text or a `<span dir="rtl"></span>` in HTML,
    ///  (kCTWritingDirectionLeftToRight | kCTWritingDirectionOverride)
    ///  corresponding to a LRO/PDF pair in plain text or `<bdo dir="ltr"></bdo>`
    ///  in HTML, and (kCTWritingDirectionRightToLeft |
    ///  kCTWritingDirectionOverride) corresponding to a RLO/PDF pair in plain
    ///  text or `<bdo dir="rtl"></bdo>` in HTML.
    static let ctWritingDirection = kCTWritingDirectionAttributeName as CFAttributedString.Key
    
    /// Key to reference a CTRubyAnnotation.
    ///
    /// Value must be a CTRubyAnnotationRef. See CTRubyAnnotation.h for more
    /// information.
    static let ctRubyAnnotation = kCTRubyAnnotationAttributeName as CFAttributedString.Key
    
    /// Specifies the size of the annotation text as a percent of the size of
    /// the base text.
    ///
    /// Value must be a CFNumberRef, Default is 0.5.
    static let ctRubySizeFactor = CFAttributedString.Key("CTRubyAnnotationSizeFactor")
    
    /// Treat the size specified in kCTRubyAnnotationSizeFactorAttributeName as
    /// the maximum scale factor, when the base text size is smaller than
    /// annotation text size, we will try to scale the annotation font size down
    /// so that it will fit the base text without overhang or adding extra
    /// padding between base
    /// text.
    ///
    /// Value must be a CFBooleanRef, Default is false.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static let ctRubyScaleToFit = kCTRubyAnnotationScaleToFitAttributeName as CFAttributedString.Key
}

#endif // canImport(CoreText)
