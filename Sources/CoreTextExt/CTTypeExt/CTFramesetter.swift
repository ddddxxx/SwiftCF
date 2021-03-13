#if canImport(CoreText)

import CoreText

public extension CTFramesetter {
    
    /// Creates a framesetter directly from a typesetter.
    ///
    /// Each framesetter uses a typesetter internally to perform line breaking
    /// and other contextual analysis based on the characters in a string. This
    /// function allows the framesetter to use a typesetter that was constructed
    /// using specific options.
    ///
    /// - Parameter typesetter: The typesetter to be used by the newly created
    /// framesetter.
    /// - Returns: This function will return a reference to a CTFramesetter
    /// object.
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    @inlinable static func create(typesetter: CTTypesetter) -> CTFramesetter {
        return CTFramesetterCreateWithTypesetter(typesetter)
    }
    
    /// Creates an immutable framesetter object from an attributed string.
    ///
    /// The resultant framesetter object can be used to create and fill text
    /// frames with the CTFramesetter.frame(stringRange:path:frameAttributes:)
    /// call.
    ///
    /// - Parameter attributedString: The attributed string with which to
    /// construct the framesetter object.
    /// - Returns: This function will return a reference to a CTFramesetter
    /// object.
    @inlinable static func create(attributedString: CFAttributedString) -> CTFramesetter {
        return CTFramesetterCreateWithAttributedString(attributedString)
    }
    
    /// Creates an immutable frame using a framesetter.
    ///
    /// This call creates a frame full of glyphs in the shape of the path
    /// provided by the path parameter. The framesetter continues to fill the
    /// frame until it either runs out of text or it finds that text no longer
    /// fits.
    ///
    /// - Parameters:
    ///   - stringRange: The range, of the attributed string that was used to
    ///   create the framesetter, that is to be typeset in lines fitted into the
    ///   frame. If the length portion of the range is set to 0, then the
    ///   framesetter continues to add lines until it runs out of text or space.
    ///   - path: A CGPath object that specifies the shape of the frame. The
    ///   path may be non-rectangular in versions of macOS 10.7 or later and
    ///   versions of iOS 4.2 or later.
    ///   - frameAttributes: Additional attributes that control the frame
    ///   filling process can be specified here, or NULL if there are no such
    ///   attributes.
    /// - Returns: This function will return a reference to a new CTFrame object.
    @inlinable func frame(stringRange: CFRange = .zero, path: CGPath, frameAttributes: [CTFrame.AttributeKey: Any] = [:]) -> CTFrame {
        return CTFramesetterCreateFrame(self, stringRange, path, frameAttributes._bridgeToCF())
    }
    
    /// Determines the frame size needed for a string range.
    ///
    /// This function can be used to determine how much space is needed to
    /// display a string, optionally by constraining the space along either
    /// dimension.
    ///
    /// - Parameters:
    ///   - constraints: The width and height to which the frame size is
    ///   constrained. A value of CGFLOAT_MAX for either dimension indicates
    ///   that it should be treated as unconstrained.
    ///   - stringRange: The string range to which the frame size applies. The
    ///   string range is a range over the string used to create the framesetter.
    ///   If the length portion of the range is set to 0, then the framesetter
    ///   continues to add lines until it runs out of text or space.
    ///   - frameAttributes: Additional attributes that control the frame
    ///   filling process, or NULL if there are no such attributes.
    /// - Returns:
    ///   - size: The actual dimensions for the given string range and
    ///   constraints.
    ///   - fitRange: On return, contains the range of the string that actually
    ///   fit in the constrained size.
    @inlinable func suggestFrameSize(constraints: CGSize = CGSize(width: CGFloat.infinity, height: .infinity), stringRange: CFRange = .zero, frameAttributes: [CTFrame.AttributeKey: Any] = [:]) -> (size: CGSize, fitRange: CFRange) {
        var fitRange = CFRange()
        let size = CTFramesetterSuggestFrameSizeWithConstraints(self, stringRange, frameAttributes._bridgeToCF(), constraints, &fitRange)
        return (size, fitRange)
    }
    
    /// Returns the typesetter object being used by the framesetter.
    ///
    /// Each framesetter uses a typesetter internally to perform line breaking
    /// and other contextual analysis based on the characters in a string; this
    /// function returns the typesetter being used by a particular framesetter
    /// in case the caller would like to perform other operations on that
    /// typesetter.
    @inlinable var typesetter: CTTypesetter {
        return CTFramesetterGetTypesetter(self)
    }
}

#endif // canImport(CoreText)
