#if canImport(IOKit)

import IOKit.hid

public extension IOHIDTransaction {
    
    /// Direction for an IOHIDDeviceTransactionInterface.
    typealias Direction = IOHIDTransactionDirectionType
    
    /// Various options that can be supplied to IOHIDTransaction functions.
    typealias Options = IOHIDTransactionOptions
    
    /// Creates an IOHIDTransaction object for the specified device.
    ///
    /// IOHIDTransaction objects can be used to either send or receive multiple
    /// element values. As such the direction used should represent they type of
    /// objects added to the transaction.
    ///
    /// - Parameters:
    ///   - allocator: Allocator to be used during creation.
    ///   - device: IOHIDDevice object
    ///   - direction: The direction, either in or out, for the transaction.
    ///   - options: Reserved for future use.
    /// - Returns: Returns a new IOHIDTransactionRef.
    @inlinable static func create(allocator: CFAllocator = .default, device: IOHIDDevice, direction: Direction, options: Options) -> IOHIDTransaction? {
        return IOHIDTransactionCreate(allocator, device, direction, options.rawValue)
    }
    
    /// Obtain the device associated with the transaction.
    @inlinable var device: IOHIDDevice {
        return IOHIDTransactionGetDevice(self)
    }
    
    /// Obtain the device associated with the transaction.
    @inlinable var direction: Direction {
        get {
            return IOHIDTransactionGetDirection(self)
        }
        set {
            IOHIDTransactionSetDirection(self, newValue)
        }
    }
    
    /// Adds an element to the transaction
    ///
    /// To minimize device traffic it is important to add elements that share a
    /// common report type and report id.
    ///
    /// - Parameter element: Element to be added to the transaction.
    @inlinable func add(element: IOHIDElement) {
        IOHIDTransactionAddElement(self, element)
    }
    
    /// Removes an element to the transaction
    /// 
    /// - Parameter element: Element to be removed to the transaction.
    @inlinable func remove(element: IOHIDElement) {
        IOHIDTransactionRemoveElement(self, element)
    }
    
    /// Queries the transaction to determine if elemement has been added.
    ///
    /// - Parameter element: Element to be queried.
    /// - Returns: Returns true or false depending if element is present.
    @inlinable func contains(element: IOHIDElement) -> Bool {
        return IOHIDTransactionContainsElement(self, element)
    }
    
    /// Schedules transaction with run loop.
    ///
    /// Formally associates transaction with client's run loop. Scheduling this
    /// transaction with the run loop is necessary before making use of any
    /// asynchronous APIs.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func schedule(with runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDTransactionScheduleWithRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Unschedules transaction with run loop.
    ///
    /// Formally disassociates transaction with client's run loop.
    ///
    /// - Parameters:
    ///   - runLoop: RunLoop to be used when scheduling any asynchronous
    ///   activity.
    ///   - mode: Run loop mode to be used when scheduling any asynchronous
    ///   activity.
    @inlinable func unschedule(from runLoop: CFRunLoop, mode: CFRunLoopMode) {
        IOHIDTransactionUnscheduleFromRunLoop(self, runLoop, mode.rawValue)
    }
    
    /// Sets the value for a transaction element.
    ///
    /// The value set is pended until the transaction is committed and is only
    /// used if the transaction direction is .output. Use the
    /// .defaultOutputValue option to set the default element value.
    ///
    /// - Parameters:
    ///   - value: Value to be set for the given element.
    ///   - element: Element to be modified after a commit.
    ///   - options: See IOHIDTransactionOption.
    @inlinable func setValue(_ value: IOHIDValue, for element: IOHIDElement, options: Options) {
        IOHIDTransactionSetValue(self, element, value, options.rawValue)
    }
    
    /// Obtains the value for a transaction element.
    ///
    /// If the transaction direction is .input the value represents what was
    /// obtained from the device from the transaction. Otherwise, if the
    /// transaction direction is .output the value represents the pending value
    /// to be sent to the device. Use the .defaultOutputValue option to get the
    /// default element value.
    ///
    /// - Parameters:
    ///   - element: Element to be queried.
    ///   - options: See IOHIDTransactionOption.
    /// - Returns: Returns IOHIDValueRef for the given element.
    @inlinable func value(for element: IOHIDElement, options: Options) -> IOHIDValue? {
        return IOHIDTransactionGetValue(self, element, options.rawValue)
    }
    
    /// Synchronously commits element transaction to the device.
    ///
    /// In regards to .output direction, default element values will be used if
    /// element values are not set. If neither are set, that element will be
    /// omitted from the commit. After a transaction is committed, transaction
    /// element values will be cleared and default values preserved.
    ///
    /// - Throws: Throws IOError if failed.
    @inlinable func commit() throws {
        try IOHIDTransactionCommit(self).throwIfIOError()
    }
    
    /// Commits element transaction to the device.
    ///
    /// In regards to .output direction, default element values will be used if
    /// element values are not set. If neither are set, that element will be
    /// omitted from the commit. After a transaction is committed, transaction
    /// element values will be cleared and default values preserved. Note: It is
    /// possible for elements from different reports to be present in a given
    /// transaction causing a commit to transcend multiple reports. Keep this in
    /// mind when setting a appropriate timeout.
    ///
    /// - Parameters:
    ///   - timeout: Timeout for issuing the transaction.
    ///   - callback: Callback of type HIDCallback to be used when transaction
    ///   has been completed. If null, this method will behave synchronously.
    /// - Throws: Throws IOError if failed.
    func commit(timeout: CFTimeInterval, callback: HIDCallback<IOHIDTransaction>?) throws {
        var pContext: UnsafeMutableRawPointer?
        var pCallback: IOHIDCallback?
        if let callback = callback {
            let ctx = HIDCallbackContext<IOHIDTransaction>(callback)
            pContext = Unmanaged.passRetained(ctx).toOpaque()
            pCallback = { ctx, result, sender in
                Unmanaged<HIDCallbackContext<IOHIDTransaction>>
                    .fromOpaque(ctx!)
                    .takeRetainedValue()
                    .callAsFunction(result: result, sender: sender)
            }
        }
        try IOHIDTransactionCommitWithCallback(self, timeout, pCallback, pContext).throwIfIOError()
    }
    
    /// Clears element transaction values.
    ///
    /// In regards to .output direction, default element values will be
    /// preserved.
    @inlinable func clear() {
        IOHIDTransactionClear(self)
    }
}

public extension IOHIDTransaction.Options {
    
    /// Options to be used in conjuntion with an IOHIDDeviceTransactionInterface.
    ///
    /// kIOHIDTransactionOptionDefaultOutputValue Option to set the default
    /// element value to be used with an IOHIDDeviceTransactionInterface of
    /// direction kIOHIDTransactionDirectionTypeOutput.
    static let defaultOutputValue = IOHIDTransaction.Options(rawValue: kIOHIDTransactionOptionDefaultOutputValue)
}

#endif // canImport(IOKit)
