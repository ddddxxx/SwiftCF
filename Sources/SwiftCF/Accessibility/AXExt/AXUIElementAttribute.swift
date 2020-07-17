#if canImport(ApplicationServices)

import ApplicationServices

extension AXUIElement {
    
    /// Each UIElement has a set of attributes that assistive applications use
    /// to get information about the UIElement. The list of attributes vary
    /// depending on the type of UIElement. The value of some attributes can be
    /// changed, while others cannot. For example, changing the "value"
    /// attribute of a slider changes the slider's setting.
    ///
    /// Attribute values are stored as Core Foundation types, CFTypeRefs, and
    /// are reference counted (CFRetain/CFRelease). Some attributes have a
    /// particular type associated with them. For example, the "title" attribute,
    /// if defined, always has a string value, regardless of the type of
    /// UIElement from which it is obtained. A UIElement's "value" attribute,
    /// however, varies with the UIElement. For example, a text field's value is
    /// a string whereas a checkbox's value is a boolean. You need to explictly
    /// test the returned objects, using the CFGetTypeID function, for what type
    /// they really are.
    ///
    /// Finally, some attribute values hold simple structures, such as CGPoint
    /// and CGRect, instead of regular CFTypes. These are still passed between
    /// the target and assistive application as CFTypeRefs, but they merely wrap
    /// an encoded version of the structure. You need to use the functions
    /// AXValueCreate and AXValueGetValue to convert between the structures and
    /// CFTypeRefs. Each supported structure has an AXValueType associated with
    /// it. The AXValueGetType function returns the AXValueType of the structure
    /// contained within a CFTypeRef.
    public struct Attribute: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

private func attribute(_ key: String) -> AXUIElement.Attribute {
    return key as CFString as AXUIElement.Attribute
}

// MARK: - Informational Attributes

/// Informational Attributes
public extension AXUIElement.Attribute {
    
    /// Identifies the basic type of an element.
    ///
    /// # Value
    ///
    /// A CFStringRef of one of the role strings defined in this header, or a
    /// new role string of your own invention. The string should not be
    /// localized, and it does not need to be human-readable. Instead of
    /// inventing new role strings, see if a custom element can be identified by
    /// an existing role string and a new subrole. See kAXSubroleAttribute.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all elements. Even in the worst case scenario where an
    /// element cannot figure out what its basic type is, it can still supply
    /// the value kAXUnknownRole.
    ///
    /// # Carbon Accessorization Notes
    ///
    /// If your HIObjectClass or Carbon Event handler provides the
    /// kAXRoleAttribute, it must also provide the kAXRoleDescriptionAttribute.
    static let role = attribute(kAXRoleAttribute)
    
    /// More specifically identifies the type of an element beyond the basic
    /// type provided by kAXRoleAttribute.
    ///
    /// # Value
    ///
    /// A CFStringRef of one of the subrole strings defined in this header, or a
    /// new subrole string of your own invention. The string should not be
    /// localized, and it does not need to be human-readable.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required only when an element's kAXRoleAttribute alone doesn't provide
    /// an assistive application with enough information to convey the meaning
    /// of this element to the user.
    ///
    /// An example element that offers the kAXSubroleAttribute is a window's
    /// close box. Its kAXRoleAttribute value is kAXButtonRole and its
    /// kAXSubroleAttribute is kAXCloseButtonSubrole. It is of role
    /// kAXButtonRole because it offers no additional actions or attributes
    /// above and beyond what other kAXButtonRole elements provide; it was given
    /// a subrole in order to allow an assistive app to communicate the close
    /// box's semantic difference to the user.
    ///
    /// # Carbon Accessorization Notes
    ///
    /// If your HIObjectClass or Carbon Event handler provides the
    /// kAXSubroleAttribute, it must also provide the
    /// kAXRoleDescriptionAttribute.
    static let subrole = attribute(kAXSubroleAttribute)
    
