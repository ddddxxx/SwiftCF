#if canImport(ApplicationServices)

import ApplicationServices

public extension AXUIElement {
    
    /// Returns an accessibility object that provides access to system
    /// attributes.
    ///
    /// This is useful for things like finding the focused accessibility object
    /// regardless of which application is currently active.
    ///
    /// - Returns: The AXUIElementRef representing the system-wide accessibility
    /// object.
    @inlinable static func systemWide() -> AXUIElement {
        return AXUIElementCreateSystemWide()
    }
    
    /// Creates and returns the top-level accessibility object for the
    /// application with the specified process ID.
    ///
    /// - Parameter pid: The process ID of an application.
    /// - Returns: The AXUIElementRef representing the top-level accessibility
    /// object for the application with the specified process ID.
    @inlinable static func create(application pid: pid_t) -> AXUIElement {
        return AXUIElementCreateApplication(pid)
    }
    
    /// Returns the accessibility object at the specified position in top-left
    /// relative screen coordinates.
    ///
    /// This function does hit-testing based on window z-order (that is,
    /// layering). If one window is on top of another window, the returned
    /// accessibility object comes from whichever window is topmost at the
    /// specified location. Note that if the system-wide accessibility object is
    /// passed in the application parameter, the position test is not restricted
    /// to a particular application.
    ///
    /// If unsuccessful, AXUIElementCopyElementAtPosition may return one of the
    /// following error codes, among others:
    /// kAXErrorIllegalArgument: One or more of the arguments is an illegal value.
    /// kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameters:
    ///   - x: The horizontal position.
    ///   - y: The vertical position.
    /// - Throws: Throws AXError if failed.
    /// - Returns: The accessibility object at the position specified by x and y.
    /// Or nil if there is no accessibility object at the specified position.
    @inlinable func elementAt(x: Float, y: Float) throws -> AXUIElement? {
        var element: AXUIElement?
        switch AXUIElementCopyElementAtPosition(self, x, y, &element) {
        case .success: return element!
        case .noValue: return nil
        case let err: throw err
        }
    }
    
    /// Returns the process ID associated with the specified accessibility
    /// object.
    ///
    /// If unsuccessful, AXUIElementGetPid may throw one of the following error
    /// codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    ///
    /// - Throws: Throws AXError if failed.
    /// - Returns: The process ID associated with the specified accessibility object.
    @inlinable func pid() throws -> pid_t {
        var pid: pid_t = -1
        try AXUIElementGetPid(self, &pid).throwIfError()
        return pid
    }
    
    /// Returns a list of all the attributes supported by the specified
    /// accessibility object.
    ///
    /// If unsuccessful, AXUIElementCopyAttributeNames may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or both of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorFailure: There was a system memory failure.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Throws: Throws AXError if failed.
    /// - Returns: An array containing the accessibility object's attribute
    /// names. If the specified AXUIElementRef does not support the specified
    /// attribute, an empty array is returned.
    @inlinable func attributeNames() throws -> [Attribute] {
        var names: CFArray?
        switch AXUIElementCopyAttributeNames(self, &names) {
        case .success: return names! as! [Attribute]
        case .attributeUnsupported: return []
        case let err: throw err
        }
    }
    
    /// Returns the value of an accessibility object's attribute.
    ///
    /// If unsuccessful, AXUIElementCopyAttributeValue may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameter attribute: The attribute name.
    /// - Throws: Throws AXError if failed.
    /// - Returns: The value associated with the specified attribute. If
    /// the specified attribute does not have a value, or the specified
    /// AXUIElementRef does not support the specified attribute, nil is returned.
    @inlinable func attributeValue(for attribute: Attribute) throws -> CFTypeRef? {
        var value: CFTypeRef?
        switch AXUIElementCopyAttributeValue(self, attribute as CFString, &value) {
        case .success: return value!
        case .noValue: return nil
        case let err: throw err
        }
    }
    
    /// Returns the count of the array of an accessibility object's attribute
    /// value.
    ///
    /// If unsuccessful, AXUIElementGetAttributeValueCount may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameter attribute: The attribute name.
    /// - Throws: Throws AXError if failed.
    /// - Returns: The size of the array that is the attribute's value. If the
    /// attribute's value is not an array, or the specified AXUIElementRef does
    /// not support the specified attribute, nil is returned.
    @inlinable func attributeValueCount(for attribute: Attribute) throws -> CFIndex? {
        var count = CFIndex()
        switch AXUIElementGetAttributeValueCount(self, attribute as CFString, &count) {
        case .success: return count
        case .illegalArgument, .attributeUnsupported: return nil
        case let err: throw err
        }
    }
    
