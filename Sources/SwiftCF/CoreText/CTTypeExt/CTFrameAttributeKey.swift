#if canImport(CoreText)

import CoreText

extension CTFrame {
    
    public struct AttributeKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CTFrame.AttributeKey {
    static let progression = Self(kCTFrameProgressionAttributeName)
    static let pathFillRule = Self(kCTFramePathFillRuleAttributeName)
    static let pathWidth = Self(kCTFramePathWidthAttributeName)
    static let clippingPaths = Self(kCTFrameClippingPathsAttributeName)
    static let pathClippingPath = Self(kCTFramePathClippingPathAttributeName)
}

#endif // canImport(CoreText)
