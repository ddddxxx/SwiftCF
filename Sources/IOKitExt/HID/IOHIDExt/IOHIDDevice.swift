#if canImport(IOKit)

import SwiftCF
import IOKit.hid

public extension IOHIDDevice {
    
    typealias GetValueOptions = IOHIDDeviceGetValueOptions
    
    /// Creates an element from an io_service_t.
    ///
    /// The io_service_t passed in this method must reference an object in the
    /// kernel of type IOHIDDevice.
    ///
    /// - Parameters:
    ///   - allocator: Allocator to be used during creation.
    ///   - service: Reference to service object in the kernel.
    /// - Returns: Returns a new IOHIDDeviceRef.
    @inlinable static func create(allocator: CFAllocator = .default, service: io_service_t) -> IOHIDDevice? {
        return IOHIDDeviceCreate(allocator, service)
    }
    
    /// Returns the io_service_t for an IOHIDDevice, if it has one.
    ///
    /// If the IOHIDDevice references an object in the kernel, this is used to
    /// get the io_service_t for that object.
    @inlinable var service: io_service_t? {
        let service = IOHIDDeviceGetService(self)
        return service == MACH_PORT_NULL ? nil : service
    }
    
    /// Opens a HID device for communication.
    ///
    /// Before the client can issue commands that change the state of the device,
    /// it must have succeeded in opening the device. This establishes a link
    /// between the client's task and the actual device. To establish an
    /// exclusive link use the kIOHIDOptionsTypeSeizeDevice option.
    ///
    /// - Parameter options: Option bits to be sent down to the device.
    /// - Throws: Throws IOError if failed.
    @inlinable func open(options: Options = []) throws {
        try IOHIDDeviceOpen(self, options.rawValue).throwIfIOError()
    }
    
    /// Closes communication with a HID device.
    ///
    /// This closes a link between the client's task and the actual device.
    ///
    /// - Parameter options: Option bits to be sent down to the device.
    /// - Throws: Throws IOError if failed.
    @inlinable func close(options: Options = []) throws {
        try IOHIDDeviceClose(self, options.rawValue).throwIfIOError()
    }
    
    /// Convenience function that scans the Application Collection elements to
    /// see if it conforms to the provided usagePage and usage.
    ///
    /// Examples of Application Collection usages pairs are:
    ///
    ///     usagePage = kHIDPage_GenericDesktop
    ///     usage = kHIDUsage_GD_Mouse
    ///
    /// or
    ///
    ///     usagePage = kHIDPage_GenericDesktop
    ///     usage = kHIDUsage_GD_Keyboard
    ///
    /// - Parameters:
    ///   - usagePage: Device usage page
    ///   - usage: Device usage
    /// - Returns: Returns TRUE if device conforms to provided usage.
    @inlinable func conformsTo(usagePage: HIDPage, usage: HIDUsage) -> Bool {
        return IOHIDDeviceConformsTo(self, usagePage.rawValue, usage.rawValue)
    }
    
    /// Obtains a property from an IOHIDDevice.
    ///
    /// Property keys are prefixed by kIOHIDDevice and declared in
    /// <IOKit/hid/IOHIDKeys.h>.
    ///
    /// - Parameter key: CFStringRef containing key to be used when querying the
    /// device.
    /// - Returns: Returns CFTypeRef containing the property.
    @inlinable func property(for key: HIDPropertyKey) -> CFTypeRef? {
        return IOHIDDeviceGetProperty(self, key.rawValue)
    }
    
    /// Sets a property for an IOHIDDevice.
    ///
    /// Property keys are prefixed by kIOHIDDevice and declared in
    /// <IOKit/hid/IOHIDKeys.h>.
    ///
    /// - Parameters:
    ///   - value: CFTypeRef containg the property to be set.
    ///   - key: CFStringRef containing key to be used when modifiying the
    ///   device property.
    /// - Returns: Returns TRUE if successful.
    @inlinable func setProperty(_ value: CFTypeRef, for key: HIDPropertyKey) -> Bool {
        return IOHIDDeviceSetProperty(self, key.rawValue, value)
    }
    