    /// A localized, human-readable string that an assistive application can
    /// present to the user as an explanation of an element's basic type or
    /// purpose. Examples would be "push button" or "secure text field". The
    /// string's language should match the language of the app that the element
    /// lives within. The string should be all lower-case and contain no
    /// punctuation.
    ///
    /// Two elements with the same kAXRoleAttribute and kAXSubroleAttribute
    /// should have the same kAXRoleDescriptionAttribute.
    ///
    /// # Value
    ///
    /// A localized, human-readable CFStringRef
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all elements. Even in the worst case scenario where an
    /// element cannot figure out what its basic type is, it can still supply
    /// the value "unknown".
    ///
    /// # Carbon Accessorization Notes
    ///
    /// The HIObjectClass or Carbon Event handler that provides the AXRole
    /// and/or AXSubrole for an element is the one that must also handle the
    /// AXRoleDescription attribute. If an HIObjectClass or Carbon Event handler
    /// does not provide either the AXRole or AXSubrole, it must not provide the
    /// AXRoleDescription.
    static let roleDescription = attribute(kAXRoleDescriptionAttribute)
    
    /// A localized, human-readable CFStringRef that offers help content for an
    /// element.
    ///
    /// This is often the same information that would be provided in a help tag
    /// for the element.
    ///
    /// # Value
    ///
    /// A localized, human-readable CFStringRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for any element that has help data available.
    static let help = attribute(kAXHelpAttribute)
    
    /// The localized, human-readable string that is displayed as part of the
    /// element's normal visual interface. For example, an OK button's
    /// kAXTitleElement is the string"OK", and a menu item's kAXTitleElement is
    /// the text of the menu item.
    ///
    /// # Value
    ///
    /// A localized, human-readable CFStringRef
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required if the element draws a string as part of its normal visual
    /// interface.
    static let title = attribute(kAXTitleAttribute)
}

// MARK: - Value Attributes

/// Value Attributes
public extension AXUIElement.Attribute {
    
    /// A catch-all attribute that represents a user modifiable setting of an
    /// element. For example, the contents of an editable text field, the
    /// position of a scroll bar thumb, and whether a check box is checked are
    /// all communicated by the kAXValueAttribute of their respective elements.
    ///
    /// # Value
    ///
    /// Varies, but will always be the same type for a given kind of element.
    /// Each role that offers kAXValueAttribute will specify the type of data
    /// that will be used for its value.
    ///
    /// # Writable
    ///
    /// Generally yes. However, it does not need to be writable if some other
    /// form of direct manipulation is more appropriate for causing a value
    /// change. For example, a kAXScrollBar's kAXValueAttribute is writable
    /// because it allows an efficient way for the user to get to a specific
    /// position in the element being scrolled. By contrast, a kAXCheckBox's
    /// kAXValueAttribute is not settable because underlying functionality of
    /// the check box widget relies on it being clicked on; therefore, it
    /// changes its own kAXValueAttribute appropriately in response to the
    /// kAXPressAction.
    ///
    /// # Availability
    ///
    /// Required for many user manipulatable elements, or those whose value
    /// state conveys important information.
    static let value = attribute(kAXValueAttribute)
    
    /// Used to supplement kAXValueAttribute.  This attribute returns a string
    /// description that best describes the current value stored in
    /// kAXValueAttribute. This is useful for things like slider where the
    /// numeric value in kAXValueAttribute does not always convey enough
    /// information about the adjustment made on the slider.  As an example, a
    /// color slider that adjusts thru various colors cannot be well-described
    /// by the numeric value in existing AXValueAttribute.  This is where the
    /// kAXValueDescriptionAttribute comes in handy.  In this example, the
    /// developer can provide the color information using this attribute.
    ///
    /// # Value
    ///
    /// A localized, human-readable CFStringRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for elements that support kAXValueAttribute.
    static let valueDescription = attribute(kAXValueDescriptionAttribute)
    
    /// Only used in conjunction with kAXValueAttribute and kAXMaxValueAttribute,
    /// this attribute represents the minimum value that an element can display.
    /// This is useful for things like sliders and scroll bars, where the user
    /// needs to have an understanding of how much the kAXValueAttribute can
    /// vary.
    ///
    /// # Value
    ///
    /// Same data type as the element's kAXValueAttribute.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for many user maniipulatable elements. See kAXValueAttribute
    /// for more details.
    static let minValue = attribute(kAXMinValueAttribute)
    
