#if canImport(ApplicationServices)

import ApplicationServices

/// Assistive applications can register to be notified about certain events in a
/// target application. For example, creation of a window or the destruction of
/// a UIElement. To receive notifications you must first create an observer and
/// specify a callback function; second, add the observer's run loop source to
/// the run loop on which you want the callback executed; and third, register
/// the observer for one or more notifications.
///
/// When you create the observer, you specify the application being observed. An
/// observer can receive notifications only from UIElements in that application.
/// To handle multiple applications, you have to create at least one observer
/// per application.
///
/// When you register an observer for a notification, you specify the UIElement
/// you are interested in observing. When you want to receive a notification
/// from any element in an application, use the application UIElement; you then
/// receive the notification regardless of which element in the application
/// sends the notification. This is useful if the UIElement does not exist yet,
/// such as when a new window is created, or if you care about state changes,
/// such as the keyboard focus moving, without having to observe every element
/// separately. When the callback function is executed it is passed the
/// UIElement that was affected by the notification.
///
/// Observers are represented by the AXObserverRef type, which is a CFType. Like
/// all CFTypes they are reference counted (CFRetain/CFRelease).
public struct AXNotification: CFStringKey {
    
    public let rawValue: CFString
    
    public init(_ key: CFString) {
        rawValue = key
    }
}

private func notification(_ key: String) -> AXNotification {
    return key as CFString as AXNotification
}

/// Focus Notifications
public extension AXNotification {
    
    /// Notification of a change in the main window.
    ///
    /// Value is the new main window UIElement or the Application UIElement if
    /// there's no main window.
    static let mainWindowChanged = notification(kAXMainWindowChangedNotification)
    
    /// Notification that the focused window changed.
    static let focusedWindowChanged = notification(kAXFocusedWindowChangedNotification)
    
    /// Notification that the focused UI element has changed.
    ///
    /// Value is the new focused UIElement or the Application UIElement if
    /// there's no focus
    static let focusedUIElementChanged = notification(kAXFocusedUIElementChangedNotification)
}

/// Application Notifications
public extension AXNotification {
    
    /// Notification that an application was activated.
    ///
    /// Value is an application UIElement.
    static let applicationActivated = notification(kAXApplicationActivatedNotification)
    
    /// Notification that an application was deactivated.
    ///
    /// Value is an application UIElement
    static let applicationDeactivated = notification(kAXApplicationDeactivatedNotification)
    
    /// Notification that an application has been hidden.
    ///
    /// Value is an application UIElement
    static let applicationHidden = notification(kAXApplicationHiddenNotification)
    
    /// Notification that an application is no longer hidden.
    ///
    /// Value is an application UIElement
    static let applicationShown = notification(kAXApplicationShownNotification)
}

/// Window Notifications
public extension AXNotification {
    
    /// Notification that a window was created.
    ///
    /// Value is a new window UIElement
    static let windowCreated = notification(kAXWindowCreatedNotification)
    
    /// Notification that a window moved.
    ///
    /// This notification is sent at the end of the window move, not
    /// continuously as the window is being moved.
    ///
    /// Value is the moved window UIElement
    static let windowMoved = notification(kAXWindowMovedNotification)
    
    /// Notification that a window was resized.
    ///
    /// This notification is sent at the end of the window resize, not
    /// continuously as the window is being resized.
    ///
    /// Value is the resized window UIElement
    static let windowResized = notification(kAXWindowResizedNotification)
    
    /// Notification that a window was minimized.
    ///
    /// Value is the minimized window UIElement
    static let windowMiniaturized = notification(kAXWindowMiniaturizedNotification)
    
    /// Notification that a window is no longer minimized.
    ///
    /// Value is the unminimized window UIElement
    static let windowDeminiaturized = notification(kAXWindowDeminiaturizedNotification)
}

/// New Drawer, Sheet, and Help Notifications
public extension AXNotification {
    
    /// Notification that a drawer was created.
    static let drawerCreated = notification(kAXDrawerCreatedNotification)
    
