#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

public extension AXObserver {
    
    /// Creates a new observer that can receive notifications from the specified
    /// application.
    ///
    /// When an observed notification is received, it is passed to
    /// AXObserverCallback.
    ///
    /// If unsuccessful, AXObserverCreate may throw one of the following error
    /// codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorFailure: There is some sort of system memory failure.
    ///
    /// - Parameters:
    ///   - application: The process ID of the application.
    ///   - callback: The callback function.
    /// - Throws: Throws AXError if failed.
    /// - Returns: An AXObserverRef representing the observer object.
    @inlinable static func create(application: pid_t, callback: @escaping AXObserverCallback) throws -> AXObserver {
        var result: AXObserver?
        try AXObserverCreate(application, callback, &result).throwIfError()
        return result!
    }
    
    /// Creates a new observer that can receive notifications with an
    /// information dictionary from the specified application.
    ///
    /// When an observed notification is received, it is passed to
    /// AXObserverCallbackWithInfo.
    ///
    /// If unsuccessful, AXObserverCreateWithInfoCallback may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorFailure: There is some sort of system memory failure.
    ///
    /// - Parameters:
    ///   - application: The process ID of the application.
    ///   - callback: The callback function.
    /// - Throws: Throws AXError if failed.
    /// - Returns: An AXObserverRef representing the observer object.
    @inlinable static func create(application: pid_t, callback: @escaping AXObserverCallbackWithInfo) throws -> AXObserver {
        var result: AXObserver?
        try AXObserverCreateWithInfoCallback(application, callback, &result).throwIfError()
        return result!
    }
    
    /// Registers the specified observer to receive notifications from the
    /// specified accessibility object.
    ///
    /// If unsuccessful, AXObserverAddNotification may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorInvalidUIElementObserver: The observer is not a valid
    /// AXObserverRef type.
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value or the length of the notification name is greater than 1024.
    /// - kAXErrorNotificationUnsupported: The accessibility object does not
    /// support notifications (note that the system-wide accessibility object
    /// does not support notifications).
    /// - kAXErrorNotificationAlreadyRegistered: The notification has already
    /// been registered.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorFailure: There is some sort of system memory failure.
    ///
    /// - Parameters:
    ///   - notification: The name of the notification to observe.
    ///   - element: The accessibility object for which to observe notifications.
    ///   - refcon: Application-defined data passed to the callback when it is called.
    /// - Throws: Throws AXError if failed.
    @inlinable func addNotification(_ notification: AXNotification, element: AXUIElement, refcon: UnsafeMutableRawPointer?) throws {
        try AXObserverAddNotification(self, element, notification as CFString, refcon).throwIfError()
    }
    
    /// Removes the specified notification from the list of notifications the
    /// observer wants to receive from the accessibility object.
    ///
    /// If unsuccessful, AXObserverRemoveNotification may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorInvalidUIElementObserver: The observer is not a valid
    /// AXObserverRef type.
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value or the length of the notification name is greater than 1024.
    /// - kAXErrorNotificationUnsupported: The accessibility object does not
    /// support notifications (note that the system-wide accessibility object
    /// does not support notifications).
    /// - kAXErrorNotificationNotRegistered: This observer has not registered
    /// for any notifications.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorFailure: There is some sort of system memory failure.
    ///
    /// - Parameters:
    ///   - notification: The name of the notification to remove from the list
    ///   of observed notifications.
    ///   - element: The accessibility object for which this observer observes
    ///   notifications.
    /// - Throws: Throws AXError if failed.
    @inlinable func removeNotification(_ notification: AXNotification, element: AXUIElement) throws {
        try AXObserverRemoveNotification(self, element, notification as CFString).throwIfError()
    }
    
    /// Returns the observer's run loop source.
    ///
    /// The observer must be added to a run loop before it can receive
    /// notifications. Note that releasing the AXObserverRef automatically
    /// removes the run loop source from the run loop (you can also do this
    /// explicitly by calling CFRunLoopRemoveSource(_:_:_:)).
    ///
    /// runLoopSource might be used in code in this way:
    ///
    ///     CFRunLoopAddSource(CFRunLoopGetCurrent(), observer.runLoopSource, kCFRunLoopDefaultMode);
    @inlinable var runLoopSource: CFRunLoopSource {
        return AXObserverGetRunLoopSource(self)
    }
}

#endif // canImport(ApplicationServices)
