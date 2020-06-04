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
    
    /// A CFNumber object containing a CTFrame.Progression constant. The default is
    /// CTFrame.Progression.topToBottom.
    static let progression = kCTFrameProgressionAttributeName as CTFrame.AttributeKey
    
    /// The value must be a CFNumber object containing a CTFrame.PathFillRule constant. The default
    /// value is CTFrame.PathFillRule.evenOdd.
    static let pathFillRule = kCTFramePathFillRuleAttributeName as CTFrame.AttributeKey
    
    /// The value must be a CFNumber object containing a value specifying the frame width. The default
    /// width value is zero.
    static let pathWidth = kCTFramePathWidthAttributeName as CTFrame.AttributeKey
    
    /// The value must be a CFArrayRef containing CFDictionaryRefs. Each dictionary should have a
    /// CTFrame.AttributeKey.pathClippingPath key-value pair, and can have a
    /// CTFrame.AttributeKey.pathFillRule key-value pair and CTFrame.AttributeKey.pathFillRule
    /// key-value pair as optional parameters.
    static let clippingPaths = kCTFrameClippingPathsAttributeName as CTFrame.AttributeKey
    
    /// The value must be a CGPathRef specifying a clipping pat. See CTFrame.AttributeKey.clippingPaths.
    static let pathClippingPath = kCTFramePathClippingPathAttributeName as CTFrame.AttributeKey
}

#endif // canImport(CoreText)