    /// Notification that a sheet was created.
    static let sheetCreated = notification(kAXSheetCreatedNotification)
    
    /// Notification that a help tag was created.
    static let helpTagCreated = notification(kAXHelpTagCreatedNotification)
}

/// Element Notifications
public extension AXNotification {
    
    /// This notification is sent when the value of the UIElement's `value`
    /// attribute has changed, not when the value of any other attribute has
    /// changed.
    ///
    /// Value is the modified UIElement
    static let valueChanged = notification(kAXValueChangedNotification)
    
    /// The returned UIElement is no longer valid in the target application. You
    /// can still use the local reference with calls like CFEqual (for example,
    /// to remove it from a list), but you should not pass it to the
    /// accessibility APIs.
    ///
    /// Value is the destroyed UIElement
    static let uIElementDestroyed = notification(kAXUIElementDestroyedNotification)
    
    /// Notification that an element's busy state has changed.
    ///
    /// Value is the (un)busy UIElement.
    static let elementBusyChanged = notification(kAXElementBusyChangedNotification)
}

/// Menu Notifications
public extension AXNotification {
    
    /// Notification that a menu has been opened.
    ///
    /// Value is the opened menu UIElement.
    static let menuOpened = notification(kAXMenuOpenedNotification)
    
    /// Notification that a menu has been closed.
    ///
    /// Value is the closed menu UIElement.
    static let menuClosed = notification(kAXMenuClosedNotification)
    
    /// Notification that a menu item has been seleted.
    ///
    /// Value is the selected menu item UIElement.
    static let menuItemSelected = notification(kAXMenuItemSelectedNotification)
}

/// Table/outline notifications
public extension AXNotification {
    
    /// Notification that the number of rows in this table has changed.
    static let rowCountChanged = notification(kAXRowCountChangedNotification)
}

/// Outline notifications
public extension AXNotification {
    
    /// Notification that a row in an outline has been expanded.
    ///
    /// The value is the collapsed row UIElement.
    static let rowExpanded = notification(kAXRowExpandedNotification)
    
    /// Notification that a row in an outline has been collapsed.
    ///
    /// The value is the collapsed row UIElement.
    static let rowCollapsed = notification(kAXRowCollapsedNotification)
}

/// Cell-based table notifications
public extension AXNotification {
    
    /// Notification that the selected cells have changed.
    static let selectedCellsChanged = notification(kAXSelectedCellsChangedNotification)
}

/// Layout area notifications
public extension AXNotification {
    
    /// Notification that the units have changed.
    static let unitsChanged = notification(kAXUnitsChangedNotification)
    
    /// Notification that the selected children have moved.
    static let selectedChildrenMoved = notification(kAXSelectedChildrenMovedNotification)
}

/// Other notifications
public extension AXNotification {
    
    /// Notification that a different subset of this element's children were
    /// selected.
    static let selectedChildrenChanged = notification(kAXSelectedChildrenChangedNotification)
    
    /// Notification that this element has been resized.
    static let resized = notification(kAXResizedNotification)
    
    /// Notification that this element has moved.
    static let moved = notification(kAXMovedNotification)
    
    /// Notification that an element was created.
    static let created = notification(kAXCreatedNotification)
    
    /// Notification that the set of selected rows changed.
    static let selectedRowsChanged = notification(kAXSelectedRowsChangedNotification)
    
    /// Notification that the set of selected columns changed.
    static let selectedColumnsChanged = notification(kAXSelectedColumnsChangedNotification)
    
    /// Notification that a different set of text was selected.
    static let selectedTextChanged = notification(kAXSelectedTextChangedNotification)
    
    /// Notification that the title changed.
    static let titleChanged = notification(kAXTitleChangedNotification)
    
    /// Notification that the layout changed.
    static let layoutChanged = notification(kAXLayoutChangedNotification)
    
    /// Notification to request an announcement to be spoken.
    static let announcementRequested = notification(kAXAnnouncementRequestedNotification)
}

#endif // canImport(ApplicationServices)