    /// Only used in conjunction with kAXValueAttribute and kAXMinValueAttribute,
    /// this attribute represents the maximum value that an element can display.
    /// This is useful for things like sliders and scroll bars, where the user
    /// needs to have an understanding of how much the kAXValueAttribute can
    /// vary.
    ///
    /// # Value
    ///
    /// Same data type as the element's kAXValueAttribute.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for many user maniipulatable elements. See kAXValueAttribute
    /// for more details.
    static let maxValue = attribute(kAXMaxValueAttribute)
    
    /// Only used in conjunction with kAXValueAttribute, this attribute
    /// represents the amount a value will change in one action on the given
    /// element. In particular, it is used on elements of role
    /// kAXIncrementorRole in order to give the user an idea of how much its
    /// value will change with a single click on the up or down arrow.
    ///
    /// # Value
    ///
    /// Same data type as the element's kAXValueAttribute.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for kAXIncrementorRole and other similar elements.
    static let valueIncrement = attribute(kAXValueIncrementAttribute)
    
    /// An array of the allowed values for a slider or other widget that
    /// displays a large value range, but which can only be set to a small
    /// subset of values within that range.
    ///
    /// # Value
    ///
    /// A CFArrayRef of whatever type the element uses for its kAXValueAttribute.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for sliders or other elements that can only be set to a
    /// small set of values.
    static let allowedValues = attribute(kAXAllowedValuesAttribute)
    
    /// The value of placeholder text as found in a text field.
    ///
    /// # Value
    ///
    /// A CFStringRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for text fields and other elements that have a placeholder
    /// value.
    static let placeholderValue = attribute(kAXPlaceholderValueAttribute)
    
    /// Indicates whether the element can be interacted with by the user. For
    /// example, a disabled push button's kAXEnabledAttribute will be false.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means enabled, false means disabled.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all views, menus, and menu items. Not required for windows.
    static let enabled = attribute(kAXEnabledAttribute)
    
    /// Indicates that an element is busy. This status conveys that an element
    /// is in the process of updating or loading and that new information will
    /// be available when the busy state completes.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means busy, false means not busy.
    ///
    /// # Writable
    ///
    /// YES
    static let elementBusy = attribute(kAXElementBusyAttribute)
    
    /// Indicates whether the element is the current keyboard focus. It should
    /// be writable for any element that can accept keyboard focus, though you
    /// can only set the value of kAXFocusedAttribute to true. You cannot
    /// unfocus an element by setting the value to false. Only one element in a
    /// window's entire accessibility hierarchy should be marked as focused.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means focused, false means not focused.
    ///
    /// # Writable
    ///
    /// Yes, for any focusable element. No in all other cases.
    ///
    /// # Availability
    ///
    /// Required for any focusable element. Not required for other elements,
    /// though it is often offered for non-focusable elements in a read-only
    /// fashion.
    static let focused = attribute(kAXFocusedAttribute)
    
    /// Indicates the element's container element in the visual element
    /// hierarchy. A push button's kAXParentElement might be a window element or
    /// a group. A sheet's kAXParentElement will be a window element. A window's
    /// kAXParentElement will be the application element. A menu item's
    /// kAXParentElement will be a menu element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for every element except the application. Everything else in
    /// the visual element hierarchy must have a parent.
    static let parent = attribute(kAXParentAttribute)
    
    /// Indicates the sub elements of a given element in the visual element
    /// hierarchy. A tab group's kAXChildrenAttribute is an array of tab radio
    /// button elements. A window's kAXChildrenAttribute is an array of the
    /// first-order views elements within the window. A menu's
    /// kAXChildrenAttribute is an array of the menu item elements.
    ///
    /// A given element may only be in the child array of one other element. If
    /// an element is in the child array of some other element, the element's
    /// kAXParentAttribute must be the other element.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementRefs.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for elements that contain sub elements.
    static let children = attribute(kAXChildrenAttribute)
    
    /// Indicates the selected sub elements of a given element in the visual
    /// element hierarchy.
    ///
    /// This is a the subset of the element's kAXChildrenAttribute that are
    /// selected. This is commonly used in lists so an assistive app can know
    /// which list item are selected.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementRefs.
    ///
    /// # Writable
    ///
    /// Only if there is no other way to manipulate the set of selected elements
    /// via accessibilty attributes or actions. Even if other ways exist, this
    /// attribute can be writable as a convenience to assistive applications and
    /// their users. If kAXSelectedChildrenAttribute is writable, a write
    /// request with a value of an empty array should deselect all selected
    /// children.
    ///
    /// # Availability
    ///
    /// Required for elements that contain selectable sub elements.
    static let selectedChildren = attribute(kAXSelectedChildrenAttribute)
    
