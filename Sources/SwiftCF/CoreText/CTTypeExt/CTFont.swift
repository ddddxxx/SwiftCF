#if canImport(CoreText)

import CoreText

public extension CTFont {
    
    @inlinable static func create(name: CFString, size: CGFloat = 0, matrix: CGAffineTransform = .identity, options: CTFontOptions = []) -> CTFont {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreateWithNameAndOptions(name, size, mtx, options)
        }
    }
    
    @inlinable static func create(descriptor: CTFontDescriptor, size: CGFloat = 0, matrix: CGAffineTransform = .identity, options: CTFontOptions = []) -> CTFont {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreateWithFontDescriptorAndOptions(descriptor, size, mtx, options)
        }
    }
    
    @inlinable static func uiFont(type: CTFontUIFontType, size: CGFloat = 0, language: CFString?) -> CTFont? {
        return CTFontCreateUIFontForLanguage(type, size, language)
    }
    
    @inlinable var fontDescriptor: CTFontDescriptor {
        return CTFontCopyFontDescriptor(self)
    }
    
    @inlinable var size: CGFloat {
        return CTFontGetSize(self)
    }
    
    @inlinable var matrix: CGAffineTransform {
        return CTFontGetMatrix(self)
    }
    
    @inlinable var characterSet: CFCharacterSet {
        return CTFontCopyCharacterSet(self)
    }
    
    @inlinable var supportedLanguages: [CFString] {
        return CTFontCopySupportedLanguages(self) as! [CFString]
    }
    
    @inlinable var glyphCount: CFIndex {
        return CTFontGetGlyphCount(self)
    }
    
    @inlinable func attribute(_ attribute: CFString) -> CFTypeRef? {
        return CTFontCopyAttribute(self, attribute)
    }
    
    @inlinable func name(key: NameKey) -> CFString? {
        return CTFontCopyName(self, key.rawValue)
    }
    
    @inlinable func localizedName(key: NameKey) -> (name: CFString, language: CFString)? {
        var lan: Unmanaged<CFString>?
        guard let name = CTFontCopyLocalizedName(self, key.rawValue, &lan) else {
            return nil
        }
        return (name, lan!.takeUnretainedValue())
    }
    
    // MARK: -
    
    @inlinable var ascent: CGFloat { return CTFontGetAscent(self) }
    
    @inlinable var descent: CGFloat { return CTFontGetDescent(self) }
    
    @inlinable var leading: CGFloat { return CTFontGetLeading(self) }
    
    @inlinable var unitsPerEm: UInt32 { return CTFontGetUnitsPerEm(self) }
    
    @inlinable var boundingBox: CGRect { return CTFontGetBoundingBox(self) }
    
    @inlinable var underlinePosition: CGFloat { return CTFontGetUnderlinePosition(self) }
    
    @inlinable var underlineThickness: CGFloat { return CTFontGetUnderlineThickness(self) }
    
    @inlinable var slantAngle: CGFloat { return CTFontGetSlantAngle(self) }
    
    @inlinable var capHeight: CGFloat { return CTFontGetCapHeight(self) }
    
    @inlinable var xHeight: CGFloat { return CTFontGetXHeight(self) }
    
    // MARK: -
    
    @inlinable func glyph(name: CFString) -> CGGlyph {
        return CTFontGetGlyphWithName(self, name)
    }
    
    @inlinable func path(glyph: CGGlyph, transform: CGAffineTransform = .identity) -> CGPath? {
        return withUnsafePointer(to: matrix) { mtx in
            return CTFontCreatePathForGlyph(self, glyph, mtx)
        }
    }
}

#endif // canImport(CoreText)
