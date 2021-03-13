#if canImport(CoreText)

import CoreText

public extension CTRun {
    
    /// A bitfield passed back by the CTRun.status function that is used to indicate the disposition of the run.
    typealias Status = CTRunStatus
    
    /// Gets the glyph count for the run.
    @inlinable var glyphCount: CFIndex {
        return CTRunGetGlyphCount(self)
    }
    
    /// Returns the attribute dictionary that was used to create the glyph run.
    ///
    /// The dictionary returned is either the same one that was set as an attribute dictionary on the original
    /// attributed string or a dictionary that has been manufactured by the layout engine. Attribute
    /// dictionaries can be manufactured in the case of font substitution or if the run is missing critical
    /// attributes.
    @inlinable var attributes: [CFAttributedString.Key: Any] {
        return CTRunGetAttributes(self).asSwift()
    }
    
    /// Returns the run's status.
    ///
    /// Runs have status that can be used to expedite certain operations. Knowing the direction and
    /// ordering of a run's glyphs can aid in string index analysis, whereas knowing whether the positions
    /// reference the identity text matrix can avoid expensive comparisons. This status is provided as a
    /// convenience, because this information is not strictly necessary but can be helpful in some
    /// circumstances.
    @inlinable var status: Status {
        return CTRunGetStatus(self)
    }
    
