#if canImport(CoreText)

import CoreText

public extension CTParagraphStyle {
    
    typealias Setting = CTParagraphStyleSetting
    typealias Specifier = CTParagraphStyleSpecifier
    
    /// Creates an immutable paragraph style.
    ///
    /// Using this function is the easiest and most efficient way to create a
    /// paragraph style. Paragraph styles should be kept immutable for totally
    /// lock-free operation. If an invalid paragraph style setting specifier is
    /// passed into the settings parameter, nothing bad will happen, but you
    /// will be unable to query for this value. The reason is to allow backward
    /// compatibility with style setting specifiers that may be introduced in
    /// future versions.
    ///
    /// - Parameter settings: The settings with which to preload the paragraph
    /// style. If you want to specify the default set of settings, set this
    /// parameter to NULL.
    /// - Returns: If the paragraph style creation was successful, this function
    /// will return a valid reference to an immutable CTParagraphStyle object.
    /// Otherwise, this function will return NULL.
    @inlinable static func create(settings: [Setting]) -> CTParagraphStyle {
        return settings.withUnsafeBufferPointer { buffer in
            CTParagraphStyleCreate(buffer.baseAddress, buffer.count)
        }
    }
    
    /// Obtains the current value for a single setting specifier.
    ///
    /// This function returns the current value of the specifier whether or not
    /// the user actually set it. If the user did not set the specifier, this
    /// function returns the default value. If an invalid paragraph style
    /// setting specifier is passed into the spec parameter, nothing bad
    /// happens, and the buffer value is simply zeroed out. The reason is to
    /// allow backward compatibility with style setting specifiers that may be
    /// introduced in future versions.
    ///
    /// - Parameters:
    ///   - specifier: The setting specifier for which to get the value.
    @inlinable func value<T>(for specifier: Specifier, type: T.Type) -> T? {
        let buffer = UnsafeMutablePointer<T>.allocate(capacity: 1)
        // FIXME: initialize
        defer { buffer.deallocate() }
        guard CTParagraphStyleGetValueForSpecifier(self, specifier, MemoryLayout<T>.size, UnsafeMutableRawPointer(buffer)) else {
            return nil
        }
        return buffer.pointee
    }
}

// TODO: Description
#if false
private extension CTParagraphStyle {
    
    enum Description {
        case alignment(CTTextAlignment)
        case firstLineHeadIndent(CGFloat)
        case headIndent(CGFloat)
        case tailIndent(CGFloat)
        case tabStops(CTTextTab)
        case defaultTabInterval(CGFloat)
        case lineBreakMode(CTLineBreakMode)
        case lineHeightMultiple(CGFloat)
        case maximumLineHeight(CGFloat)
        case minimumLineHeight(CGFloat)
        case paragraphSpacing(CGFloat)
        case paragraphSpacingBefore(CGFloat)
        case baseWritingDirection(CTWritingDirection)
        case maximumLineSpacing(CGFloat)
        case minimumLineSpacing(CGFloat)
        case lineSpacingAdjustment(CGFloat)
        case lineBoundsOptions(CTLineBoundsOptions)
    }
}
#endif

#endif // canImport(CoreText)
