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
    
    static let stripCombiningMarks = CFString.Transform(kCFStringTransformStripCombiningMarks)
    static let toLatin = CFString.Transform(kCFStringTransformToLatin)
    static let fullwidthHalfwidth = CFString.Transform(kCFStringTransformFullwidthHalfwidth)
    static let latinKatakana = CFString.Transform(kCFStringTransformLatinKatakana)
    static let latinHiragana = CFString.Transform(kCFStringTransformLatinHiragana)
    static let hiraganaKatakana = CFString.Transform(kCFStringTransformHiraganaKatakana)
    static let mandarinLatin = CFString.Transform(kCFStringTransformMandarinLatin)
    static let latinHangul = CFString.Transform(kCFStringTransformLatinHangul)
    static let latinArabic = CFString.Transform(kCFStringTransformLatinArabic)
    static let latinHebrew = CFString.Transform(kCFStringTransformLatinHebrew)
    static let latinThai = CFString.Transform(kCFStringTransformLatinThai)
    static let latinCyrillic = CFString.Transform(kCFStringTransformLatinCyrillic)
    static let latinGreek = CFString.Transform(kCFStringTransformLatinGreek)
    static let toXMLHex = CFString.Transform(kCFStringTransformToXMLHex)
    static let toUnicodeName = CFString.Transform(kCFStringTransformToUnicodeName)
    static let stripDiacritics = CFString.Transform(kCFStringTransformStripDiacritics)
}