    /// Indicates the visible sub elements of a given element in the visual
    /// element hierarchy. This is a the subset of the element's
    /// kAXChildrenAttribute that a sighted user can see on the screen. In a
    /// list element, kAXVisibleChildrenAttribute would be an array of child
    /// elements that are currently scrolled into view.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementRefs.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for elements whose child elements can be occluded or
    /// scrolled out of view.
    static let visibleChildren = attribute(kAXVisibleChildrenAttribute)
    
    /// A short cut for traversing an element's parent hierarchy until an
    /// element of role kAXWindowRole is found. Note that the value for
    /// kAXWindowAttribute should not be an element of role kAXSheetRole or
    /// kAXDrawerRole; instead, the value should be the element of kAXWindowRole
    /// that the sheet or drawer is attached to.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of role kAXWindowRole.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for any element that has an element of role kAXWindowRole
    /// somewhere in its parent chain.
    static let window = attribute(kAXWindowAttribute)
    
    /// This is very much like the kAXWindowAttribute, except that the value of
    /// this attribute can be an element with role kAXSheetRole or kAXDrawerRole.
    /// It is a short cut for traversing an element's parent hierarchy until an
    /// element of role kAXWindowRole, kAXSheetRole, or kAXDrawerRole is found.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of role kAXWindowRole, kAXSheetRole, or kAXDrawerRole.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for any element that has an appropriate element somewhere in
    /// its parent chain.
    static let topLevelUIElement = attribute(kAXTopLevelUIElementAttribute)
    
    /// The global screen position of the top-left corner of an element.
    ///
    /// # Value
    ///
    /// An AXValueRef with type kAXValueCGPointType. 0,0 is the top-left corner
    /// of the screen that displays the menu bar. The value of the horizontal
    /// axis increases to the right. The value of the vertical axis increases
    /// downward. Units are points.
    ///
    /// # Writable
    ///
    /// Generally no. However, some elements that can be moved by the user
    /// through direct manipulation (like windows) should offer a writable
    /// position attribute.
    ///
    /// # Availability
    ///
    /// Required for all elements that are visible on the screen, which is
    /// virtually all elements.
    static let position = attribute(kAXPositionAttribute)
    
    /// The vertical and horizontal dimensions of the element.
    ///
    /// # Value
    ///
    /// Value: An AXValueRef with type kAXValueCGSizeType. Units are points.
    ///
    /// # Writable
    ///
    /// Generally no. However, some elements that can be resized by the user
    /// through direct manipulation (like windows) should offer a writable size
    /// attribute.
    ///
    /// # Availability
    ///
    /// Required for all elements that are visible on the screen, which is
    /// virtually all elements.
    static let size = attribute(kAXSizeAttribute)
    
    /// An indication of whether an element is drawn and/or interacted with in a
    /// vertical or horizontal manner. Elements such as scroll bars and sliders
    /// offer the kAXOrientationAttribute.
    ///
    /// # Value
    ///
    /// kAXHorizontalOrientationValue, kAXVerticalOrientationValue, or rarely
    /// kAXUnknownOrientationValue.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for scroll bars, sliders, or other elements whose semantic or
    /// associative meaning changes based on their orientation.
    static let orientation = attribute(kAXOrientationAttribute)
    
    /// A localized, human-readable string that indicates an element's purpose
    /// in a way that is slightly more specific than the
    /// kAXRoleDescriptionAttribute, but which is less wordy than the
    /// kAXHelpAttribute. Typically, the description should be an adjective or
    /// short phrase that describes the element's usage. For example, the
    /// description of a slider in a font panel might be "font size". The string
    /// should be all lower-case and contain no punctuation.
    ///
    /// # Value
    ///
    /// A localized, human-readable CFStringRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for all elements because it gives the user a concise
    /// indication of an element's purpose.
    static let description = attribute(kAXDescriptionAttribute)
    