    /// Obtains HID elements that match the criteria contained in the matching
    /// dictionary.
    ///
    /// Matching keys are prefixed by kIOHIDElement and declared in
    /// <IOKit/hid/IOHIDKeys.h>. Passing a NULL dictionary will result in all
    /// device elements being returned.
    ///
    /// - Parameters:
    ///   - matching: CFDictionaryRef containg element matching criteria.
    ///   - options: Reserved for future use.
    /// - Returns: Returns CFArrayRef containing multiple IOHIDElement object.
    @inlinable func elements(matching: [HIDElementKey: Any]? = nil, options: Options = []) -> [IOHIDElement] {
        return IOHIDDeviceCopyMatchingElements(self, matching.map(CFDictionary.from), options.rawValue)?.asSwift() ?? []
    }
    
    /// Schedules HID device with run loop.
    ///
    /// Formally associates device with client's run loop. Scheduling this
    /// device with the run loop is necessary before making use of any
    /// asynchronous APIs.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func schedule(with runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDDeviceScheduleWithRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Unschedules HID device with run loop.
    ///
    /// Formally disassociates device with client's run loop.
    /// 
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when unscheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when unscheduling any asynchronous
    ///   activity.
    @inlinable func unschedule(from runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDDeviceUnscheduleFromRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Sets the dispatch queue to be associated with the IOHIDDevice. This is
    /// necessary in order to receive asynchronous events from the kernel.
    ///
    /// An IOHIDDevice should not be associated with both a runloop and dispatch
    /// queue. A call to IOHIDDeviceSetDispatchQueue should only be made once.
    ///
    /// If a dispatch queue is set but never used, a call to IOHIDDeviceCancel
    /// followed by IOHIDDeviceActivate should be performed in that order.
    ///
    /// After a dispatch queue is set, the IOHIDDevice must make a call to
    /// activate via IOHIDDeviceActivate and cancel via IOHIDDeviceCancel. All
    /// calls to "Register" functions should be done before activation and not
    /// after cancellation.
    ///
    /// - Parameter queue: The dispatch queue to which the event handler block
    /// will be submitted.
    @available(macOS 10.15, *)
    @inlinable func setDispatchQueue(_ queue: DispatchQueue) {
        IOHIDDeviceSetDispatchQueue(self, queue)
    }
    
    /// Sets a cancellation handler for the dispatch queue associated with
    /// IOHIDDeviceSetDispatchQueue.
    ///
    /// The cancellation handler (if specified) will be will be submitted to the
    /// device's dispatch queue in response to a call to IOHIDDeviceCancel after
    /// all the events have been handled.
    ///
    /// IOHIDDeviceSetCancelHandler should not be used when scheduling with a
    /// run loop.
    ///
    /// The IOHIDDeviceRef should only be released after the device has been
    /// cancelled, and the cancel handler has been called. This is to ensure all
    /// asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(device);
    ///     });
    ///     IOHIDDeviceSetCancelHandler(device, cancelHandler);
    ///     IOHIDDeviceActivate(device);
    ///     IOHIDDeviceCancel(device);
    ///
    /// - Parameter handler: The cancellation handler block to be associated
    /// with the dispatch queue.
    @available(macOS 10.15, *)
    @inlinable func setCancelHandler(_ handler: @escaping () -> Void) {
        IOHIDDeviceSetCancelHandler(self, handler)
    }
    
    /// Activates the IOHIDDevice object.
    ///
    /// An IOHIDDevice object associated with a dispatch queue is created in an
    /// inactive state. The object must be activated in order to receive
    /// asynchronous events from the kernel.
    ///
    /// A dispatch queue must be set via IOHIDDeviceSetDispatchQueue before
    /// activation.
    ///
    /// An activated device must be cancelled via IOHIDDeviceCancel. All calls
    /// to "Register" functions should be done before activation and not after
    /// cancellation.
    ///
    /// Calling IOHIDDeviceActivate on an active IOHIDDevice has no effect.
    @available(macOS 10.15, *)
    @inlinable func activate() {
        IOHIDDeviceActivate(self)
    }
    
    /// Cancels the IOHIDDevice preventing any further invocation of its event
    /// handler block.
    ///
    /// Cancelling prevents any further invocation of the event handler block
    /// for the specified dispatch queue, but does not interrupt an event
    /// handler block that is already in progress.
    ///
    /// Explicit cancellation of the IOHIDDevice is required, no implicit
    /// cancellation takes place.
    ///
    /// Calling IOHIDDeviceCancel on an already cancelled queue has no effect.
    ///
    /// The IOHIDDeviceRef should only be released after the manager has been
    /// cancelled, and the cancel handler has been called. This is to ensure all
    /// asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(manager);
    ///     });
    ///     IOHIDDeviceSetCancelHandler(manager, cancelHandler);
    ///     IOHIDDeviceActivate(manager);
    ///     IOHIDDeviceCancel(manager);
    @available(macOS 10.15, *)
    @inlinable func cancel() {
        IOHIDDeviceCancel(self)
    }
    
    /// Registers a callback to be used when a IOHIDDevice is removed.
    ///
    /// In most cases this occurs when a device is unplugged. If a dispatch
    /// queue is set, this call must occur before activation.
    ///
    /// - Parameter context: Pointer to data to be passed to the callback.
    /// - Parameter callback: Pointer to a callback method of type IOHIDCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    @inlinable func registerRemovalCallback(context: UnsafeMutableRawPointer?, callback: IOHIDCallback?) {
        IOHIDDeviceRegisterRemovalCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when an input value is issued by the
    /// device.
    ///
    /// An input element refers to any element of type kIOHIDElementTypeInput
    /// and is usually issued by interrupt driven reports. If more specific
    /// element values are desired, you can specify matching criteria via
    /// IOHIDDeviceSetInputValueMatching and
    /// IOHIDDeviceSetInputValueMatchingMultiple. If a dispatch queue is set,
    /// this call must occur before activation.
    ///
    /// - Parameters:
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDValueCallback.
    @inlinable func registerInputValueCallback(context: UnsafeMutableRawPointer?, callback: IOHIDValueCallback?) {
        IOHIDDeviceRegisterInputValueCallback(self, callback, context)
    }
    
    /// Registers a callback to be used when an input report is issued by the
    /// device.
    ///
    /// An input report is an interrupt driver report issued by the device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - report: Pointer to preallocated buffer in which to copy inbound
    ///   report data.
    ///   - reportLength: Length of preallocated buffer.
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type IOHIDReportCallback.
    @inlinable func registerInputReportCallback(report: UnsafeMutablePointer<UInt8>, reportLength: CFIndex, context: UnsafeMutableRawPointer?, callback: IOHIDReportCallback?) {
        IOHIDDeviceRegisterInputReportCallback(self, report, reportLength, callback, context)
    }
    
    /// Registers a timestamped callback to be used when an input report is
    /// issued by the device.
    ///
    /// An input report is an interrupt driver report issued by the device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - report: Pointer to preallocated buffer in which to copy inbound
    ///   report data.
    ///   - reportLength: Length of preallocated buffer.
    ///   - context: Pointer to data to be passed to the callback.
    ///   - callback: Pointer to a callback method of type
    ///   IOHIDReportWithTimeStampCallback.
    @inlinable func registerInputReportWithTimeStampCallback(report: UnsafeMutablePointer<UInt8>, reportLength: CFIndex, context: UnsafeMutableRawPointer?, callback: IOHIDReportWithTimeStampCallback?) {
        IOHIDDeviceRegisterInputReportWithTimeStampCallback(self, report, reportLength, callback, context)
    }
    
    /// Sets matching criteria for input values received via
    /// IOHIDDeviceRegisterInputValueCallback.
    ///
    /// Matching keys are prefixed by kIOHIDElement and declared in
    /// <IOKit/hid/IOHIDKeys.h>. Passing a NULL dictionary will result in all
    /// devices being enumerated. Any subsequent calls will cause the hid
    /// manager to release previously matched input elements and restart the
    /// matching process using the revised criteria. If interested in multiple,
    /// specific device elements, please defer to using
    /// IOHIDDeviceSetInputValueMatchingMultiple. If a dispatch queue is set,
    /// this call must occur before activation.
    ///
    /// - Parameter matching: CFDictionaryRef containg device matching criteria.
    @inlinable func setInputValueMatching(_ matching: [HIDElementKey: Any]) {
        IOHIDDeviceSetInputValueMatching(self, .from(matching))
    }
    
    /// Sets multiple matching criteria for input values received via
    /// IOHIDDeviceRegisterInputValueCallback.
    ///
    /// Matching keys are prefixed by kIOHIDElement and declared in
    /// <IOKit/hid/IOHIDKeys.h>. This method is useful if interested in
    /// multiple, specific elements. If a dispatch queue is set, this call must
    /// occur before activation.
    ///
    /// - Parameter multiple: CFArrayRef containing multiple CFDictionaryRef
    /// objects containing input element matching criteria.
    @inlinable func setInputValueMatching(multiple: [[HIDElementKey: Any]]) {
        IOHIDDeviceSetInputValueMatchingMultiple(self, .from(multiple))
    }
    
    /// Sets a value for an element.
    ///
    /// This method behaves synchronously and will block until the report has
    /// been issued to the device. It is only relevent for either output or
    /// feature type elements. If setting values for multiple elements you may
    /// want to consider using IOHIDDeviceSetValueMultiple or IOHIDTransaction.
    ///
    /// - Parameters:
    ///   - element: IOHIDElementRef whose value is to be modified.
    ///   - value: IOHIDValueRef containing value to be set.
    /// - Throws: Throws IOError if failed.
    @inlinable func setValue(_ value: IOHIDValue, for element: IOHIDElement) throws {
        try IOHIDDeviceSetValue(self, element, value).throwIfIOError()
    }
    
    /// Sets multiple values for multiple elements.
    ///
    /// This method behaves synchronously and will block until the report has
    /// been issued to the device. It is only relevent for either output or
    /// feature type elements.
    ///
    /// - Parameter multiple: CFDictionaryRef where key is IOHIDElementRef and
    /// value is IOHIDValueRef.
    /// - Throws: Throws IOError if failed.
    @inlinable func setValues(_ multiple: [IOHIDElement: IOHIDValue]) throws {
        IOHIDDeviceSetValueMultiple(self, .from(multiple))
    }
    
    /// Sets a value for an element and returns status via a completion callback.
    ///
    /// This method behaves asynchronously and will invoke the callback once the
    /// report has been issued to the device. It is only relevent for either
    /// output or feature type elements. If setting values for multiple elements
    /// you may want to consider using IOHIDDeviceSetValueWithCallback or
    /// IOHIDTransaction.
    ///
    /// - Parameters:
    ///   - value: IOHIDValueRef containing value to be set.
    ///   - element: IOHIDElementRef whose value is to be modified.
    ///   - timeout: CFTimeInterval containing the timeout.
    ///   - callback: Pointer to a callback method of type HIDValueCallback.
    /// - Throws: Throws IOError if failed.
    func setValue(_ value: IOHIDValue, for element: IOHIDElement, timeout: CFTimeInterval, callback: @escaping HIDValueCallback<IOHIDDevice>) throws {
        let ctx = HIDValueCallbackContext<IOHIDDevice>(callback)
        try IOHIDDeviceSetValueWithCallback(self, element, value, timeout, { ctx, result, sender, value in
            Unmanaged<HIDValueCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeRetainedValue()
                .callAsFunction(result: result, sender: sender, value: value)
            }, Unmanaged.passRetained(ctx).toOpaque()
        ).throwIfIOError()
    }
    
    /// Sets multiple values for multiple elements and returns status via a
    /// completion callback.
    ///
    /// This method behaves asynchronously and will invoke the callback once the
    /// report has been issued to the device. It is only relevent for either
    /// output or feature type elements.
    ///
    /// - Parameters:
    ///   - multiple: CFDictionaryRef where key is IOHIDElementRef and value is
    ///   IOHIDValueRef.
    ///   - timeout: CFTimeInterval containing the timeout.
    ///   - callback: Pointer to a callback method of type
    ///   HIDValueMultipleCallback.
    /// - Throws: Throws IOError if failed.
    func setValues(_ multiple: [IOHIDElement: IOHIDValue], timeout: CFTimeInterval, callback: @escaping HIDValueMultipleCallback<IOHIDDevice>) throws {
        let ctx = HIDValueMultipleCallbackContext<IOHIDDevice>(callback)
        try IOHIDDeviceSetValueMultipleWithCallback(self, .from(multiple), timeout, { ctx, result, sender, values in
            Unmanaged<HIDValueMultipleCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeRetainedValue()
                .callAsFunction(result: result, sender: sender, values: values)
            }, Unmanaged.passRetained(ctx).toOpaque()
        ).throwIfIOError()
    }
    
    /// Gets a value for an element.
    ///
    /// This method behaves synchronously and return back immediately for input
    /// type element. If requesting a value for a feature element, this will
    /// block until the report has been issued to the device. If obtaining
    /// values for multiple elements you may want to consider using
    /// IOHIDDeviceCopyValueMultiple or IOHIDTransaction.
    ///
    /// - Parameter element: IOHIDElementRef whose value is to be obtained.
    /// - Throws: Throws IOError if failed.
    /// - Returns: IOHIDValueRef to be obtained.
    @inlinable func value(for element: IOHIDElement) throws -> IOHIDValue {
        // TODO: avoid allocation
        let pValue = UnsafeMutablePointer<Unmanaged<IOHIDValue>>.allocate(capacity: 1)
        defer { pValue.deallocate() }
        try IOHIDDeviceGetValue(self, element, pValue).throwIfIOError()
        return pValue.pointee.takeUnretainedValue()
    }
    
    /// Gets a value for an element.
    ///
    /// This method behaves synchronously and return back immediately for input
    /// type element. If requesting a value for a feature element, this will
    /// block until the report has been issued to the device. If obtaining
    /// values for multiple elements you may want to consider using
    /// IOHIDDeviceCopyValueMultiple or IOHIDTransaction.
    ///
    /// - Parameters:
    ///   - element: IOHIDElementRef whose value is to be obtained.
    ///   - options: (see IOHIDDeviceGetValueOptions).
    /// - Throws: Throws IOError if failed.
    /// - Returns: IOHIDValueRef to be obtained.
    @available(OSX 10.13, *)
    @inlinable func value(for element: IOHIDElement, options: GetValueOptions) throws -> IOHIDValue {
        // TODO: avoid allocation
        let pValue = UnsafeMutablePointer<Unmanaged<IOHIDValue>>.allocate(capacity: 1)
        defer { pValue.deallocate() }
        try IOHIDDeviceGetValueWithOptions(self, element, pValue, options.rawValue).throwIfIOError()
        return pValue.pointee.takeUnretainedValue()
    }
    
    /// Copies a values for multiple elements.
    ///
    /// This method behaves synchronously and return back immediately for input
    /// type element. If requesting a value for a feature element, this will
    /// block until the report has been issued to the device.
    ///
    /// - Parameter elements: CFArrayRef containing multiple IOHIDElementRefs
    /// whose values are to be obtained.
    /// - Throws: Throws IOError if failed.
    /// - Returns: CFDictionaryRef where the keys are the provided elements and
    /// the values are the requested values.
    @inlinable func values(for elements: [IOHIDElement]) throws -> [IOHIDElement: IOHIDValue] {
        var pValue: Unmanaged<CFDictionary>?
        try IOHIDDeviceCopyValueMultiple(self, .from(elements), &pValue).throwIfIOError()
        return pValue!.takeUnretainedValue().asSwift()
    }
    
    // TODO: get value with callback
    
    /// Sends a report to the device.
    ///
    /// This method behaves synchronously and will block until the report has
    /// been issued to the device. It is only relevent for either output or
    /// feature type reports.
    ///
    /// - Parameters:
    ///   - type: Type of report being sent.
    ///   - id: ID of the report being sent. If the device supports multiple
    ///   reports, this should also be set in the first byte of the report.
    ///   - report: The report bytes to be sent to the device. Must not be empty.
    /// - Throws: Throws IOError if failed.
    @inlinable func setReport(type: IOHIDReportType, id: CFIndex, report: UnsafeBufferPointer<UInt8>) throws {
        try IOHIDDeviceSetReport(self, type, id, report.baseAddress!, report.count).throwIfIOError()
    }
    
    /// Sends a report to the device.
    ///
    /// This method behaves asynchronously and will block until the report has
    /// been issued to the device. It is only relevent for either output or
    /// feature type reports.
    ///
    /// - Parameters:
    ///   - type: Type of report being sent.
    ///   - id: ID of the report being sent. If the device supports multiple
    ///   reports, this should also be set in the first byte of the report.
    ///   - report: The report bytes to be sent to the device.
    ///   - timeout: CFTimeInterval containing the timeout.
    ///   - callback: Pointer to a callback method of type HIDReportCallback.
    /// - Throws: Throws IOError if failed.
    func setReport(type: IOHIDReportType, id: CFIndex, report: UnsafeBufferPointer<UInt8>, timeout: CFTimeInterval, callback: @escaping HIDReportCallback<IOHIDDevice>) throws {
        let ctx = HIDReportCallbackContext<IOHIDDevice>(reportSize: 0, callback)
        try IOHIDDeviceSetReportWithCallback(self, type, id, report.baseAddress!, report.count, timeout, { ctx, result, sender, type, reportID, report, reportLength in
            Unmanaged<HIDReportCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeRetainedValue()
                .callAsFunction(
                    result: result,
                    sender: sender,
                    type: type,
                    reportID: reportID,
                    report: report,
                    reportLength: reportLength
                )
            }, Unmanaged.passRetained(ctx).toOpaque()
        ).throwIfIOError()
    }
    
    /// Obtains a report from the device.
    ///
    /// This method behaves synchronously and will block until the report has
    /// been received from the device. This is only intended for feature reports
    /// because of sporadic devicesupport for polling input reports. Please
    /// defer to using IOHIDDeviceRegisterInputReportCallback for obtaining
    /// input reports.
    ///
    /// - Parameters:
    ///   - type: Type of report being requested.
    ///   - id: ID of the report being requested.
    ///   - report: Pointer to preallocated buffer in which to copy inbound report data.
    /// - Throws: Throws IOError if failed.
    /// - Returns: the length of the returned report.
    @inlinable func report(type: IOHIDReportType, id: CFIndex, report: UnsafeMutableBufferPointer<UInt8>) throws -> Int {
        var length = report.count
        try IOHIDDeviceGetReport(self, type, id, report.baseAddress!, &length).throwIfIOError()
        return length
    }
    
    func report(type: IOHIDReportType, id: CFIndex, reportSize: CFIndex, timeout: CFTimeInterval, callback: @escaping HIDReportCallback<IOHIDDevice>) throws {
        let ctx = HIDReportCallbackContext<IOHIDDevice>(reportSize: reportSize, callback)
        var length = ctx.reportBuffer.count
        try IOHIDDeviceGetReportWithCallback(self, type, id, ctx.reportBuffer.baseAddress!, &length, timeout, { ctx, result, sender, type, reportID, report, reportLength in
            Unmanaged<HIDReportCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeRetainedValue()
                .callAsFunction(
                    result: result,
                    sender: sender,
                    type: type,
                    reportID: reportID,
                    report: report,
                    reportLength: reportLength
                )
            }, Unmanaged.passRetained(ctx).toOpaque()
        ).throwIfIOError()
    }
}

public extension IOHIDDevice {
    
