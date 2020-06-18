#if canImport(IOKit)

import IOKit.hid

public protocol HIDCallbackToken: AnyObject {}

/// Convenient wrapper of IOHIDCallback in which you can capture other variables.
public typealias HIDCallback<Sender> = (_ error: IOError?, _ sender: Sender?) -> Void

class HIDCallbackContext<Sender>: HIDCallbackToken {
    
    let callback: HIDCallback<Sender>
    
    init(_ callback: @escaping HIDCallback<Sender>) {
        self.callback = callback
    }
    
    func callAsFunction(result: IOReturn, sender: UnsafeMutableRawPointer?) {
        let sender = sender?.assumingMemoryBound(to: Sender.self).pointee
        let error = IOError(rawValue: result)
        callback(error, sender)
    }
}

/// Convenient wrapper of IOHIDValueCallback in which you can capture other variables.
public typealias HIDValueCallback<Sender> = (_ value: IOHIDValue, _ error: IOError?, _ sender: Sender?) -> Void

class HIDValueCallbackContext<Sender>: HIDCallbackToken {
    
    let callback: HIDValueCallback<Sender>
    
    init(_ callback: @escaping HIDValueCallback<Sender>) {
        self.callback = callback
    }
    
    func callAsFunction(result: IOReturn, sender: UnsafeMutableRawPointer?, value: IOHIDValue) {
        let sender = sender?.assumingMemoryBound(to: Sender.self).pointee
        let error = IOError(rawValue: result)
        callback(value, error, sender)
    }
}

public typealias HIDValueMultipleCallback<Sender> = (_ values: [IOHIDElement: IOHIDValue], _ error: IOError?, _ sender: Sender?) -> Void

class HIDValueMultipleCallbackContext<Sender>: HIDCallbackToken {
    
    let callback: HIDValueMultipleCallback<Sender>
    
    init(_ callback: @escaping HIDValueMultipleCallback<Sender>) {
        self.callback = callback
    }
    
    func callAsFunction(result: IOReturn, sender: UnsafeMutableRawPointer?, values: CFDictionary) {
        let sender = sender?.assumingMemoryBound(to: Sender.self).pointee
        let error = IOError(rawValue: result)
        callback(values as! [IOHIDElement: IOHIDValue], error, sender)
    }
}

public typealias HIDReportCallback<Sender> = (_ type: IOHIDReportType, _ reportID: UInt32, _ report: UnsafeBufferPointer<UInt8>, _ error: IOError?, _ sender: Sender?) -> Void

class HIDReportCallbackContext<Sender>: HIDCallbackToken {
    
    let callback: HIDReportCallback<Sender>
    
    let reportBuffer: UnsafeMutableBufferPointer<UInt8>
    
    init(reportSize: Int, _ callback: @escaping HIDReportCallback<Sender>) {
        self.reportBuffer = reportSize > 0 ? .allocate(capacity: reportSize) : .init(start: nil, count: 0)
        self.callback = callback
    }
    
    deinit {
        reportBuffer.deallocate()
    }
    
    func callAsFunction(result: IOReturn, sender: UnsafeMutableRawPointer?, type: IOHIDReportType, reportID: UInt32, report: UnsafeMutablePointer<UInt8>, reportLength: CFIndex) {
        let sender = sender?.assumingMemoryBound(to: Sender.self).pointee
        let error = IOError(rawValue: result)
        let report = UnsafeBufferPointer(start: report, count: reportLength)
        callback(type, reportID, report, error, sender)
    }
}

public typealias HIDReportWithTimeStampCallback<Sender> = (_ type: IOHIDReportType, _ reportID: UInt32, _ report: UnsafeBufferPointer<UInt8>, _ timeStamp: UInt64, _ error: IOError?, _ sender: Sender?) -> Void

class HIDReportWithTimeStampCallbackContext<Sender>: HIDCallbackToken {
    
    let callback: HIDReportWithTimeStampCallback<Sender>
    
    let reportBuffer: UnsafeMutableBufferPointer<UInt8>
    
    init(reportSize: Int, _ callback: @escaping HIDReportWithTimeStampCallback<Sender>) {
        self.reportBuffer = reportSize > 0 ? .allocate(capacity: reportSize) : .init(start: nil, count: 0)
        self.callback = callback
    }
    
    deinit {
        reportBuffer.deallocate()
    }
    
    func callAsFunction(result: IOReturn, sender: UnsafeMutableRawPointer?, type: IOHIDReportType, reportID: UInt32, report: UnsafeMutablePointer<UInt8>, reportLength: CFIndex, timeStamp: UInt64) {
        let sender = sender?.assumingMemoryBound(to: Sender.self).pointee
        let error = IOError(rawValue: result)
        let report = UnsafeBufferPointer(start: report, count: reportLength)
        callback(type, reportID, report, timeStamp, error, sender)
    }
}

#endif // canImport(IOKit)
