#if canImport(IOKit)

import IOKit.hid

public extension IOHIDManager {
    
    /// Various options that can be supplied to IOHIDManager functions.
    typealias Options = IOHIDManagerOptions
    
    /// Creates an IOHIDManager object.
    ///
    /// The IOHIDManager object is meant as a global management system for
    /// communicating with HID devices.
    ///
    /// - Parameters:
    ///   - allocator: Allocator to be used during creation.
    ///   - options: Supply kIOHIDManagerOptionUsePersistentProperties to load
    ///   properties from the default persistent property store. Otherwise
    ///   supply kIOHIDManagerOptionNone.
    @inlinable static func create(allocator: CFAllocator = .default, options: Options = []) -> IOHIDManager {
        return IOHIDManagerCreate(allocator, options.rawValue)
    }
    
    /// Opens the IOHIDManager.
    ///
    /// This will open both current and future devices that are enumerated. To
    /// establish an exclusive link use the kIOHIDOptionsTypeSeizeDevice option.
    ///
    /// - Parameter options: Option bits to be sent down to the manager and
    /// device.
    /// - Throws: Throws IOError if failed.
    @inlinable func open(options: Options = []) throws {
        try IOHIDManagerOpen(self, options.rawValue).throwIfIOError()
    }
    
    /// Closes the IOHIDManager.
    ///
    /// This will also close all devices that are currently enumerated.
    ///
    /// - Parameter options: Option bits to be sent down to the manager and
    /// device.
    /// - Throws: Throws IOError if failed.
    @inlinable func close(options: Options = []) throws {
        try IOHIDManagerClose(self, options.rawValue).throwIfIOError()
    }
    
    /// Obtains a property of an IOHIDManager.
    ///
    /// Property keys are prefixed by kIOHIDDevice and declared in
    /// <IOKit/hid/IOHIDKeys.h>.
    ///
    /// - Parameter key: key CFStringRef containing key to be used when querying
    /// the manager.
    /// - Returns: CFTypeRef containing the property.
    @inlinable func property(for key: HIDPropertyKey) -> CFTypeRef? {
        return IOHIDManagerGetProperty(self, key.rawValue)
    }
    
    /// Sets a property for an IOHIDManager.
    ///
    /// Property keys are prefixed by kIOHIDDevice and kIOHIDManager and
    /// declared in <IOKit/hid/IOHIDKeys.h>. This method will propagate any
    /// relevent properties to current and future devices that are enumerated.
    ///
    /// - Parameters:
    ///   - value: CFTypeRef containing the property value to be set.
    ///   - key: CFStringRef containing key to be used when modifiying the
    ///   device property.
    /// - Returns: TRUE if successful.
    @inlinable func setProperty(_ value: CFTypeRef, for key: HIDPropertyKey) -> Bool {
        return IOHIDManagerSetProperty(self, key.rawValue, value)
    }
    
