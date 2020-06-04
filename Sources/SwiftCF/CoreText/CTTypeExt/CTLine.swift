#if canImport(CoreText)

import CoreText

public extension CTLine {
    
    /// Creates a single immutable line object directly from an attributed string.
    ///
    /// This function allows clients who need very simple line generation to create a line without creating a
    /// typesetter object. The typesetting is done under the hood. Without a typesetter object, the line cannot
    /// be properly broken. However, for simple things like text labels, line breaking is not an issue.
    ///
    /// - Parameter attributedString: The string from which the line is created.
    @inlinable static func create(attributedString: CFAttributedString) -> CTLine {
        return CTLineCreateWithAttributedString(attributedString)
    }
    
    /// Creates a truncated line from an existing line.
    ///
    /// The line specified in truncationToken should have a width less than the width specified by the width
    /// parameter. If the width of the line specified in truncationToken is greater than width and truncation is
    /// needed, the function returns NULL.
    ///
    /// - Parameters:
    ///   - width: The width at which truncation begins. The line is truncated if its width is greater than
    ///   the width passed in this parameter.
    ///   - type: The type of truncation to perform if needed. See CTLineTruncationType for possible
    ///   values.
    ///   - token: This token is added at the point where truncation took place, to indicate that the line
    ///   was truncated. Usually, the truncation token is the ellipsis character (U+2026). If this parameter is
    ///   set to NULL, then no truncation token is used and the line is simply cut off.
    @inlinable func truncated(width: Double, type: CTLineTruncationType, token: CTLine?) -> CTLine? {
        return CTLineCreateTruncatedLine(self, width, type, token)
    }
    
    /// Creates a justified line from an existing line.
    /// - Parameters:
    ///   - factor: Full or partial justification. When set to 1.0 or greater, full justification is performed.
    ///   If this parameter is set to less than 1.0, varying degrees of partial justification are performed. If it is
    ///   set to 0 or less, no justification is performed.
    ///   - width: The width to which the resultant line is justified. If justificationWidth is less than the
    ///   actual width of the line, then negative justification is performed (that is, glyphs are squeezed
    ///   together).
    @inlinable func justified(factor: CGFloat = 1, width: Double) -> CTLine? {
        return CTLineCreateJustifiedLine(self, factor, width)
    }
    
    /// Returns the total glyph count for the line object.
    ///
    /// The total glyph count is equal to the sum of all of the glyphs in the glyph runs forming the line.
    @inlinable var glyphCount: CFIndex {
        return CTLineGetGlyphCount(self)
    }
    
    /// Returns the array of glyph runs that make up the line object.
    @inlinable var glyphRuns: [CTRun] {
        return CTLineGetGlyphRuns(self) as! [CTRun]
    }
    
    /// Gets the range of characters that originally spawned the glyphs in the line.
    @inlinable var stringRange: CFRange {
        return CTLineGetStringRange(self)
    }
    
    /// Gets the pen offset required to draw flush text.
    /// - Parameters:
    ///   - flushFactor: Determines the type of flushness. A flushFactor of 0 or less indicates left
    ///   flush. A flushFactor of 1.0 or more indicates right flush. Flush factors between 0 and 1.0 indicate
    ///   varying degrees of center flush, with a value of 0.5 being totally center flush.
    ///   - flushWidth: Specifies the width to which the flushness operation should apply.
    @inlinable func penOffset(flushFactor: CGFloat, flushWidth: Double) -> Double {
        return CTLineGetPenOffsetForFlush(self, flushFactor, flushWidth)
    }
    
    /// Calculates the typographic bounds of a line.
    @inlinable var typographicBounds: (typographicBounds: Double, ascent: CGFloat, descent: CGFloat, leading: CGFloat) {
        var ascent: CGFloat = 0
        var descent: CGFloat = 0
        var leading: CGFloat = 0
        let typographicBounds = CTLineGetTypographicBounds(self, &ascent, &descent, &leading)
        return (typographicBounds, ascent, descent, leading)
    }
    
