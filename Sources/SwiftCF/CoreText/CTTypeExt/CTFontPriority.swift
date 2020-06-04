#if canImport(CoreText)

import CoreText

extension CTFont {
    
    public struct Priority: RawRepresentable {
        
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
    }
}

public extension CTFont.Priority {
    /// Priority of system fonts (located in /System/Library/Fonts).
    static let system = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPrioritySystem))
    /// Priority of network fonts (located in /Network/Library/Fonts).
    static let network = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPriorityNetwork))
    /// Priority of computer local fonts (located in /Library/Fonts).
    static let computer = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPriorityComputer))
    /// Priority of local fonts (located in user's Library/Fonts).
    static let user = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPriorityUser))
    /// Priority of fonts registered dynamically, not located in a standard location (either
    /// kCTFontManagerScopeUser, or kCTFontManagerScopeSession).
    static let dynamic = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPriorityDynamic))
    /// Priority of fonts registered for the process (kCTFontManagerScopeProcess).
    static let process = CTFont.Priority(rawValue: UInt32(truncatingIfNeeded: kCTFontPriorityProcess))
}

#endif // canImport(CoreText)
