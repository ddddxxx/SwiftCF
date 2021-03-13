#if canImport(CoreText)

import CoreText

public extension CTRubyAnnotation {
    
    typealias Alignment = CTRubyAlignment
    typealias Overhang = CTRubyOverhang
    typealias Position = CTRubyPosition
    
    @usableFromInline internal static let defaultSizeFactor: CGFloat = 0.5
    
    /// Creates an immutable ruby annotation object.
    /// - Parameters:
    ///   - string: A string without any formatting, its format will be derived
    ///   from the attrs specified below.
    ///   - position: The position of the annotation text.
    ///   - alignment: Specifies how the ruby text and the base text should be
    ///   aligned relative to each other.
    ///   - overhang: Specifies how the ruby text can overhang adjacent
    ///   characters.
    ///   - attributes: A attribute dictionary to combine with the string
    ///   specified above. If you don't specify kCTFontAttributeName, the font
    ///   used by the Ruby annotation will be deduced from the base text, with
    ///   a size factor specified by a CFNumberRef value keyed by
    ///   kCTRubyAnnotationSizeFactorAttributeName.
    /// - Returns: This function will return a reference to a CTRubyAnnotation
    /// object.
    @inlinable static func create(_ string: CFString, position: Position = .before, alignment: Alignment = .auto, overhang: Overhang = .auto, attributes: [CFAttributedString.Key: Any] = [:]) -> CTRubyAnnotation {
        if #available(macOS 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return CTRubyAnnotationCreateWithAttributes(alignment, overhang, position, string, attributes._bridgeToCF())
        } else {
            let sizeFactor = attributes[.ctRubySizeFactor].flatMap {
                CFNumber.cast($0)?.value() as CGFloat?
            } ?? CTRubyAnnotation.defaultSizeFactor
            let count = Int(Position.count.rawValue)
            var textArr: [Unmanaged<CFString>?] = Array(repeating: nil, count: count)
            let pos = Int(position.rawValue)
            textArr[pos] = Unmanaged.passUnretained(string)
            return CTRubyAnnotationCreate(alignment, overhang, sizeFactor, &textArr)
        }
    }
    
    /// Creates an immutable ruby annotation object.
    ///
    /// Using this function is the easiest and most efficient way to create a
    /// ruby annotation object.
    /// 
    /// - Parameters:
    ///   - strings: An array of CFStringRef, indexed by CTRubyPosition. Supply
    ///   NULL for any unused positions.
    ///   - alignment: Specifies how the ruby text and the base text should be
    ///   aligned relative to each other.
    ///   - overhang: Specifies how the ruby text can overhang adjacent
    ///   characters.
    ///   - sizeFactor: Specifies the size of the annotation text as a percent
    ///   of the size of the base text.
    /// - Returns: This function will return a reference to a CTRubyAnnotation
    /// object.
    @inlinable static func create(_ strings: [Position: CFString], alignment: Alignment = .auto, overhang: Overhang = .auto, sizeFactor: CGFloat = 0.5) -> CTRubyAnnotation {
        let count = Int(Position.count.rawValue)
        var textArr: [Unmanaged<CFString>?] = Array(repeating: nil, count: count)
        for (position, string) in strings {
            let pos = Int(position.rawValue)
            textArr[pos] = Unmanaged.passUnretained(string)
        }
        return CTRubyAnnotationCreate(alignment, overhang, sizeFactor, &textArr)
    }
    
    /// Creates an immutable copy of a ruby annotation object.
    @inlinable func copy() -> CTRubyAnnotation {
        return CTRubyAnnotationCreateCopy(self)
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
    /// - Parameter position: The position for which you want to get the ruby
    /// text.
    /// - Returns: If the "rubyAnnotation" reference and the position are valid,
    /// then this function will return a CFStringRef for the text. Otherwise it
    /// will return NULL.
    @inlinable func text(for position: Position) -> CFString? {
        return CTRubyAnnotationGetTextForPosition(self, position)
    }
}

#endif // canImport(CoreText)
