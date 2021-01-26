#if canImport(CoreText)

import CoreText

public enum CTFontManager {}

public extension CTFontManager {
    
    /// Auto-activation settings.
    typealias AutoActivationSetting = CTFontManagerAutoActivationSetting
    
    /// Scope for font registration. A uses session refers to a login session in
    /// macOS, and the current booted session in iOS.
    typealias Scope = CTFontManagerScope
    
    /// Returns an array of unique PostScript font names for the fonts.
    ///
    /// - Returns: An array of CFStrings.
    @available(iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    @inlinable static func availablePostScriptNames() -> [CFString] {
        return CTFontManagerCopyAvailablePostScriptNames() as! [CFString]
    }
    
    /// Returns an array of visible font family names sorted for user interface
    /// display.
    ///
    /// - Returns: An array of CFStrings.
    @available(iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    @inlinable static func availableFontFamilyNames() -> [CFString] {
        return CTFontManagerCopyAvailableFontFamilyNames() as! [CFString]
    }
    
    #if os(macOS)
    /// Returns an array of font URLs.
    ///
    /// - Returns: An array of CFURLs.
    @inlinable static func availableFontURLs() -> [CFURL] {
        return CTFontManagerCopyAvailableFontURLs() as! [CFURL]
    }
    #endif
    
    /// Returns an array of font descriptors representing each of the fonts in
    /// the specified URL.
    ///
    /// - Parameter fileURL: A file system URL referencing a valid font file.
    /// - Returns: An array of CTFontDescriptors or NULL if there are no valid
    /// fonts.
    @inlinable static func fontDescriptors(from fileURL: CFURL) -> [CTFontDescriptor] {
        return CTFontManagerCreateFontDescriptorsFromURL(fileURL) as! [CTFontDescriptor]
    }
    
    /// Creates a font descriptor representing the font in the supplied data.
    ///
    /// If the data contains a font collection (TTC or OTC), only the first font
    /// in the collection will be returned. Use
    /// CTFontManagerCreateFontDescriptorsFromData(_:) in that case.
    ///
    /// # Note
    ///
    /// The font descriptor returned by this function is not available through
    /// font descriptor matching. As a result, you can’t directly look for the
    /// font by name with functions like CTFontCreateWithName(_:_:_:). If you
    /// wish to make the font available for name matching, use
    /// CTFontManagerRegisterFontURLs(_:_:_:_:) instead.
    /// 
    /// - Parameter data: The font data.
    /// - Returns: A font descriptor created from the data or NULL if it is not
    /// a valid font.
    @inlinable static func fontDescriptor(from data: CFData) -> CTFontDescriptor? {
        return CTFontManagerCreateFontDescriptorFromData(data)
    }
    
    /// Creates an array of font descriptors for the fonts in the supplied data.
    ///
    /// This is the preferred function when the data contains a font collection
    /// (TTC or OTC). This function returns an empty array in the event of
    /// invalid or unsupported font data.
    ///
    /// # Note
    ///
    /// The font descriptors are not available through font descriptor matching.
    /// As a result, you can’t directly look for the fonts by name with
    /// functions like CTFontCreateWithName(_:_:_:). If you wish to make the
    /// font available for name matching, use
    /// CTFontManagerRegisterFontURLs(_:_:_:_:) instead.
    ///
    /// - Parameter data: The font data.
    /// - Returns: An array of font descriptors.
    @available(OSX 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    @inlinable static func fontDescriptors(from data: CFData) -> [CTFontDescriptor] {
        return CTFontManagerCreateFontDescriptorsFromData(data) as! [CTFontDescriptor]
    }
    
    /// Registers fonts from the specified font URL with the Font Manager. Registered fonts are discoverable through font descriptor matching.
    /// 
    /// - Parameters:
    ///   - fontURL: The font URL.
    ///   - scope: Scope constant defining the availability and lifetime of the
    ///   registration.
    /// - Throws: Throws CFError if failed.
    @inlinable static func registerFont(for fontURL: CFURL, scope: Scope) throws {
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterFontsForURL(fontURL, scope, &error) else {
            throw error?.takeRetainedValue() ?? CFError.create(domain: .cocoa, code: 0)
        }
    }
    
    /// Unregisters fonts from the specified font URL with the Font Manager.
    /// Unregistered fonts are no longer discoverable through font descriptor
    /// matching.
    /// - Parameters:
    ///   - fontURL: The font URL.
    ///   - scope: Scope constant defining the availability and lifetime of the
    ///   registration.
    /// - Throws: Throws CFError if failed.
    @inlinable static func unregisterFont(for fontURL: CFURL, scope: Scope) throws {
        var error: Unmanaged<CFError>?
        guard CTFontManagerUnregisterFontsForURL(fontURL, scope, &error) else {
            throw error?.takeRetainedValue() ?? CFError.create(domain: .cocoa, code: 0)
        }
    }
    
    /// Registers the specified graphics font with the font manager.
    ///
    /// Registered fonts are discoverable through font descriptor matching. Any
    /// attempt to register a font that is either already registered or contains
    /// the same Postscript of an already registered font will fail. This
    /// behavior is useful for fonts that may be embedded in documents or
    /// constructed in memory. A graphics font is obtained by calling init(_:).
    /// Fonts that are backed by files should be registered using
    /// CTFontManagerRegisterFontsForURL(_:_:_:).
    ///
    /// - Parameter font: The graphics font to be registered.
    /// - Throws: Throws CFError if failed.
    @inlinable static func registerFont(_ font: CGFont) throws {
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            throw error?.takeRetainedValue() ?? CFError.create(domain: .cocoa, code: 0)
        }
    }
    
    /// Unregisters the specified graphics font with the font manager.
    ///
    /// Unregistered fonts are no longer discoverable through font descriptor
    /// matching. Fonts that are backed by files should be unregistered using
    /// CTFontManagerUnregisterFontsForURL(_:_:_:).
    ///
    /// - Parameter font: The graphics font to be unregistered.
    /// - Throws: Throws CFError if failed.
    @inlinable static func unregisterFont(_ font: CGFont) throws {
        var error: Unmanaged<CFError>?
        guard CTFontManagerUnregisterGraphicsFont(font, &error) else {
            throw error?.takeRetainedValue() ?? CFError.create(domain: .cocoa, code: 0)
        }
    }
    
    // TODO: modern register functions
    
    #if os(macOS)
    
    /// Enables the matching font descriptors for font descriptor matching.
    ///
    /// - Parameter descriptors: Array of font descriptors.
    @inlinable static func enableFontDescriptors(_ descriptors: [CTFontDescriptor]) {
        CTFontManagerEnableFontDescriptors(descriptors._bridgeToCoreFoundation(), true)
    }
    
    /// Disables the matching font descriptors for font descriptor matching.
    ///
    /// - Parameter descriptors: Array of font descriptors.
    @inlinable static func disableFontDescriptors(_ descriptors: [CTFontDescriptor]) {
        CTFontManagerEnableFontDescriptors(descriptors._bridgeToCoreFoundation(), false)
    }
    
    /// Returns the registration scope of the specified URL.
    /// - Parameter fontURL: The font URL.
    /// - Returns: The registration scope of the specified URL or .none if not
    /// currently registered.
    @inlinable static func scope(for fontURL: CFURL) -> Scope {
        return CTFontManagerGetScopeForURL(fontURL)
    }
    
    /// Determines whether the referenced font data (usually by file URL) is
    /// supported on the current platform.
    ///
    /// - Parameter fontURL: A URL to font data.
    /// - Returns: This function returns true if the URL represents a valid font
    /// that can be used on the current platform.
    @inlinable static func isSupportedFont(at fontURL: CFURL) -> Bool {
        return CTFontManagerIsSupportedFont(fontURL)
    }
    
    /// Creates a reference to a run loop source used to convey font requests
    /// from the Font Manager.
    ///
    /// - Parameters:
    ///   - sourceOrder: The order of the created run loop source.
    ///   - createMatchesCallback: A block to handle the font request.
    /// - Returns: A reference to a CFRunLoopSource object that should be added
    /// to the run loop. To stop receiving requests, invalidate this run loop
    /// source. Returns NULL on error, in the case of a duplicate
    /// requestPortName, or invalid context structure.
    @inlinable static func fontRequestRunLoopSource(order sourceOrder: CFIndex, createMatchesCallback: @escaping (_ requestAttributes: CFDictionary, _ requestingProcess: pid_t) -> Unmanaged<CFArray>) -> CFRunLoopSource? {
        return CTFontManagerCreateFontRequestRunLoopSource(sourceOrder, createMatchesCallback)
    }
    
    /// The Font Manager bundle identifier to be used when getting or setting
    /// global auto-activation using CTFontManager.autoActivationSetting(:) or CTFontManager.setAutoActivationSetting(for:setting:).
    static let bundleIdentifier: CFString = kCTFontManagerBundleIdentifier
    
    /// Sets the auto-activation setting for the specified bundle identifier.
    ///
    /// - Parameters:
    ///   - bundleIdentifier: The bundle identifier used to specify a particular
    ///   application bundle. If NULL, the current application bundle is used.
    ///   If kCTFontManagerBundleIdentifier is specified, sets global
    ///   auto-activation.
    ///   - setting: The new setting.
    @inlinable static func setAutoActivationSetting(bundleIdentifier: CFString?, setting: AutoActivationSetting) {
        CTFontManagerSetAutoActivationSetting(bundleIdentifier, setting)
    }
    
    /// Gets the auto-activation setting for the specified bundle identifier.
    ///
    /// - Parameter bundleIdentifier: The bundle identifier used to specify a
    /// particular application bundle. If NULL, the current application bundle
    /// is used. If kCTFontManagerBundleIdentifier is specified, gets the global
    /// auto-activation setting.
    /// - Returns: The auto-activation setting for the specified bundle
    /// identifier.
    @inlinable static func autoActivationSetting(bundleIdentifier: CFString?) -> AutoActivationSetting {
        return CTFontManagerGetAutoActivationSetting(bundleIdentifier)
    }
    
    #endif
    
    /// Notification name for font registry changes.
    ///
    /// This is the string to use as the notification name when subscribing to
    /// CTFontManager notifications. This notification will be posted when fonts
    /// are added or removed.
    ///
    /// OS X clients should register as an observer of the notification with the
    /// distributed notification center for changes in session or persistent
    /// scopes and with the local notification center for changes in process
    /// scope.
    ///
    /// iOS clients should register as an observer of the notification with the
    /// local notification center for all changes.
    static let registeredFontsChangedNotification = kCTFontManagerRegisteredFontsChangedNotification
}

#endif // canImport(CoreText)
