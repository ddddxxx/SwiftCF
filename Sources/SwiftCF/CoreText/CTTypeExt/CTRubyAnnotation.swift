#if canImport(CoreText)

import CoreText

public extension CFAttributedString.Key {
    static let rubyAnnotation = kCTRubyAnnotationAttributeName as CFAttributedString.Key
    /// Value must be a CFNumberRef, Default is 0.5.
    static let rubySizeFactor = CFAttributedString.Key("CTRubyAnnotationSizeFactor")
    /// Value must be a CFBooleanRef, Default is false.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, *, watchOS 3.0)
    static let rubyScaleToFit = kCTRubyAnnotationScaleToFitAttributeName as CFAttributedString.Key
}

public extension CTRubyAnnotation {
    
    @usableFromInline internal static let defaultSizeFactor: CGFloat = 0.5
    
    @inlinable static func create(_ string: CFString, position: CTRubyPosition = .before, alignment: CTRubyAlignment = .auto, overhang: CTRubyOverhang = .auto, attributes: [CFAttributedString.Key: Any] = [:]) -> CTRubyAnnotation {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, *, watchOS 3.0) {
            return CTRubyAnnotationCreateWithAttributes(alignment, overhang, position, string, attributes as CFDictionary)
        } else {
            let sizeFactor = attributes[.rubySizeFactor].map {
                CFNumber.cast($0)!.cgFloatValue
                } ?? CTRubyAnnotation.defaultSizeFactor
            let count = Int(CTRubyPosition.count.rawValue)
            var textArr: [Unmanaged<CFString>?] = Array(repeating: nil, count: count)
            let pos = Int(position.rawValue)
            textArr[pos] = Unmanaged.passUnretained(string)
            return CTRubyAnnotationCreate(alignment, overhang, sizeFactor, &textArr)
        }
    }
    
    @inlinable var alignment: CTRubyAlignment {
        return CTRubyAnnotationGetAlignment(self)
    }
    
    @inlinable var overhang: CTRubyOverhang {
        return CTRubyAnnotationGetOverhang(self)
    }
    
    @inlinable var sizeFactor: CGFloat {
        return CTRubyAnnotationGetSizeFactor(self)
    }
    
    @inlinable func text(position: CTRubyPosition) -> CFString? {
        return CTRubyAnnotationGetTextForPosition(self, position)
    }
}

#endif // canImport(CoreText)