    /// The selected text of an editable text element.
    ///
    /// # Value
    ///
    /// A CFStringRef with the currently selected text of the element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all editable text elements.
    static let selectedText = attribute(kAXSelectedTextAttribute)
    
    /// The range of characters (not bytes) that defines the current selection
    /// of an editable text element.
    ///
    /// # Value
    ///
    /// An AXValueRef of type kAXValueCFRange.
    ///
    /// # Writable
    ///
    /// Yes
    ///
    /// # Availability
    ///
    /// Required for all editable text elements.
    static let selectedTextRange = attribute(kAXSelectedTextRangeAttribute)
    
    /// An array of noncontiguous ranges of characters (not bytes) that defines
    /// the current selections of an editable text element.
    ///
    /// # Value
    ///
    /// A CFArrayRef of kAXValueCFRanges.
    ///
    /// # Writable
    ///
    /// Yes
    ///
    /// # Availability
    ///
    /// Recommended for text elements that support noncontiguous selections.
    static let selectedTextRanges = attribute(kAXSelectedTextRangesAttribute)
    
    /// The range of characters (not bytes) that are scrolled into view in the
    /// editable text element.
    ///
    /// # Value
    ///
    /// An AXValueRef of type kAXValueCFRange.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for elements of role kAXTextAreaRole. Not required for any
    /// other elements, including those of role kAXTextFieldRole.
    static let visibleCharacterRange = attribute(kAXVisibleCharacterRangeAttribute)
    
    /// The total number of characters (not bytes) in an editable text element.
    ///
    /// # Value
    ///
    /// CFNumberRef
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for editable text elements.
    static let numberOfCharacters = attribute(kAXNumberOfCharactersAttribute)
    
    /// # Value
    ///
    /// CFArrayRef of AXUIElementRefs
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Optional
    static let sharedTextUIElements = attribute(kAXSharedTextUIElementsAttribute)
    
    /// # Value
    ///
    /// AXValueRef of type kAXValueCFRangeType
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Optional
    static let sharedCharacterRange = attribute(kAXSharedCharacterRangeAttribute)
    
    /// Returns an array of elements that also have keyboard focus when a given
    /// element has keyboard focus. A common usage of this attribute is to
    /// report that both a search text field and a list of resulting suggestions
    /// share keyboard focus because keyboard events can be handled by either UI
    /// element. In this example, the text field would be the first responder
    /// and it would report the list of suggestions as an element in the array
    /// returned for kAXSharedFocusElementsAttribute.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementsRefs.
    ///
    /// # Writable
    ///
    /// No
    static let sharedFocusElements = attribute(kAXSharedFocusElementsAttribute)
    
    static let insertionPointLineNumber = attribute(kAXInsertionPointLineNumberAttribute)
    
    /// Whether a window is the main document window of an application. For an
    /// active app, the main window is the single active document window. For an
    /// inactive app, the main window is the single document window which would
    /// be active if the app were active. Main does not necessarily imply that
    /// the window has key focus.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means the window is main. False means it is not.
    ///
    /// # Writable
    ///
    /// Yes
    ///
    /// # Availability
    ///
    /// Required for all window elements.
    static let main = attribute(kAXMainAttribute)
    
