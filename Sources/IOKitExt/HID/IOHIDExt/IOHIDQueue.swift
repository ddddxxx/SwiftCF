#if canImport(IOKit)

import SwiftCF
import IOKit.hid

public extension IOHIDQueue {
    
    /// Creates an IOHIDQueue object for the specified device.
    ///
    /// Take care in specifying an appropriate depth to prevent dropping events.
    ///
    /// - Parameters:
    ///   - allocator: Allocator to be used during creation.
    ///   - device: IOHIDDevice object
    ///   - depth: The number of values that can be handled by the queue.
    ///   - options: Reserved for future use.
    /// - Returns: Returns a new IOHIDQueueRef.
    @inlinable static func create(allocator: CFAllocator = .default, device: IOHIDDevice, depth: CFIndex, options: Options = []) -> IOHIDQueue? {
        return IOHIDQueueCreate(allocator, device, depth, options.rawValue)
    }
    
    /// Obtain the device associated with the queue.
    @inlinable var device: IOHIDDevice {
        return IOHIDQueueGetDevice(self)
    }
    
    /// Obtain/Sets the depth of the queue.
    ///
    /// Set the appropriate depth value based on the number of elements
    /// contained in a queue.
    @inlinable var depth: CFIndex {
        get {
            return IOHIDQueueGetDepth(self)
        }
        set {
            IOHIDQueueSetDepth(self, newValue)
        }
    }
    
    /// Adds an element to the queue
    ///
    /// - Parameter element: Element to be added to the queue.
    @inlinable func add(element: IOHIDElement) {
        IOHIDQueueAddElement(self, element)
    }
    
    /// Removes an element from the queue
    ///
    /// - Parameter element: Element to be removed from the queue.
    @inlinable func remove(element: IOHIDElement) {
        IOHIDQueueRemoveElement(self, element)
    }
    
    /// Queries the queue to determine if elemement has been added.
    ///
    /// - Parameter element: Element to be queried.
    /// - Returns: Returns true or false depending if element is present.
    @inlinable func contains(element: IOHIDElement) -> Bool {
        return IOHIDQueueContainsElement(self, element)
    }
    
    /// Starts element value delivery to the queue.
    ///
    /// When a dispatch queue is assocaited with the IOHIDQueue via
    /// IOHIDQueueSetDispatchQueue, the queue does not need to be explicity
    /// started, this will be done during activation when IOHIDQueueActivate is
    /// called.
    @inlinable func start() {
        IOHIDQueueStart(self)
    }
    
    /// Stops element value delivery to the queue.
    ///
    /// When a dispatch queue is assocaited with the IOHIDQueue via
    /// IOHIDQueueSetDispatchQueue, the queue does not need to be explicity
    /// stopped, this will be done during cancellation when IOHIDQueueCancel
    /// is called.
    @inlinable func stop() {
        IOHIDQueueStop(self)
    }
    
    /// Schedules queue with run loop.
    ///
    /// Formally associates queue with client's run loop. Scheduling this queue
    /// with the run loop is necessary before making use of any asynchronous
    /// APIs.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func schedule(with runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDQueueScheduleWithRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Unschedules queue with run loop.
    ///
    /// Formally disassociates queue with client's run loop.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func unschedule(from runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDQueueUnscheduleFromRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Sets the dispatch queue to be associated with the IOHIDQueue. This is
    /// necessary in order to receive asynchronous events from the kernel.
    ///
    /// An IOHIDQueue should not be associated with both a runloop and dispatch
    /// queue. A call to IOHIDQueueSetDispatchQueue should only be made once.
    ///
    /// If a dispatch queue is set but never used, a call to IOHIDQueueCancel
    /// followed by IOHIDQueueActivate should be performed in that order.
    ///
    /// After a dispatch queue is set, the IOHIDQueue must make a call to
    /// activate via IOHIDQueueActivate and cancel via IOHIDQueueCancel. All
    /// calls to "Register" functions should be done before activation and not
    /// after cancellation.
    ///
    /// - Parameter queue: The dispatch queue to which the event handler block
    /// will be submitted.
    @available(macOS 10.15, *)
    @inlinable func setDispatchQueue(_ queue: DispatchQueue) {
        IOHIDQueueSetDispatchQueue(self, queue)
    }
    
    /// Sets a cancellation handler for the dispatch queue associated with
    /// IOHIDQueueSetDispatchQueue.
    ///
    /// The cancellation handler (if specified) will be will be submitted to the
    /// queue's dispatch queue in response to a call to IOHIDQueueCancel after
    /// all the events have been handled.
    ///
    /// IOHIDQueueSetCancelHandler should not be used when scheduling with a run
    /// loop.
    ///
    /// The IOHIDQueueRef should only be released after the queue has been
    /// cancelled, and the cancel handler has been called. This is to ensure all
    /// asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(queue);
    ///     });
    ///     IOHIDQueueSetCancelHandler(queue, cancelHandler);
    ///     IOHIDQueueActivate(queue);
    ///     IOHIDQueueCancel(queue);
    ///
    /// - Parameter handler: The cancellation handler block to be associated
    /// with the dispatch queue.
    @available(macOS 10.15, *)
    @inlinable func setCancelHandler(_ handler: @escaping () -> Void) {
        IOHIDQueueSetCancelHandler(self, handler)
    }
    
