#if canImport(CoreText)

import CoreText

public extension CTFrame {
    
    @inlinable var stringRange: CFRange {
        return CTFrameGetStringRange(self)
    }
    
    @inlinable var visibleStringRange: CFRange {
        return CTFrameGetVisibleStringRange(self)
    }
    
    @inlinable var path: CGPath {
        return CTFrameGetPath(self)
    }
    
    @inlinable var frameAttributes: [AttributeKey: Any] {
        return CTFrameGetFrameAttributes(self) as! [AttributeKey: Any]? ?? [:]
    }
    
    @inlinable var lines: [CTLine] {
        return CTFrameGetLines(self) as! [CTLine]
    }
    
    @inlinable func lineOrigins(range: CFRange) -> [CGPoint] {
        var arr = [CGPoint](repeating: .zero, count: range.length)
        CTFrameGetLineOrigins(self, range, &arr)
        return arr
    }
    
    @inlinable func draw(in context: CGContext) {
        CTFrameDraw(self, context)
    }
    
    // MARK: -
    
    @inlinable var lineAndOrigins: Zip2Sequence<[CTLine], [CGPoint]> {
        return zip(lines, lineOrigins(range: lines.indices.asCF))
    }
}

#endif // canImport(CoreText)
