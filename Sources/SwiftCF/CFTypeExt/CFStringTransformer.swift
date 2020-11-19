import CoreFoundation

extension CFString {
    
    public struct Transform: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CFString.Transform {
    
    static func icuTransform(id: CFString) -> CFString.Transform {
        return .init(id)
    }
    
    static let stripCombiningMarks = Self(kCFStringTransformStripCombiningMarks)
    static let toLatin = Self(kCFStringTransformToLatin)
    static let fullwidthHalfwidth = Self(kCFStringTransformFullwidthHalfwidth)
    static let latinKatakana = Self(kCFStringTransformLatinKatakana)
    static let latinHiragana = Self(kCFStringTransformLatinHiragana)
    static let hiraganaKatakana = Self(kCFStringTransformHiraganaKatakana)
    static let mandarinLatin = Self(kCFStringTransformMandarinLatin)
    static let latinHangul = Self(kCFStringTransformLatinHangul)
    static let latinArabic = Self(kCFStringTransformLatinArabic)
    static let latinHebrew = Self(kCFStringTransformLatinHebrew)
    static let latinThai = Self(kCFStringTransformLatinThai)
    static let latinCyrillic = Self(kCFStringTransformLatinCyrillic)
    static let latinGreek = Self(kCFStringTransformLatinGreek)
    static let toXMLHex = Self(kCFStringTransformToXMLHex)
    static let toUnicodeName = Self(kCFStringTransformToUnicodeName)
    static let stripDiacritics = Self(kCFStringTransformStripDiacritics)
}
