#if canImport(CoreText)

import SwiftCF
import CoreText

public extension CTFrame {
    
    /// The type for constants that specify a fill rule used by a frame.
    typealias PathFillRule = CTFramePathFillRule
    
    /// These constants specify frame progression types.
    typealias Progression = CTFrameProgression
    
    /// Returns the range of characters originally requested to fill the frame.
    @inlinable var stringRange: CFRange {
        return CTFrameGetStringRange(self)
    }
    
    /// Returns the range of characters that actually fit in the frame.
    ///
    /// This function can be used to cascade frames, because it returns the
    /// range of characters that can be seen in the frame. The next frame would
    /// start where this frame ends.
    @inlinable var visibleStringRange: CFRange {
        return CTFrameGetVisibleStringRange(self)
    }
    
    /// Returns the path used to create the frame.
    @inlinable var path: CGPath {
        return CTFrameGetPath(self)
    }
    
    /// Returns the frame attributes used to create the frame.
    ///
    /// You can create a frame with an attributes dictionary to control various
    /// aspects of the framing process. These attributes are different from the
    /// ones used to create an attributed string.
    @inlinable var frameAttributes: [AttributeKey: Any] {
        return CTFrameGetFrameAttributes(self)?.asSwift() ?? [:]
    }
    
    /// Returns an array of lines stored in the frame.
    @inlinable var lines: [CTLine] {
        return CTFrameGetLines(self).asSwift()
    }
    
    /// Copies a range of line origins for a frame.
    ///
    /// This function copies a range of CGPoint structures into the origins
    /// buffer. The maximum number of line origins this function will copy into
    /// the origins buffer is the count of the array of lines (the length of the
    /// range parameter).
    ///
    /// - Parameter range: The range of line origins you wish to copy. If the
    /// length of the range is 0, then the copy operation continues from the
    /// start index of the range to the last line origin.
    /// - Returns: The buffer to which the origins will be copied. When using
    /// the origins to calculate measurements for a frame's contents, remember
    /// that line origins do not always correspond to line metrics; paragraph
    /// style settings can affect line origins, for one. The overall typographic
    /// bounds of a frame may generally be calculated as the difference between
    /// the top of the frame and the descent of the last line. This will
    /// obviously exclude any spacing following the last line, but such spacing
    /// has no effect on framesetting in the first place.
    @inlinable func lineOrigins(range: CFRange) -> [CGPoint] {
        var arr = [CGPoint](repeating: .zero, count: range.length)
        CTFrameGetLineOrigins(self, range, &arr)
        return arr
    }
    
    /// Draws an entire frame into a context.
    ///
    /// If both the frame and the context are valid, the frame is drawn in the
    /// context. This call can leave the context in any state and does not flush
    /// it after the draw operation.
    ///
    /// - Parameter context: The context in which to draw the frame.
    @inlinable func draw(in context: CGContext) {
        CTFrameDraw(self, context)
    }
    
    // MARK: -
    
    @inlinable var lineAndOrigins: Zip2Sequence<[CTLine], [CGPoint]> {
        return zip(lines, lineOrigins(range: lines.indices.asCF))
    }
}

#endif // canImport(CoreText)