    /// Returns an array of attribute values for the accessibility object's
    /// attribute, starting at the specified index.
    ///
    /// This function is useful for dealing with large arrays, for example, a
    /// table view with a large number of children.
    ///
    /// If unsuccessful, AXUIElementCopyAttributeValues may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: The attribute's value is not array, the index
    /// or maxValues arguments are outside the array's range, or one of the
    /// other arguments is an illegal value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameters:
    ///   - attribute: The attribute name.
    ///   - index: The index into the array.
    ///   - maxValues: The maximum number of values you want (this may be more
    ///   or less than the number of values associated with the attribute).
    /// - Throws: Throws AXError if failed.
    /// - Returns: The attribute values you requested. Or nil if the specified
    /// attribute does not have a value. If maxValues is greater than the number
    /// of values associated with the attribute, the values array will contain
    /// values found between index and the end of the attribute's array,
    /// inclusive.
    @inlinable func attributeValues(for attribute: Attribute, index: CFIndex, maxValues: CFIndex) throws -> [CFTypeRef]? {
        var values: CFArray?
        switch AXUIElementCopyAttributeValues(self, attribute as CFString, index, maxValues, &values) {
        case .success: return values! as [CFTypeRef]
        case .noValue: return nil
        case let err: throw err
        }
    }
    
    /// Returns whether the specified accessibility object's attribute can be
    /// modified.
    ///
    /// If you receive a kAXErrorCannotComplete error from this function, you
    /// might want to repeat the request or change the timeout value.
    ///
    /// If unsuccessful, AXUIElementIsAttributeSettable may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way (often due to a timeout).
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameter attribute: The attribute name.
    /// - Throws: Throws AXError if failed.
    /// - Returns: A Boolean value indicating whether the attribute is settable.
    /// If the specified attribute does not have a value, or the specified
    /// AXUIElementRef does not support the specified attribute, false is
    /// returned.
    @inlinable func isAttributeSettable(_ attribute: Attribute) throws -> Bool {
        var settable: DarwinBoolean = false
        switch AXUIElementIsAttributeSettable(self, attribute as CFString, &settable) {
        case .success: return settable.boolValue
        case .noValue, .attributeUnsupported: return false
        case let err: throw err
        }
    }
    
    /// Sets the accessibility object's attribute to the specified value.
    ///
    /// You can send and receive many different CFTypeRefs using the
    /// accessibility API. These include all CFPropertyListRef types,
    /// AXUIElementRef, AXValueRef, AXTextMarkerRef, AXTextMarkerRangeRef,
    /// CFNullRef, CFAttributedStringRef, and CRURLRef.
    ///
    /// If unsuccessful, AXUIElementSetAttributeValue may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: The value is not recognized by the accessible
    /// application or one of the other arguments is an illegal value.
    /// - kAXErrorAttributeUnsupported: The specified AXUIElementRef does not
    /// support the specified attribute.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameters:
    ///   - value: The new value for the attribute.
    ///   - attribute: The attribute name.
    /// - Throws: Throws AXError if failed.
    @inlinable func setAttributeValue(_ value: CFTypeRef, for attribute: Attribute) throws {
        try AXUIElementSetAttributeValue(self, attribute as CFString, value).throwIfError()
    }
    
    /// Returns the values of multiple attributes in the accessibility object.
    ///
    /// If the specified AXUIElementRef does not support an attribute passed in
    /// the attributes array, the returned array can contain an error or CFNull
    /// at the corresponding position.
    ///
    /// If unsuccessful, AXUIElementCopyMultipleAttributeValues may throw one
    /// of the following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One of the arguments is an illegal value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameters:
    ///   - attributes: An array of attribute names.
    ///   - options: A value that tells AXUIElementCopyMultipleAttributeValues
    ///   how to handle errors.
    /// - Throws: Throws AXError if failed.
    /// - Returns: An array in which each position contains the value of the
    /// attribute that is in the corresponding position in the passed-in
    /// attributes array (or nil). If options = 0, the values array can
    /// contain an AXValueRef of type kAXValueAXErrorType in the corresponding
    /// position. If options = kAXCopyMultipleAttributeOptionStopOnError, this
    /// function will return immediately when it gets an error.
    @inlinable func multipleAttributeValues(for attributes: [Attribute], options: AXCopyMultipleAttributeOptions = []) throws -> [CFTypeRef?] {
        var values: CFArray?
        try AXUIElementCopyMultipleAttributeValues(self, attributes as CFArray, options, &values).throwIfError()
        return values!.map(cfUnwrap)
    }
    
    /// Returns a list of all the parameterized attributes supported by the
    /// specified accessibility object.
    ///
    /// If unsuccessful, AXUIElementCopyParameterizedAttributeNames may throw
    /// one of the following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or both of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorFailure: There was some sort of system memory failure.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Throws: Throws AXError if failed.
    /// - Returns: An array containing the accessibility object's parameterized
    /// attribute names. If the specified AXUIElementRef does not support the
    /// specified parameterized attribute, an empty array is returned.
    @inlinable func parameterizedAttributeNames() throws -> [Attribute] {
        var names: CFArray?
        switch AXUIElementCopyParameterizedAttributeNames(self, &names) {
        case .success: return names! as! [Attribute]
        case .noValue, .attributeUnsupported, .parameterizedAttributeUnsupported: return []
        case let err: throw err
        }
        
    }
    
