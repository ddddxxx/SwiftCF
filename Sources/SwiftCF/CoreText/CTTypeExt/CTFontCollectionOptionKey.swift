#if canImport(CoreText)

import CoreText

extension CTFontCollection {
    
    public struct OptionKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

extension CTFontCollection.OptionKey {
    
    /// Option key to specify filtering of duplicates.
    ///
    /// Specify this option key in the options dictionary with a non- zero value
    /// to enable automatic filtering of duplicate font descriptors.
    static let removeDuplicates = kCTFontCollectionRemoveDuplicatesOption as CTFontCollection.OptionKey
}

#endif // canImport(CoreText)