    /// Returns a direct pointer for the glyph array stored in the run.
    ///
    /// The glyph array will have a length equal to the value returned by CTRun.glyphCount. The caller
    /// should be prepared for this function to return NULL even if there are glyphs in the stream. If this
    /// function returns NULL, the caller must allocate its own buffer and call CTRun.glyphs(range:) to fetch
    /// the glyphs.
    @inlinable var glyphsPtr: UnsafeBufferPointer<CGGlyph>? {
        let ptr = CTRunGetGlyphsPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    /// Copies a range of glyphs into a user-provided buffer.
    /// - Parameter range: The range of glyphs to copy. If the length of the range is set to 0, then the
    /// copy operation continues from the range's start index to the end of the run.
    @inlinable func glyphs(in range: CFRange = .zero) -> [CGGlyph] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetGlyphs(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    /// Returns a direct pointer for the glyph position array stored in the run.
    ///
    /// The glyph positions in a run are relative to the origin of the line containing the run. The position array
    /// will have a length equal to the value returned by CTRun.glyphCount. The caller should be prepared
    /// for this function to return NULL even if there are glyphs in the stream. If this function returns NULL,
    /// the caller must allocate its own buffer and call CTRun.positions(range:) to fetch the glyph positions.
    @inlinable var positionsPtr: UnsafeBufferPointer<CGPoint>? {
        let ptr = CTRunGetPositionsPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    /// Copies a range of glyph positions into a user-provided buffer.
    /// - Parameter range: The range of glyph positions to copy. If the length of the range is set to 0,
    /// then the copy operation will continue from the start index of the range to the end of the run.
    @inlinable func positions(in range: CFRange = .zero) -> [CGPoint] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetPositions(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    /// Returns a direct pointer for the glyph advance array stored in the run.
    ///
    /// The advance array will have a length equal to the value returned by CTRun.glyphCount. The caller
    /// should be prepared for this function to return NULL even if there are glyphs in the stream. Should
    /// this function return NULL, the caller needs allocate its own buffer and call CTRun.advances(in:) to
    /// fetch the advances. Note that advances alone are not sufficient for correctly positioning glyphs in a
    /// line, as a run may have a non-identity matrix or the initial glyph in a line may have a non-zero origin;
    /// callers should consider using positions instead.
    @inlinable var advancesPtr: UnsafeBufferPointer<CGSize>? {
        let ptr = CTRunGetAdvancesPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    /// Copies a range of glyph advances into a user-provided buffer.
    /// - Parameter range: The range of glyph advances you wish to copy. If the length of the range is
    /// set to 0, then the copy operation continues from the range's start index to the end of the run.
    @inlinable func advances(in range: CFRange = .zero) -> [CGSize] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetAdvances(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    /// Returns a direct pointer for the string indices stored in the run.
    ///
    /// The indices are the character indices that originally spawned the glyphs that make up the run. They
    /// can be used to map the glyphs in the run back to the characters in the backing store. The string
    /// indices array will have a length equal to the value returned by CTRun.glyphCount. The caller should
    /// be prepared for this function to return NULL even if there are glyphs in the stream. If this function
    /// returns NULL, the caller must allocate its own buffer and call CTRun.stringIndices(in:) to fetch the
    /// indices.
    @inlinable var stringIndicesPtr: UnsafeBufferPointer<CFIndex>? {
        let ptr = CTRunGetStringIndicesPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    
    /// Copies a range of string indices into a user-provided buffer.
    ///
    /// The indices are the character indices that originally spawned the glyphs that make up the run. They
    /// can be used to map the glyphs in the run back to the characters in the backing store.
    ///
    /// - Parameter range: The range of string indices to copy. If the length of the range is set to 0,
    /// then the copy operation continues from the range's start index to the end of the run.
    @inlinable func stringIndices(in range: CFRange = .zero) -> [CFIndex] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetStringIndices(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    /// Gets the range of characters that originally spawned the glyphs in the run.
    ///
    /// The range of characters that originally spawned the glyphs, of if run is invalid, an empty range.
    @inlinable var stringRange: CFRange {
        return CTRunGetStringRange(self)
    }
    
    /// Gets the typographic bounds of the run.
    /// - Parameter range: The portion of the run to measure. If the length of the range is set to 0, then the measure operation continues from the range's start index to the end of the run.
    /// - Returns:
    ///   - width: The typographic width of the run, or if run or range is invalid, 0.
    ///   - ascent: On output, the ascent of the run.
    ///   - descent: On output, the descent of the run.
    ///   - leading: On output, the leading of the run.
    @inlinable func typographicBounds(range: CFRange = .zero) -> (width: Double, ascent: CGFloat, descent: CGFloat, leading: CGFloat) {
        var ascent: CGFloat = 0
        var descent: CGFloat = 0
        var leading: CGFloat = 0
        let width = CTRunGetTypographicBounds(self, range, &ascent, &descent, &leading)
        return (width, ascent, descent, leading)
    }
    
    /// Calculates the image bounds for a glyph range.
    ///
    /// A rectangle that tightly encloses the paths of the run's glyphs, or, if run, context, or range is invalid,
    /// null.
    ///
    /// - Parameters:
    ///   - range: The portion of the run to measure. If the length of the range is set to 0, then the
    ///   measure operation continues from the start index of the range to the end of the run.
    ///   - context: The context for the image bounds being calculated. This is required because the
    ///   context could have settings in it that would cause changes in the image bounds.
    @inlinable func imageBounds(range: CFRange = .zero, context: CGContext) -> CGRect? {
        let bounds = CTRunGetImageBounds(self, context, range)
        return bounds.isNull ? nil : bounds
    }
    
    /// Returns the text matrix needed to draw this run.
    ///
    /// To properly draw the glyphs in a run, the fields tx and ty of the CGAffineTransform returned by this
    /// function should be set to the current text position.
    @inlinable var textMatrix: CGAffineTransform {
        return CTRunGetTextMatrix(self)
    }
    
    /// Draws a complete run or part of one.
    ///
    /// This is a convenience call, because the run could be drawn by accessing the glyphs. This call can
    /// leave the graphics context in any state and does not flush the context after the draw operation.
    /// - Parameters:
    ///   - context: The context into which to draw the run.
    ///   - range: The portion of the run to draw. If the length of the range is set to 0, then the draw
    ///   operation continues from the start index of the range to the end of the run.
    @inlinable func draw(in context: CGContext, range: CFRange = .zero) {
        CTRunDraw(self, context, range)
    }
}

public extension CTRun {
    
    @inlinable func glyph(at index: CFIndex) -> CGGlyph {
        var glyph = CGGlyph()
        CTRunGetGlyphs(self, CFRange(location: index, length: 1), &glyph)
        return glyph
    }
    
    @inlinable func position(at index: CFIndex) -> CGPoint {
        var position = CGPoint()
        CTRunGetPositions(self, CFRange(location: index, length: 1), &position)
        return position
    }
    
    @inlinable func advance(at index: CFIndex) -> CGSize {
        var advance = CGSize()
        CTRunGetAdvances(self, CFRange(location: index, length: 1), &advance)
        return advance
    }
    
    @inlinable func stringIndex(at index: CFIndex) -> CFIndex {
        var index = CFIndex()
        CTRunGetStringIndices(self, CFRange(location: index, length: 1), &index)
        return index
    }
}

#endif // canImport(CoreText)
