#if canImport(CoreText)

import CoreText

public extension CTRun {
    
    @inlinable var glyphCount: CFIndex {
        return CTRunGetGlyphCount(self)
    }
}

#endif // canImport(CoreText)