    /// Returns the value of an accessibility object's parameterized attribute.
    ///
    /// If unsuccessful, AXUIElementCopyParameterizedAttributeValue may throw
    /// one of the following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameters:
    ///   - parameterizedAttribute: The parameterized attribute.
    ///   - parameter: The parameter.
    /// - Throws: Throws AXError if failed.
    /// - Returns: The value of the parameterized attribute. If the specified
    /// parameterized attribute does not have a value, or the specified
    /// AXUIElementRef does not support the specified parameterized attribute,
    /// nil is returned.
    @inlinable func parameterizedAttributeValue(for parameterizedAttribute: Attribute, parameter: CFTypeRef) throws -> CFTypeRef? {
        var value: CFTypeRef?
        switch AXUIElementCopyParameterizedAttributeValue(self, parameterizedAttribute as CFString, parameter, &value) {
        case .success: return value!
        case .noValue, .attributeUnsupported, .parameterizedAttributeUnsupported: return nil
        case let err: throw err
        }
    }
    
    /// Returns a list of all the actions the specified accessibility object can
    /// perform.
    ///
    /// If unsuccessful, AXUIElementCopyActionNames may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or both of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorFailure: There was some sort of system memory failure.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Throws: Throws AXError if failed.
    /// - Returns: An array of actions the accessibility object can perform
    /// (empty if the accessibility object supports no actions).
    @inlinable func actionNames() throws -> [Action] {
        var names: CFArray?
        try AXUIElementCopyActionNames(self, &names).throwIfError()
        return names! as! [Action]
    }
    
    /// Returns a localized description of the specified accessibility object's
    /// action.
    ///
    /// If unsuccessful, AXUIElementCopyActionDescription may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorActionUnsupported: The specified AXUIElementRef does not
    /// support the specified action (you will also receive this error if you
    /// pass in the system-wide accessibility object).
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameter action: The action to be described.
    /// - Throws: Throws AXError if failed.
    /// - Returns: A string containing the description of the action.
    @inlinable func actionDescription(_ action: Action) throws -> CFString {
        var desc: CFString?
        try AXUIElementCopyActionDescription(self, action as CFString, &desc).throwIfError()
        return desc!
    }
    
    /// Requests that the specified accessibility object perform the specified
    /// action.
    ///
    /// It is possible to receive the kAXErrorCannotComplete error code from
    /// this function because accessible applications often need to perform some
    /// sort of modal processing inside their action callbacks and they may not
    /// return within the timeout value set by the accessibility API. This does
    /// not necessarily mean that the function has failed, however. If
    /// appropriate, your assistive application can try to call this function
    /// again. Also, you may be able to increase the timeout value (see
    /// AXUIElementSetMessagingTimeout(_:_:)).
    ///
    /// If unsuccessful, AXUIElementPerformAction may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorActionUnsupported: The specified AXUIElementRef does not
    /// support the specified action (you will also receive this error if you
    /// pass in the system-wide accessibility object).
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value.
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    /// - kAXErrorCannotComplete: The function cannot complete because messaging
    /// has failed in some way or the application has not yet responded.
    /// - kAXErrorNotImplemented: The process does not fully support the
    /// accessibility API.
    ///
    /// - Parameter action: The action to be performed.
    /// - Throws: Throws AXError if failed.
    @inlinable func perform(action: Action) throws {
        try AXUIElementPerformAction(self, action as CFString).throwIfError()
    }
    
    /// Sets the timeout value used in the accessibility API.
    ///
    /// Pass the system-wide accessibility object (see
    /// AXUIElementCreateSystemWide()) if you want to set the timeout globally
    /// for this process. Setting the timeout on another accessibility object
    /// sets it only for that object, not for other accessibility objects that
    /// are equal to it.
    ///
    /// Setting timeoutInSeconds to 0 for the system-wide accessibility object
    /// resets the global timeout to its default value. Setting timeoutInSeconds
    /// to 0 for any other accessibility object makes that element use the
    /// current global timeout value.
    ///
    /// If unsuccessful, AXUIElementSetMessagingTimeout may throw one of the
    /// following error codes, among others:
    ///
    /// - kAXErrorIllegalArgument: One or more of the arguments is an illegal
    /// value (timeout values must be positive).
    /// - kAXErrorInvalidUIElement: The AXUIElementRef is invalid.
    ///
    /// - Parameter timeoutInSeconds: The number of seconds for the new timeout
    /// value.
    /// - Throws: Throws AXError if failed.
    @inlinable func SetMessagingTimeout(_ timeoutInSeconds: Float) throws {
        try AXUIElementSetMessagingTimeout(self, timeoutInSeconds).throwIfError()
    }
}

#endif // canImport(ApplicationServices)