    /// Registers a callback to be used when a IOHIDDevice is removed.
    ///
    /// In most cases this occurs when a device is unplugged. If a dispatch
    /// queue is set, this call must occur before activation.
    ///
    /// - Parameter callback: Pointer to a callback method of type HIDCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerRemovalCallback(_ callback: @escaping HIDCallback<IOHIDDevice>) -> HIDCallbackToken {
        let ctx = HIDCallbackContext<IOHIDDevice>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerRemovalCallback(context: pctx) { ctx, result, sender in
            Unmanaged<HIDCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender)
        }
        return ctx
    }
    
    /// Registers a callback to be used when an input value is issued by the
    /// device.
    ///
    /// An input element refers to any element of type kIOHIDElementTypeInput
    /// and is usually issued by interrupt driven reports. If more specific
    /// element values are desired, you can specify matching criteria via
    /// IOHIDDeviceSetInputValueMatching and
    /// IOHIDDeviceSetInputValueMatchingMultiple. If a dispatch queue is set,
    /// this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDValueCallback.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerInputValueCallback(_ callback: @escaping HIDValueCallback<IOHIDDevice>) -> HIDCallbackToken {
        let ctx = HIDValueCallbackContext<IOHIDDevice>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerInputValueCallback(context: pctx) { ctx, result, sender, value in
            Unmanaged<HIDValueCallbackContext<IOHIDDevice>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender, value: value)
        }
        return ctx
    }
    
    /// Registers a callback to be used when an input report is issued by the
    /// device.
    ///
    /// An input report is an interrupt driver report issued by the device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type HIDReportCallback.
    ///   - reportSize: Size of preallocated buffer in which to copy inbound
    ///   report data.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerInputReportCallback(_ callback: @escaping HIDReportCallback<IOHIDDevice>, reportSize: CFIndex) -> HIDCallbackToken {
        let ctx = HIDReportCallbackContext<IOHIDDevice>(reportSize: reportSize, callback)
        registerInputReportCallback(
            report: ctx.reportBuffer.baseAddress!,
            reportLength: ctx.reportBuffer.count,
            context: Unmanaged.passUnretained(ctx).toOpaque()
        ) { ctx, result, sender, type, reportID, report, reportLength in
            Unmanaged<HIDReportCallbackContext<IOHIDDevice>>
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
    
    /// Registers a timestamped callback to be used when an input report is
    /// issued by the device.
    ///
    /// An input report is an interrupt driver report issued by the device. If a
    /// dispatch queue is set, this call must occur before activation.
    ///
    /// - Parameters:
    ///   - callback: Pointer to a callback method of type
    ///   SCFIOHIDReportWithTimeStampCallback.
    ///   - reportSize: Size of preallocated buffer in which to copy inbound
    ///   report data.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerInputReportWithTimeStampCallback(_ callback: @escaping HIDReportWithTimeStampCallback<IOHIDDevice>, reportSize: CFIndex) -> HIDCallbackToken {
        let ctx = HIDReportWithTimeStampCallbackContext<IOHIDDevice>(reportSize: reportSize, callback)
        registerInputReportWithTimeStampCallback(
            report: ctx.reportBuffer.baseAddress!,
            reportLength: ctx.reportBuffer.count,
            context: Unmanaged.passUnretained(ctx).toOpaque()
        ) { ctx, result, sender, type, reportID, report, reportLength, timeStamp in
            Unmanaged<HIDReportWithTimeStampCallbackContext<IOHIDDevice>>
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
}

extension IOHIDDevice {
    
    /// Options for opening a device via IOHIDLib.
    public struct Options: RawRepresentable, OptionSet {
        
        public let rawValue: IOHIDOptionsType
        
        public init(rawValue: IOHIDOptionsType) {
            self.rawValue = rawValue
        }
    }
}

public extension IOHIDDevice.Options {
    /// Used to open exclusive communication with the device. This will prevent
    /// the system and other clients from receiving events from the device.
    static let seizeDevice = IOHIDDevice.Options(rawValue: IOHIDOptionsType(kIOHIDOptionsTypeSeizeDevice))
}

#endif // canImport(IOKit)