    /// Whether a window is currently minimized to the dock.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means minimized.
    ///
    /// # Writable
    ///
    /// Yes
    ///
    /// # Availability
    ///
    /// Required for all window elements that can be minimized.
    static let minimized = attribute(kAXMinimizedAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// close button element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's close button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a close button.
    static let closeButton = attribute(kAXCloseButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// zoom button element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's zoom button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a zoom button.
    static let zoomButton = attribute(kAXZoomButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// minimize button element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's minimize button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a minimize button.
    static let minimizeButton = attribute(kAXMinimizeButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// toolbar button element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's toolbar button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a toolbar button.
    static let toolbarButton = attribute(kAXToolbarButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// full screen button element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's full screen button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a full screen button.
    static let fullScreenButton = attribute(kAXFullScreenButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// document proxy element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's document proxy element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a document proxy.
    static let proxy = attribute(kAXProxyAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// grow area element.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's grow area element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a grow area.
    static let growArea = attribute(kAXGrowAreaAttribute)
    
    /// Whether a window is modal.
    ///
    /// # Value
    ///
    /// A CFBooleanRef. True means the window is modal.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements.
    static let modal = attribute(kAXModalAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// default button element, if any.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's default button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a default button.
    static let defaultButton = attribute(kAXDefaultButtonAttribute)
    
    /// A convenience attribute so assistive apps can quickly access a window's
    /// cancel button element, if any.
    ///
    /// # Value
    ///
    /// An AXUIElementRef of the window's cancel button element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all window elements that have a cancel button.
    static let cancelButton = attribute(kAXCancelButtonAttribute)
    
    // MARK: menu-specific attributes
    
    static let menuItemCmdChar = attribute(kAXMenuItemCmdCharAttribute)
    static let menuItemCmdVirtualKey = attribute(kAXMenuItemCmdVirtualKeyAttribute)
    static let menuItemCmdGlyph = attribute(kAXMenuItemCmdGlyphAttribute)
    static let menuItemCmdModifiers = attribute(kAXMenuItemCmdModifiersAttribute)
    static let menuItemMarkChar = attribute(kAXMenuItemMarkCharAttribute)
    static let menuItemPrimaryUIElement = attribute(kAXMenuItemPrimaryUIElementAttribute)
    
    // MARK: application-specific attributes
    
    static let menuBar = attribute(kAXMenuBarAttribute)
    static let windows = attribute(kAXWindowsAttribute)
    static let frontmost = attribute(kAXFrontmostAttribute)
    static let hidden = attribute(kAXHiddenAttribute)
    static let mainWindow = attribute(kAXMainWindowAttribute)
    static let focusedWindow = attribute(kAXFocusedWindowAttribute)
    static let focusedUIElement = attribute(kAXFocusedUIElementAttribute)
    static let extrasMenuBar = attribute(kAXExtrasMenuBarAttribute)
    
    /// A convenience attribute whose value is an element that is a header for
    /// another element. For example, an outline element has a header attribute
    /// whose value is a element of role AXGroup that contains the header
    /// buttons for each column. Used for things like tables, outlines, columns,
    /// etc.
    ///
    /// # Value
    ///
    /// An AXUIElementRef whose role varies.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for elements that have header elements contained within them
    /// that an assistive application might want convenient access to.
    static let header = attribute(kAXHeaderAttribute)
    static let edited = attribute(kAXEditedAttribute)
    static let valueWraps = attribute(kAXValueWrapsAttribute)
    static let tabs = attribute(kAXTabsAttribute)
    static let titleUIElement = attribute(kAXTitleUIElementAttribute)
    static let horizontalScrollBar = attribute(kAXHorizontalScrollBarAttribute)
    static let verticalScrollBar = attribute(kAXVerticalScrollBarAttribute)
    static let overflowButton = attribute(kAXOverflowButtonAttribute)
    static let filename = attribute(kAXFilenameAttribute)
    static let expanded = attribute(kAXExpandedAttribute)
    static let selected = attribute(kAXSelectedAttribute)
    static let splitters = attribute(kAXSplittersAttribute)
    static let nextContents = attribute(kAXNextContentsAttribute)
    static let document = attribute(kAXDocumentAttribute)
    static let decrementButton = attribute(kAXDecrementButtonAttribute)
    static let incrementButton = attribute(kAXIncrementButtonAttribute)
    static let previousContents = attribute(kAXPreviousContentsAttribute)
    
    /// A convenience attribute so assistive apps can find interesting child
    /// elements of a given element, while at the same time avoiding
    /// non-interesting child elements. For example, the contents of a scroll
    /// area are the children that get scrolled, and not the horizontal and/or
    /// vertical scroll bars. The contents of a tab group does not include the
    /// tabs themselves.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementRefs.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Recommended for elements that have children that act upon or are
    /// separate from other children.
    static let contents = attribute(kAXContentsAttribute)
    
    /// Convenience attribute that yields the incrementor of a time field or
    /// date field element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXIncrementorRole.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for time field and date field elements that display an
    /// incrementor.
    static let incrementor = attribute(kAXIncrementorAttribute)
    
    /// Convenience attribute that yields the hour field of a time field element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the hours
    /// in a time field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for time field elements that display hours.
    static let hourField = attribute(kAXHourFieldAttribute)
    
    /// Convenience attribute that yields the minute field of a time field
    /// element.
    ///
    /// # Value
    ///
    /// Value: A AXUIElementRef of role kAXTextFieldRole that is used to edit
    /// the minutes in a time field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for time field elements that display minutes.
    static let minuteField = attribute(kAXMinuteFieldAttribute)
    
    /// Convenience attribute that yields the seconds field of a time field
    /// element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the
    /// seconds in a time field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for time field elements that display seconds.
    static let secondField = attribute(kAXSecondFieldAttribute)
    
    /// Convenience attribute that yields the AM/PM field of a time field
    /// element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the AM/PM
    /// setting in a time field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for time field elements that displays an AM/PM setting.
    static let ampmField = attribute(kAXAMPMFieldAttribute)
    
    /// Convenience attribute that yields the day field of a date field element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the day
    /// in a date field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for date field elements that display days.
    static let dayField = attribute(kAXDayFieldAttribute)
    
    /// Convenience attribute that yields the month field of a date field element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the month
    /// in a date field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for date field elements that display months.
    static let monthField = attribute(kAXMonthFieldAttribute)
    
    /// Convenience attribute that yields the year field of a date field element.
    ///
    /// # Value
    ///
    /// A AXUIElementRef of role kAXTextFieldRole that is used to edit the year
    /// in a date field element.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for date field elements that display years.
    static let yearField = attribute(kAXYearFieldAttribute)
    
    static let columnTitle = attribute(kAXColumnTitleAttribute)
    
    /// # Value
    ///
    /// A CFURLRef.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for elements that represent a disk or network item.
    static let url = attribute(kAXURLAttribute)
    static let labelUIElements = attribute(kAXLabelUIElementsAttribute)
    static let labelValue = attribute(kAXLabelValueAttribute)
    static let shownMenuUIElement = attribute(kAXShownMenuUIElementAttribute)
    static let servesAsTitleForUIElements = attribute(kAXServesAsTitleForUIElementsAttribute)
    static let linkedUIElements = attribute(kAXLinkedUIElementsAttribute)
    
    // MARK: table/outline view attributes
    
    static let rows = attribute(kAXRowsAttribute)
    static let visibleRows = attribute(kAXVisibleRowsAttribute)
    static let selectedRows = attribute(kAXSelectedRowsAttribute)
    static let columns = attribute(kAXColumnsAttribute)
    
    /// Indicates the visible column sub-elements of a kAXBrowserRole element.
    /// This is the subset of a browser's kAXColumnsAttribute where each column
    /// in the array is one that is currently scrolled into view within the
    /// browser. It does not include any columns that are currently scrolled out
    /// of view.
    ///
    /// # Value
    ///
    /// A CFArrayRef of AXUIElementRefs representing the columns of a browser.
    /// The columns will be grandchild elements of the browser, and will
    /// generally be of role kAXScrollArea.
    ///
    /// # Writable
    ///
    /// No
    ///
    /// # Availability
    ///
    /// Required for all browser elements.
    static let visibleColumns = attribute(kAXVisibleColumnsAttribute)
    static let selectedColumns = attribute(kAXSelectedColumnsAttribute)
    static let sortDirection = attribute(kAXSortDirectionAttribute)
    
    // MARK: row/column attributes
    
    static let index = attribute(kAXIndexAttribute)
    
    // MARK: outline attributes
    
    static let disclosing = attribute(kAXDisclosingAttribute)
    static let disclosedRows = attribute(kAXDisclosedRowsAttribute)
    static let disclosedByRow = attribute(kAXDisclosedByRowAttribute)
    static let disclosureLevel = attribute(kAXDisclosureLevelAttribute)
    
    // MARK: matte attributes
    
    static let matteHole = attribute(kAXMatteHoleAttribute)
    static let matteContentUIElement = attribute(kAXMatteContentUIElementAttribute)
    
    // MARK: ruler attributes
    
    static let markerUIElements = attribute(kAXMarkerUIElementsAttribute)
    static let units = attribute(kAXUnitsAttribute)
    static let unitDescription = attribute(kAXUnitDescriptionAttribute)
    static let markerType = attribute(kAXMarkerTypeAttribute)
    static let markerTypeDescription = attribute(kAXMarkerTypeDescriptionAttribute)
    
    // MARK: Dock attributes
    
    static let isApplicationRunning = attribute(kAXIsApplicationRunningAttribute)
    
    // MARK: search field attributes
    
    static let searchButton = attribute(kAXSearchButtonAttribute)
    static let clearButton = attribute(kAXClearButtonAttribute)
    
    // MARK: system-wide attributes
    
    static let focusedApplication = attribute(kAXFocusedApplicationAttribute)
    
    // MARK: grid attributes
    
    static let rowCount = attribute(kAXRowCountAttribute)
    static let columnCount = attribute(kAXColumnCountAttribute)
    static let orderedByRow = attribute(kAXOrderedByRowAttribute)
    
    // MARK: level indicator attributes
    
    static let warningValue = attribute(kAXWarningValueAttribute)
    static let criticalValue = attribute(kAXCriticalValueAttribute)
    
    // MARK: cell-based table attributes
    
    static let selectedCells = attribute(kAXSelectedCellsAttribute)
    static let visibleCells = attribute(kAXVisibleCellsAttribute)
    static let rowHeaderUIElements = attribute(kAXRowHeaderUIElementsAttribute)
    static let columnHeaderUIElements = attribute(kAXColumnHeaderUIElementsAttribute)
    
    // MARK: cell attributes
    
    static let rowIndexRange = attribute(kAXRowIndexRangeAttribute)
    static let columnIndexRange = attribute(kAXColumnIndexRangeAttribute)
    
    // MARK: layout area attributes
    
    static let horizontalUnits = attribute(kAXHorizontalUnitsAttribute)
    static let verticalUnits = attribute(kAXVerticalUnitsAttribute)
    static let horizontalUnitDescription = attribute(kAXHorizontalUnitDescriptionAttribute)
    static let verticalUnitDescription = attribute(kAXVerticalUnitDescriptionAttribute)
    static let handles = attribute(kAXHandlesAttribute)
    
    // MARK: obsolete/unknown attributes
    
    static let text = attribute(kAXTextAttribute)
    static let visibleText = attribute(kAXVisibleTextAttribute)
    static let isEditable = attribute(kAXIsEditableAttribute)
    static let columnTitles = attribute(kAXColumnTitlesAttribute)
    
    // MARK: UI element identification attributes
    
    static let identifier = attribute(kAXIdentifierAttribute)
    
    // MARK: UI supporting transient state attributes
    
    static let alternateUIVisible = attribute(kAXAlternateUIVisibleAttribute)
}

// MARK: - Text Suite Parameterized Attributes

/// Text Suite Parameterized Attributes
public extension AXUIElement.Attribute {
    
    static let lineForIndexParameterized = attribute(kAXLineForIndexParameterizedAttribute)
    static let rangeForLineParameterized = attribute(kAXRangeForLineParameterizedAttribute)
    static let stringForRangeParameterized = attribute(kAXStringForRangeParameterizedAttribute)
    static let rangeForPositionParameterized = attribute(kAXRangeForPositionParameterizedAttribute)
    static let rangeForIndexParameterized = attribute(kAXRangeForIndexParameterizedAttribute)
    static let boundsForRangeParameterized = attribute(kAXBoundsForRangeParameterizedAttribute)
    static let rtfForRangeParameterized = attribute(kAXRTFForRangeParameterizedAttribute)
    static let attributedStringForRangeParameterized = attribute(kAXAttributedStringForRangeParameterizedAttribute)
    static let styleRangeForIndexParameterized = attribute(kAXStyleRangeForIndexParameterizedAttribute)
    
    // MARK: cell-based table parameterized attributes
    
    static let cellForColumnAndRowParameterized = attribute(kAXCellForColumnAndRowParameterizedAttribute)
    
    // MARK: layout area parameterized attributes
    
    static let layoutPointForScreenPointParameterized = attribute(kAXLayoutPointForScreenPointParameterizedAttribute)
    static let layoutSizeForScreenSizeParameterized = attribute(kAXLayoutSizeForScreenSizeParameterizedAttribute)
    static let screenPointForLayoutPointParameterized = attribute(kAXScreenPointForLayoutPointParameterizedAttribute)
    static let screenSizeForLayoutSizeParameterized = attribute(kAXScreenSizeForLayoutSizeParameterizedAttribute)
}

#endif // canImport(ApplicationServices)
