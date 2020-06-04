#if canImport(CoreText)

import CoreText

public extension CFAttributedString.Key {
    
    /// Key to reference a CTRubyAnnotation.
    ///
    /// Value must be a CTRubyAnnotationRef. See CTRubyAnnotation.h for more information.
    static let ctRubyAnnotation = kCTRubyAnnotationAttributeName as CFAttributedString.Key
    
    /// Specifies the size of the annotation text as a percent of the size of the base text.
    ///
    /// Value must be a CFNumberRef, Default is 0.5.
    static let ctRubySizeFactor = CFAttributedString.Key("CTRubyAnnotationSizeFactor")
    
    /// Treat the size specified in kCTRubyAnnotationSizeFactorAttributeName as the maximum scale
    /// factor, when the base text size is smaller than annotation text size, we will try to scale the annotation
    /// font size down so that it will fit the base text without overhang or adding extra padding between base
    /// text.
    ///
    /// Value must be a CFBooleanRef, Default is false.
    @available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    static let ctRubyScaleToFit = kCTRubyAnnotationScaleToFitAttributeName as CFAttributedString.Key
}

public extension CTRubyAnnotation {
    
    typealias Alignment = CTRubyAlignment
    typealias Overhang = CTRubyOverhang
    typealias Position = CTRubyPosition
    
    @usableFromInline internal static let defaultSizeFactor: CGFloat = 0.5
    
    /// Creates an immutable ruby annotation object.
    /// - Parameters:
    ///   - string: A string without any formatting, its format will be derived from the attrs specified
    ///   below.
    ///   - position: The position of the annotation text.
    ///   - alignment: Specifies how the ruby text and the base text should be aligned relative to each
    ///   other.
    ///   - overhang: Specifies how the ruby text can overhang adjacent characters.
    ///   - attributes: A attribute dictionary to combine with the string specified above. If you don't
    ///   specify kCTFontAttributeName, the font used by the Ruby annotation will be deduced from the
    ///   base text, with a size factor specified by a CFNumberRef value keyed by
    ///   kCTRubyAnnotationSizeFactorAttributeName.
    @inlinable static func create(_ string: CFString, position: Position = .before, alignment: Alignment = .auto, overhang: Overhang = .auto, attributes: [CFAttributedString.Key: Any] = [:]) -> CTRubyAnnotation {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return CTRubyAnnotationCreateWithAttributes(alignment, overhang, position, string, attributes as CFDictionary)
        } else {
            let sizeFactor = attributes[.ctRubySizeFactor].map {
                CFNumber.cast($0)!.cgFloatValue
                } ?? CTRubyAnnotation.defaultSizeFactor
            let count = Int(Position.count.rawValue)
            var textArr: [Unmanaged<CFString>?] = Array(repeating: nil, count: count)
            let pos = Int(position.rawValue)
            textArr[pos] = Unmanaged.passUnretained(string)
            return CTRubyAnnotationCreate(alignment, overhang, sizeFactor, &textArr)
        }
    }
        
    @inlinable static func create(_ strings: [Position: CFString], alignment: Alignment = .auto, overhang: Overhang = .auto, sizeFactor: CGFloat = 0.5) -> CTRubyAnnotation {
        let count = Int(Position.count.rawValue)
        var textArr: [Unmanaged<CFString>?] = Array(repeating: nil, count: count)
        for (position, string) in strings {
            let pos = Int(position.rawValue)
            textArr[pos] = Unmanaged.passUnretained(string)
        }
        return CTRubyAnnotationCreate(alignment, overhang, sizeFactor, &textArr)
    }
    
    /// Get the alignment value of a ruby annotation object.
    @inlinable var alignment: Alignment {
        return CTRubyAnnotationGetAlignment(self)
    }
    
    /// Get the overhang value of a ruby annotation object.
    @inlinable var overhang: Overhang {
        return CTRubyAnnotationGetOverhang(self)
    }
    
    /// Get the size factor of a ruby annotation object.
    @inlinable var sizeFactor: CGFloat {
        return CTRubyAnnotationGetSizeFactor(self)
    }
    
    /// Get the ruby text for a particular position in a ruby annotation.
    /// - Parameter position: The position for which you want to get the ruby text.
    @inlinable func text(for position: Position) -> CFString? {
        return CTRubyAnnotationGetTextForPosition(self, position)
    }
}

#endif // canImport(CoreText)
