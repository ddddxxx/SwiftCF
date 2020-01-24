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
    static let progression = kCTFrameProgressionAttributeName as CTFrame.AttributeKey
    static let pathFillRule = kCTFramePathFillRuleAttributeName as CTFrame.AttributeKey
    static let pathWidth = kCTFramePathWidthAttributeName as CTFrame.AttributeKey
    static let clippingPaths = kCTFrameClippingPathsAttributeName as CTFrame.AttributeKey
    static let pathClippingPath = kCTFramePathClippingPathAttributeName as CTFrame.AttributeKey
}

#endif // canImport(CoreText)
