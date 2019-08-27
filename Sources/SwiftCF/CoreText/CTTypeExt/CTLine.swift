#if canImport(CoreText)

import CoreText

public extension CTLine {
    
    @inlinable static func create(attributedString: CFAttributedString) -> CTLine {
        return CTLineCreateWithAttributedString(attributedString)
    }
    
    @inlinable func truncated(width: Double, type: CTLineTruncationType, token: CTLine?) -> CTLine? {
        return CTLineCreateTruncatedLine(self, width, type, token)
    }
    
    @inlinable func justified(factor: CGFloat = 1, width: Double) -> CTLine? {
        return CTLineCreateJustifiedLine(self, factor, width)
    }
    
    @inlinable var glyphCount: CFIndex {
        return CTLineGetGlyphCount(self)
    }
    
    @inlinable var glyphRuns: [CTRun] {
        return CTLineGetGlyphRuns(self) as! [CTRun]
    }
    
    @inlinable var stringRange: CFRange {
        return CTLineGetStringRange(self)
    }
    
    @inlinable func penOffset(flushFactor: CGFloat, flushWidth: Double) -> Double {
        return CTLineGetPenOffsetForFlush(self, flushFactor, flushWidth)
    }
    
    @inlinable var typographicBounds: (typographicBounds: Double, ascent: CGFloat, descent: CGFloat, leading: CGFloat) {
        var ascent: CGFloat = 0
        var descent: CGFloat = 0
        var leading: CGFloat = 0
        let typographicBounds = CTLineGetTypographicBounds(self, &ascent, &descent, &leading)
        return (typographicBounds, ascent, descent, leading)
    }
    
    @inlinable var trailingWhitespaceWidth: Double {
        return CTLineGetTrailingWhitespaceWidth(self)
    }
    
    @inlinable func bounds(options: CTLineBoundsOptions = []) -> CGRect {
        return CTLineGetBoundsWithOptions(self, options)
    }
    
    @inlinable func imageBounds(context: CGContext) -> CGRect {
        return CTLineGetImageBounds(self, context)
    }
    
    @inlinable func stringIndex(position: CGPoint) -> CFIndex {
        return CTLineGetStringIndexForPosition(self, position)
    }
    
    @inlinable func offset(charIndex: CFIndex) -> CGFloat {
        return CTLineGetOffsetForStringIndex(self, charIndex, nil)
    }
    
    @available(macOS 10.11, iOS 9.0, tvOS 9.0, *, watchOS 2.0)
    @inlinable func enumerateCaretOffsets(_ block: (_ offset: Double, _ charIndex: CFIndex, _ leadingEdge: Bool, _ stop: UnsafeMutablePointer<Bool>) -> Void) {
        withoutActuallyEscaping(block) { block in
            CTLineEnumerateCaretOffsets(self, block)
        }
    }
    
    @inlinable func draw(in context: CGContext) {
        CTLineDraw(self, context)
    }
}

#endif // canImport(CoreText)
