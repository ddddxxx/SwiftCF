#if canImport(CoreText)

import CoreText

public extension CTFramesetter {
    
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, *, watchOS 5.0)
    @inlinable static func create(typesetter: CTTypesetter) -> CTFramesetter {
        return CTFramesetterCreateWithTypesetter(typesetter)
    }
    
    @inlinable static func create(attributedString: CFAttributedString) -> CTFramesetter {
        return CTFramesetterCreateWithAttributedString(attributedString)
    }
    
    @inlinable func frame(stringRange: CFRange = .zero, path: CGPath, frameAttributes: [CTFrame.AttributeKey: Any] = [:]) -> CTFrame {
        return CTFramesetterCreateFrame(self, stringRange, path, .from(frameAttributes))
    }
    
    @inlinable func suggestFrameSize(constraints: CGSize, stringRange: CFRange = .zero, frameAttributes: [CTFrame.AttributeKey: Any] = [:]) -> (size: CGSize, fitRange: CFRange) {
        var fitRange = CFRange()
        let size = CTFramesetterSuggestFrameSizeWithConstraints(self, stringRange, .from(frameAttributes), constraints, &fitRange)
        return (size, fitRange)
    }
    
    @inlinable var typesetter: CTTypesetter {
        return CTFramesetterGetTypesetter(self)
    }
}

#endif // canImport(CoreText)