    /// Activates the IOHIDQueue object.
    ///
    /// An IOHIDQueue object associated with a dispatch queue is created in an
    /// inactive state. The object must be activated in order to receive
    /// asynchronous events from the kernel.
    ///
    /// A dispatch queue must be set via IOHIDQueueSetDispatchQueue before
    /// activation.
    ///
    /// An activated queue must be cancelled via IOHIDQueueCancel. All calls to
    /// "Register" functions should be done before activation and not after
    /// cancellation.
    ///
    /// Calling IOHIDQueueActivate on an active IOHIDQueue has no effect.
    @available(macOS 10.15, *)
    @inlinable func activate() {
        IOHIDQueueActivate(self)
    }
    
    /// Cancels the IOHIDQueue preventing any further invocation of its event
    /// handler block.
    ///
    /// Cancelling prevents any further invocation of the event handler block
    /// for the specified dispatch queue, but does not interrupt an event
    /// handler block that is already in progress.
    ///
    /// Explicit cancellation of the IOHIDQueue is required, no implicit
    /// cancellation takes place.
    ///
    /// Calling IOHIDQueueCancel on an already cancelled queue has no effect.
    ///
    /// The IOHIDQueueRef should only be released after the queue has been
    /// cancelled, and the cancel handler has been called. This is to ensure
    /// all asynchronous objects are released. For example:
    ///
    ///     dispatch_block_t cancelHandler = dispatch_block_create(0, ^{
    ///         CFRelease(queue);
    ///     });
    ///     IOHIDQueueSetCancelHandler(queue, cancelHandler);
    ///     IOHIDQueueActivate(queue);
    ///     IOHIDQueueCancel(queue);
    @available(macOS 10.15, *)
    @inlinable func cancel() {
        IOHIDQueueCancel(self)
    }
    
    /// Sets callback to be used when the queue transitions to non-empty.
    ///
    /// In order to make use of asynchronous behavior, the queue needs to be
    /// scheduled with the run loop or dispatch queue. If a dispatch queue is
    /// set, this call must occur before activation.
    ///
    /// - Parameter callback: Callback of type IOHIDCallback to be used when
    /// data is placed on the queue.
    /// - Parameter context: Pointer to data to be passed to the callback.
    @inlinable func registerValueAvailableCallback(context: UnsafeMutableRawPointer?, callback: @escaping IOHIDCallback) {
        IOHIDQueueRegisterValueAvailableCallback(self, callback, context)
    }
    
    /// Dequeues a retained copy of an element value from the head of an
    /// IOHIDQueue.
    ///
    /// Because the value is a retained copy, it is up to the caller to release
    /// the value using CFRelease. Use with setValueCallback to avoid polling
    /// the queue for data.
    ///
    /// - Returns: Returns valid IOHIDValueRef if data is available.
    @inlinable func nextValue() -> IOHIDValue? {
        return IOHIDQueueCopyNextValue(self)
    }
    
    /// Dequeues a retained copy of an element value from the head of an
    /// IOHIDQueue. This method will block until either a value is available or
    /// it times out.
    ///
    /// Because the value is a retained copy, it is up to the caller to release
    /// the value using CFRelease. Use with setValueCallback to avoid polling
    /// the queue for data.
    ///
    /// - Parameter timeout: Timeout before aborting an attempt to dequeue a
    /// value from the head of a queue.
    /// - Returns: Returns valid IOHIDValueRef if data is available.
    @inlinable func nextValue(timeout: CFTimeInterval) -> IOHIDValue? {
        return IOHIDQueueCopyNextValueWithTimeout(self, timeout)
    }
}

public extension IOHIDQueue {
    
    /// Sets callback to be used when the queue transitions to non-empty.
    ///
    /// In order to make use of asynchronous behavior, the queue needs to be
    /// scheduled with the run loop or dispatch queue. If a dispatch queue is
    /// set, this call must occur before activation.
    ///
    /// - Parameter callback: Callback of type HIDCallback to be used when data
    /// is placed on the queue.
    /// - Returns: Callback token. You're responsible to keep this object alive
    /// as long as the callback is registed.
    func registerValueAvailableCallback(_ callback: @escaping HIDCallback<IOHIDQueue>) -> HIDCallbackToken {
        let ctx = HIDCallbackContext<IOHIDQueue>(callback)
        let pctx = Unmanaged.passUnretained(ctx).toOpaque()
        registerValueAvailableCallback(context: pctx) { ctx, result, sender in
            Unmanaged<HIDCallbackContext<IOHIDQueue>>
                .fromOpaque(ctx!)
                .takeUnretainedValue()
                .callAsFunction(result: result, sender: sender)
        }
        return ctx
    }
}

extension IOHIDQueue {
    
    /// Options for opening a device via IOHIDLib.
    public struct Options: RawRepresentable, OptionSet {
        
        public let rawValue: IOOptionBits
        
        public init(rawValue: IOOptionBits) {
            self.rawValue = rawValue
        }
    }
}

#endif // canImport(IOKit)
