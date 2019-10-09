import CoreFoundation

public extension CFStringTokenizer {
    
    enum Attribute: CFOptionFlags {
        
        /// `kCFStringTokenizerAttributeLatinTranscription`
        /// `1 << 16`
        case latinTranscription = 0b10000000000000000
        
        /// `kCFStringTokenizerAttributeLanguage`
        /// `1 << 17`
        case language = 0b100000000000000000
    }
    
    enum Unit: CFOptionFlags {
        
        /// `kCFStringTokenizerUnitWord`
        case word = 0
        
        /// `kCFStringTokenizerUnitSentence`
        case sentence = 1
        
        /// `kCFStringTokenizerUnitParagraph`
        case paragraph = 2
        
        /// `kCFStringTokenizerUnitLineBreak`
        case lineBreak = 3
        
        /// `kCFStringTokenizerUnitWordBoundary`
        case wordBoundary = 4
    }
    
    @inlinable static func create(allocator: CFAllocator = .default, string: CFString, range: CFRange? = nil, unit: Unit = .wordBoundary, locale: CFLocale? = nil) -> CFStringTokenizer {
        return CFStringTokenizerCreate(allocator, string, range ?? string.fullRange, unit.rawValue, locale)
    }
    
    @inlinable func setString(_ string: CFString, range: CFRange? = nil) {
        CFStringTokenizerSetString(self, string, range ?? string.fullRange)
    }
    
    @inlinable func goToToken(at index: CFIndex) -> CFStringTokenizerTokenType? {
        let token = CFStringTokenizerGoToTokenAtIndex(self, index)
        if token.isEmpty { return nil }
        return token
    }
    
    @inlinable func advanceToNextToken() -> CFStringTokenizerTokenType? {
        let token = CFStringTokenizerAdvanceToNextToken(self)
        if token.isEmpty { return nil }
        return token
    }
    
    @inlinable func currentTokenRange() -> CFRange {
        return CFStringTokenizerGetCurrentTokenRange(self)
    }
    
    @inlinable func currentTokenAttribute(_ attribute: Attribute) -> CFString? {
        return CFStringTokenizerCopyCurrentTokenAttribute(self, attribute.rawValue).map {
            cfCast($0, to: CFString.self)!
        }
    }
    
    @inlinable func currentSubTokens(maxRangeLength: CFIndex = 0) -> [CFStringTokenizerTokenType] {
        let arr = CFMutableArray.create()
        CFStringTokenizerGetCurrentSubTokens(self, nil, maxRangeLength, arr)
        return arr as! [CFStringTokenizerTokenType]
    }
    
    @inlinable static func bestLanguage(for str: CFString, range: CFRange = .zero) -> CFString? {
        return CFStringTokenizerCopyBestStringLanguage(str, range)
    }
}

extension CFStringTokenizer: IteratorProtocol {
    
    @inlinable public func next() -> CFStringTokenizerTokenType? {
        return advanceToNextToken()
    }
}