    /// Returns the trailing whitespace width for a line.
    ///
    /// Creating a line for a width can result in a line that is actually longer than the desired width due to
    /// trailing whitespace. Although this is typically not an issue due to whitespace being invisible, this
    /// function can be used to determine what amount of a line's width is due to trailing whitespace.
    @inlinable var trailingWhitespaceWidth: Double {
        return CTLineGetTrailingWhitespaceWidth(self)
    }
    
    /// Calculates the bounds for a line.
    /// - Parameter options: Desired options or 0 if none.
    @inlinable func bounds(options: CTLineBoundsOptions = []) -> CGRect {
        return CTLineGetBoundsWithOptions(self, options)
    }
    
    /// Calculates the image bounds for a line.
    /// - Parameter context: The context for which the image bounds are calculated. This is required
    /// because the context could have settings in it that would cause changes in the image bounds.
    @inlinable func imageBounds(context: CGContext) -> CGRect {
        return CTLineGetImageBounds(self, context)
    }
    
    /// Performs hit testing.
    ///
    /// This function can be used to determine the string index for a mouse click or other event. This string
    /// index corresponds to the character before which the next character should be inserted. This
    /// determination is made by analyzing the string from which a typesetter was created and the
    /// corresponding glyphs as embodied by a particular line.
    ///
    /// - Parameter position: The location of the mouse click relative to the line's origin.
    @inlinable func stringIndex(position: CGPoint) -> CFIndex {
        return CTLineGetStringIndexForPosition(self, position)
    }
    
    /// Determines the graphical offset or offsets for a string index.
    ///
    /// This function returns the graphical offset or offsets corresponding to a string index, suitable for
    /// movement between adjacent lines or for drawing a custom caret. For moving between adjacent lines,
    /// the primary offset can be adjusted for any relative indentation of the two lines; a CGPoint constructed
    /// with the adjusted offset for its x value and 0.0 for its y value is suitable for passing to
    /// CTLine.stringIndex(position:). For drawing a custom caret, the returned primary offset
    /// corresponds to the portion of the caret that represents the visual insertion location for a character
    /// whose direction matches the line's writing direction.
    ///
    /// - Parameter charIndex: The string index corresponding to the desired position.
    /// - Returns:
    ///   - primary: The primary offset along the baseline for charIndex, or 0.0 if the line does not support
    ///   string access.
    ///   - secondary: On output, the secondary offset along the baseline for charIndex. When a single
    ///   caret is sufficient for a string index, this value will be the same as the primary offset, which is the
    ///   return value of this function. May be NULL.
    @inlinable func offset(charIndex: CFIndex) -> (primary: CGFloat, secondary: CGFloat) {
        var secondary = CGFloat()
        let primary = CTLineGetOffsetForStringIndex(self, charIndex, &secondary)
        return (primary, secondary)
    }
    
    /// Enumerates caret offsets for characters in a line.
    ///
    /// The provided block is invoked once for each logical caret edge in the line, in left-to-right visual order.
    /// 
    /// - Parameter block: The offset parameter is relative to the line origin. The leadingEdge
    /// parameter of this block refers to logical order.
    @available(macOS 10.11, iOS 9.0, tvOS 9.0, *, watchOS 2.0)
    @inlinable func enumerateCaretOffsets(_ block: (_ offset: Double, _ charIndex: CFIndex, _ leadingEdge: Bool, _ stop: UnsafeMutablePointer<Bool>) -> Void) {
        withoutActuallyEscaping(block) { block in
            CTLineEnumerateCaretOffsets(self, block)
        }
    }
    
    /// Draws a complete line.
    ///
    /// This is a convenience function because the line could be drawn run-by-run by getting the glyph runs,
    /// getting the glyphs out of them, and calling a function such as showGlyphs(_:atPositions:count:).
    /// This call can leave the graphics context in any state and does not flush the context after the draw
    /// operation.
    ///
    /// - Parameter context: The context into which the line is drawn.
    @inlinable func draw(in context: CGContext) {
        CTLineDraw(self, context)
    }
}

#endif // canImport(CoreText)
