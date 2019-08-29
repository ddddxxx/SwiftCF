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
    static let progression = CTFrame.AttributeKey(kCTFrameProgressionAttributeName)
    static let pathFillRule = CTFrame.AttributeKey(kCTFramePathFillRuleAttributeName)
    static let pathWidth = CTFrame.AttributeKey(kCTFramePathWidthAttributeName)
    static let clippingPaths = CTFrame.AttributeKey(kCTFrameClippingPathsAttributeName)
    static let pathClippingPath = CTFrame.AttributeKey(kCTFramePathClippingPathAttributeName)
}

#endif // canImport(CoreText)
