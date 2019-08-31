#if canImport(CoreText)

import CoreText

public extension CTRun {
    
    @inlinable var glyphCount: CFIndex {
        return CTRunGetGlyphCount(self)
    }
    
    @inlinable var attributes: [CFAttributedString.Key: Any] {
        return CTRunGetAttributes(self) as! [CFAttributedString.Key: Any]
    }
    
    @inlinable var status: CTRunStatus {
        return CTRunGetStatus(self)
    }
    
    @inlinable var glyphsPtr: UnsafeBufferPointer<CGGlyph>? {
        let ptr = CTRunGetGlyphsPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    @inlinable func glyphs(range: CFRange = .zero) -> [CGGlyph] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetGlyphs(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    @inlinable func glyph(at index: CFIndex) -> CGGlyph {
        var glyph = CGGlyph()
        CTRunGetGlyphs(self, CFRange(location: index, length: 1), &glyph)
        return glyph
    }
    
    @inlinable var positionsPtr: UnsafeBufferPointer<CGPoint>? {
        let ptr = CTRunGetPositionsPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    @inlinable func positions(range: CFRange = .zero) -> [CGPoint] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetPositions(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    @inlinable func position(at index: CFIndex) -> CGPoint {
        var position = CGPoint()
        CTRunGetPositions(self, CFRange(location: index, length: 1), &position)
        return position
    }
    
    @inlinable var advancesPtr: UnsafeBufferPointer<CGSize>? {
        let ptr = CTRunGetAdvancesPtr(self)
        let glyphCount = self.glyphCount
        guard ptr != nil || glyphCount == 0 else {
            return nil
        }
        return UnsafeBufferPointer(start: ptr, count: glyphCount)
    }
    
    @inlinable func advances(range: CFRange = .zero) -> [CGSize] {
        let count = range.length == 0 ? glyphCount : range.length
        return Array(unsafeUninitializedCapacity: count) { (p, count) in
            CTRunGetAdvances(self, range, p.baseAddress!)
            count = range.length
        }
    }
    
    @inlinable func advance(at index: CFIndex) -> CGSize {
        var advance = CGSize()
        CTRunGetAdvances(self, CFRange(location: index, length: 1), &advance)
        return advance
    }
    
    @inlinable func draw(in context: CGContext, range: CFRange = .zero) {
        CTRunDraw(self, context, range)
    }
}

#endif // canImport(CoreText)