    /// Schedules HID manager with run loop.
    ///
    /// Formally associates manager with client's run loop. Scheduling this
    /// device with the run loop is necessary before making use of any
    /// asynchronous APIs. This will propagate to current and future devices
    /// that are enumerated.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func schedule(with runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDManagerScheduleWithRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Unschedules HID manager with run loop.
    ///
    /// Formally disassociates device with client's run loop. This will
    /// propagate to current devices that are enumerated.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when unscheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when unscheduling any asynchronous
    ///   activity.
    @inlinable func unschedule(from runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDManagerUnscheduleFromRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Sets the dispatch queue to be associated with the IOHIDManager. This is
    /// necessary in order to receive asynchronous events from the kernel.
    ///
    /// An IOHIDManager should not be associated with both a runloop and
    /// dispatch queue. A call to IOHIDManagerSetDispatchQueue should only be
    /// made once.
    ///
    /// If a dispatch queue is set but never used, a call to IOHIDManagerCancel
    /// followed by IOHIDManagerActivate should be performed in that order.
    ///
    /// After a dispatch queue is set, the IOHIDManager must make a call to
    /// activate via IOHIDManagerActivate and cancel via IOHIDManagerCancel. All
    /// calls to "Register" functions should be done before activation and not
    /// after cancellation.
    ///
    /// - Parameter queue: The dispatch queue to which the event handler block
    /// will be submitted.
    @available(macOS 10.15, *)
    @inlinable func setDispatchQueue(_ queue: DispatchQueue) {
        IOHIDManagerSetDispatchQueue(self, queue)
    }
    
    /// Sets a cancellation handler for the dispatch queue associated with
    /// IOHIDManagerSetDispatchQueue.
    ///
    /// The cancellation handler (if specified) will be will be submitted to the
    /// manager's dispatch queue in response to a call to IOHIDManagerCancel
    /// after all the events have been handled.
    ///
    /// IOHIDManagerSetCancelHandler should not be used when scheduling with a
    /// run loop.
    ///
    /// The IOHIDManagerRef should only be released after the manager has been
    /// cancelled, and the cancel handler has been called. This is to ensure all
    /// asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(manager);
    ///     });
    ///     IOHIDManagerSetCancelHandler(manager, cancelHandler);
    ///     IOHIDManagerActivate(manager);
    ///     IOHIDManageCancel(manager);
    ///
    /// - Parameter handler: The cancellation handler block to be associated
    /// with the dispatch queue.
    @available(macOS 10.15, *)
    @inlinable func setCancelHandler(_ handler: @escaping () -> Void) {
        IOHIDManagerSetCancelHandler(self, handler)
    }
    
    /// Activates the IOHIDManager object.
    ///
    /// An IOHIDManager object associated with a dispatch queue is created in an
    /// inactive state. The object must be activated in order to receive
    /// asynchronous events from the kernel.
    ///
    /// A dispatch queue must be set via IOHIDManagerSetDispatchQueue before
    /// activation.
    ///
    /// An activated manager must be cancelled via IOHIDManagerCancel. All calls
    /// to "Register" functions should be done before activation and not after
    /// cancellation.
    ///
    /// Calling IOHIDManagerActivate on an active IOHIDManager has no effect.
    @available(macOS 10.15, *)
    @inlinable func activate() {
        IOHIDManagerActivate(self)
    }
    
    /// Cancels the IOHIDManager preventing any further invocation of its event
    /// handler block.
    ///
    /// Cancelling prevents any further invocation of the event handler block
    /// for the specified dispatch queue, but does not interrupt an event
    /// handler block that is already in progress.
    ///
    /// Explicit cancellation of the IOHIDManager is required, no implicit
    /// cancellation takes place.
    ///
    /// Calling IOHIDManagerCancel on an already cancelled queue has no effect.
    ///
    /// The IOHIDManagerRef should only be released after the manager has been
    /// cancelled, and the cancel handler has been called. This is to ensure all
    /// asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(manager);
    ///     });
    ///     IOHIDManagerSetCancelHandler(manager, cancelHandler);
    ///     IOHIDManagerActivate(manager);
    ///     IOHIDManageCancel(manager);
    @available(macOS 10.15, *)
    @inlinable func cancel() {
        IOHIDManagerCancel(self)
    }
    
    /// Sets matching criteria for device enumeration.
    ///
    /// Matching keys are prefixed by kIOHIDDevice and declared in
    /// <IOKit/hid/IOHIDKeys.h>. Passing a NULL dictionary will result in all
    /// devices being enumerated. Any subsequent calls will cause the hid
    /// manager to release previously enumerated devices and restart the
    /// enuerate process using the revised criteria. If interested in multiple,
    /// specific device classes, please defer to using
    /// IOHIDManagerSetDeviceMatchingMultiple. If a dispatch queue is set, this
    /// call must occur before activation.
    ///
    /// - Parameter matching: matching CFDictionaryRef containg device matching criteria.
    @inlinable func setDeviceMatching(_ matching: [HIDPropertyKey: Any]) {
        IOHIDManagerSetDeviceMatching(self, matching as CFDictionary)
    }
    
    /// Sets multiple matching criteria for device enumeration.
    ///
    /// Matching keys are prefixed by kIOHIDDevice and declared in
    /// <IOKit/hid/IOHIDKeys.h>. This method is useful if interested in
    /// multiple, specific device classes. If a dispatch queue is set, this call
    /// must occur before activation.
    /// 
    /// - Parameter multiple: CFArrayRef containing multiple CFDictionaryRef
    /// objects containg device matching criteria.
    @inlinable func setDeviceMatching(multiple: [[HIDPropertyKey: Any]]) {
        IOHIDManagerSetDeviceMatchingMultiple(self, multiple as CFArray)
    }
    
    /// Obtains currently enumerated devices.
    @inlinable func devices() -> Set<IOHIDDevice> {
        return IOHIDManagerCopyDevices(self) as! Set<IOHIDDevice>? ?? []
    }
    
    /// Registers a callback to be used a device is enumerated.
    ///
    /// Only device matching the set criteria will be enumerated. If a dispatch
    /// queue is set, this call must occur before activation. Devices provided
    /// in the callback will be scheduled with the same runloop/dispatch queue
    /// as the IOHIDManagerRef, and should not be rescheduled.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDDeviceCallback.
    @inlinable func registerDeviceMatchingCallback(context: UnsafeMutableRawPointer?, callback: IOHIDDeviceCallback?) {
        IOHIDManagerRegisterDeviceMatchingCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when any enumerated device is removed.
    ///
    /// In most cases this occurs when a device is unplugged. If a dispatch
    /// queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDDeviceCallback.
    @inlinable func registerDeviceRemovalCallback(context: UnsafeMutableRawPointer?, callback: IOHIDDeviceCallback?) {
        IOHIDManagerRegisterDeviceRemovalCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when an input report is issued by any
    /// enumerated device.
    ///
    /// An input report is an interrupt driver report issued by a device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDReportCallback.
    @inlinable func registerInputReportCallback(context: UnsafeMutableRawPointer?, callback: IOHIDReportCallback?) {
        IOHIDManagerRegisterInputReportCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when an input report is issued by any
    /// enumerated device.
    ///
    /// An input report is an interrupt driver report issued by a device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type
    ///   IOHIDReportWithTimeStampCallback.
    @available(OSX 10.15, *)
    @inlinable func registerInputReportWithTimeStampCallback(context: UnsafeMutableRawPointer?, callback: @escaping IOHIDReportWithTimeStampCallback) {
        IOHIDManagerRegisterInputReportWithTimeStampCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when an input value is issued by any
    /// enumerated device.
    ///
    /// An input element refers to any element of type kIOHIDElementTypeInput
    /// and is usually issued by interrupt driven reports. If a dispatch queue
    /// is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDValueCallback.
    @inlinable func registerInputValueCallback(context: UnsafeMutableRawPointer?, callback: @escaping IOHIDValueCallback) {
        IOHIDManagerRegisterInputValueCallback(self, callback, context)
    }
    
    /// Sets matching criteria for input values received via
    /// IOHIDManagerRegisterInputValueCallback.
    ///
    /// Matching keys are prefixed by kIOHIDElement and declared in
    /// <IOKit/hid/IOHIDKeys.h>. Passing a NULL dictionary will result in all
    /// devices being enumerated. Any subsequent calls will cause the hid
    /// manager to release previously matched input elements and restart the
    /// matching process using the revised criteria. If interested in multiple,
    /// specific device elements, please defer to using
    /// IOHIDManagerSetInputValueMatchingMultiple. If a dispatch queue is set,
    /// this call must occur before activation.
    ///
    /// - Parameter matching: CFDictionaryRef containg device matching criteria.
    @inlinable func setInputValueMatching(_ matching: [HIDElementKey: Any]) {
        IOHIDManagerSetInputValueMatching(self, matching as CFDictionary)
    }
    
    /// Sets multiple matching criteria for input values received via
    /// IOHIDManagerRegisterInputValueCallback.
    ///
    /// Matching keys are prefixed by kIOHIDElement and declared in
    /// <IOKit/hid/IOHIDKeys.h>. This method is useful if interested in
    /// multiple, specific elements. If a dispatch queue is set, this call must
    /// occur before activation.
    ///
    /// - Parameter multiple: CFArrayRef containing multiple CFDictionaryRef
    /// objects containing input element matching criteria.
    @inlinable func setInputValueMatching(multiple: [[HIDElementKey: Any]]) {
        IOHIDManagerSetInputValueMatchingMultiple(self, multiple as CFArray)
    }
    
    /// Used to write out the current properties to a specific domain.
    ///
    /// Using this function will cause the persistent properties to be saved out
    /// replacing any properties that already existed in the specified domain.
    /// All arguments must be non-NULL except options.
    ///
    /// - parameter applicationID: Reference to a CFPreferences applicationID.
    /// - parameter userName: Reference to a CFPreferences userName.
    /// - parameter hostName: Reference to a CFPreferences hostName.
    /// - parameter options: Reserved for future use.
    @inlinable func saveToPropertyDomain(applicationID: CFString, userName: CFString, hostName: CFString, options: Options = []) {
        IOHIDManagerSaveToPropertyDomain(self, applicationID, userName, hostName, options.rawValue)
    }
}

public extension IOHIDManager {
    
    /// Registers a callback to be used a device is enumerated.
    ///
    /// Only device matching the set criteria will be enumerated. If a dispatch
    /// queue is set, this call must occur before activation. Devices provided
    /// in the callback will be scheduled with the same runloop/dispatch queue
    /// as the IOHIDManagerRef, and should not be rescheduled.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDDeviceCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerDeviceMatchingCallback(callback: @escaping HIDDeviceCallback<IOHIDManager>) -> HIDCallbackToken {
        let ctx = HIDDeviceCallbackContext<IOHIDManager>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerDeviceMatchingCallback(context: pctx) { ctx, result, sender, device in
            Unmanaged<HIDDeviceCallbackContext<IOHIDManager>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender, device: device)
        }
        return ctx
    }
    
    /// Registers a callback to be used when any enumerated device is removed.
    ///
    /// In most cases this occurs when a device is unplugged. If a dispatch
    /// queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDDeviceCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerDeviceRemovalCallback(callback: @escaping HIDDeviceCallback<IOHIDManager>) -> HIDCallbackToken {
        let ctx = HIDDeviceCallbackContext<IOHIDManager>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerDeviceRemovalCallback(context: pctx) { ctx, result, sender, device in
            Unmanaged<HIDDeviceCallbackContext<IOHIDManager>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender, device: device)
        }
        return ctx
    }
    
    /// Registers a callback to be used when an input report is issued by any
    /// enumerated device.
    ///
    /// An input report is an interrupt driver report issued by a device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDReportCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerInputReportCallback(callback: @escaping HIDReportCallback<IOHIDManager>) -> HIDCallbackToken {
        let ctx = HIDReportCallbackContext<IOHIDManager>(reportSize: 0, callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerInputReportCallback(context: pctx) { ctx, result, sender, type, reportID, report, reportLength in
            Unmanaged<HIDReportCallbackContext<IOHIDManager>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(
                    result: result,
                    sender: sender,
                    type: type,
                    reportID: reportID,
                    report: report,
                    reportLength: reportLength
                )
        }
        return ctx
    }
    
    /// Registers a callback to be used when an input report is issued by any
    /// enumerated device.
    ///
    /// An input report is an interrupt driver report issued by a device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type
    ///   HIDReportWithTimeStampCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    @available(OSX 10.15, *)
    func registerInputReportWithTimeStampCallback(callback: @escaping HIDReportWithTimeStampCallback<IOHIDManager>) -> HIDCallbackToken {
        let ctx = HIDReportWithTimeStampCallbackContext<IOHIDManager>(reportSize: 0, callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerInputReportWithTimeStampCallback(context: pctx) { ctx, result, sender, type, reportID, report, reportLength, timeStamp in
            Unmanaged<HIDReportWithTimeStampCallbackContext<IOHIDManager>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(
                    result: result,
                    sender: sender,
                    type: type,
                    reportID: reportID,
                    report: report,
                    reportLength: reportLength,
                    timeStamp: timeStamp
                )
        }
        return ctx
    }
    
    /// Registers a callback to be used when an input value is issued by any
    /// enumerated device.
    ///
    /// An input element refers to any element of type kIOHIDElementTypeInput
    /// and is usually issued by interrupt driven reports. If a dispatch queue
    /// is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDValueCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerInputValueCallback(callback: @escaping HIDValueCallback<IOHIDManager>) -> HIDCallbackToken {
        let ctx = HIDValueCallbackContext<IOHIDManager>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerInputValueCallback(context: pctx) { ctx, result, sender, value in
            Unmanaged<HIDValueCallbackContext<IOHIDManager>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender, value: value)
        }
        return ctx
    }
}

#endif // canImport(IOKit)
