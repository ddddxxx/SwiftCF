#if canImport(IOKit)

import IOKit.hid

public extension IOHIDValue {
    
    /// Creates a new element value using an integer value.
    ///
    /// IOHIDValueGetTimeStamp should represent OS AbsoluteTime, not
    /// CFAbsoluteTime. To obtain the OS AbsoluteTime, please reference the APIs
    /// declared in <mach/mach_time.h>
    ///
    /// - Parameters:
    ///   - allocator: The CFAllocator which should be used to allocate memory
    ///   for the value. This parameter may be NULL in which case the current
    ///   default CFAllocator is used. If this reference is not a valid
    ///   CFAllocator, the behavior is undefined.
    ///   - element: IOHIDElementRef associated with this value.
    ///   - timeStamp: OS absolute time timestamp for this value.
    ///   - value: Integer value to be copied to this object.
    /// - Returns: Returns a reference to a new IOHIDValueRef.
    @inlinable static func create(allocator: CFAllocator = .default, element: IOHIDElement, timeStamp: UInt64 = mach_absolute_time(), value: CFIndex) -> IOHIDValue? {
        return IOHIDValueCreateWithIntegerValue(allocator, element, timeStamp, value)
    }
    
    /// Creates a new element value using byte data.
    ///
    /// IOHIDValueGetTimeStamp should represent OS AbsoluteTime, not
    /// CFAbsoluteTime. To obtain the OS AbsoluteTime, please reference the APIs
    /// declared in <mach/mach_time.h>
    ///
    /// - Parameters:
    ///   - allocator: The CFAllocator which should be used to allocate memory
    ///   for the value. This parameter may be NULL in which case the current
    ///   default CFAllocator is used. If this reference is not a valid
    ///   CFAllocator, the behavior is undefined.
    ///   - element: IOHIDElementRef associated with this value.
    ///   - timeStamp: OS absolute time timestamp for this value.
    ///   - bytes: Pointer to a buffer of uint8_t to be copied to this object.
    /// - Returns: Returns a reference to a new IOHIDValueRef.
    @inlinable static func create(allocator: CFAllocator = .default, element: IOHIDElement, timeStamp: UInt64 = mach_absolute_time(), bytes: UnsafeBufferPointer<UInt8>) -> IOHIDValue? {
        return IOHIDValueCreateWithBytes(allocator, element, timeStamp, bytes.baseAddress!, bytes.count)
    }
    
    /// Returns the element value associated with this IOHIDValueRef.
    @inlinable var element: IOHIDElement {
        return IOHIDValueGetElement(self)
    }
    
    /// Returns the timestamp value contained in this IOHIDValueRef.
    ///
    /// The timestamp value returned represents OS AbsoluteTime, not
    /// CFAbsoluteTime.
    @inlinable var timeStamp: UInt64 {
        return IOHIDValueGetTimeStamp(self)
    }
    
    /// Returns the size, in bytes, of the value contained in this IOHIDValueRef.
    @inlinable var length: CFIndex {
        return IOHIDValueGetLength(self)
    }
    
    /// Returns a byte pointer to the value contained in this IOHIDValueRef.
    @inlinable var bytePtr: UnsafePointer<UInt8> {
        return IOHIDValueGetBytePtr(self)
    }
    
    /// Returns a byte pointer to the value contained in this IOHIDValueRef.
    var bytes: UnsafeBufferPointer<UInt8> {
        return UnsafeBufferPointer(start: bytePtr, count: length)
    }
    
    /// Returns an integer representaion of the value contained in this
    /// IOHIDValueRef.
    ///
    /// The value is based on the logical element value contained in the report
    /// returned by the device.
    @inlinable var integerValue: CFIndex {
        return IOHIDValueGetIntegerValue(self)
    }
    
    /// Returns an scaled representaion of the value contained in this
    /// IOHIDValueRef based on the scale type.
    ///
    /// The scaled value is based on the range described by the scale type's min
    /// and max, such that: scaledValue = ((value - min) * (scaledMax -
    /// scaledMin) / (max - min)) + scaledMin Note: There are currently two
    /// types of scaling that can be applied: kIOHIDValueScaleTypePhysical:
    /// Scales element value using the physical bounds of the device such that
    /// scaledMin = physicalMin and scaledMax = physicalMax.
    /// kIOHIDValueScaleTypeCalibrated: Scales element value such that scaledMin
    /// = -1 and scaledMax = 1. This value will also take into account the
    /// calibration properties associated with this element.
    ///
    /// - Parameter type: The type of scaling to be performed.
    /// - Returns: Returns an scaled floating point representation of the value.
    @inlinable func scaledValue(type: ScaleType) -> double_t {
        return IOHIDValueGetScaledValue(self, type.rawValue)
    }
}

extension IOHIDValue {
    
    /// Describes different types of scaling that can be performed on element
    /// values.
    public struct ScaleType: RawRepresentable {
        
        public let rawValue: IOHIDValueScaleType
        
        public init(rawValue: IOHIDValueScaleType) {
            self.rawValue = rawValue
        }
    }
}

public extension IOHIDValue.ScaleType {
    /// Type for value that is scaled with respect to the calibration properties.
    static let calibrated = IOHIDValue.ScaleType(rawValue: IOHIDValueScaleType(kIOHIDValueScaleTypeCalibrated))
    /// Type for value that is scaled with respect to the physical min and
    /// physical max of the element.
    static let physical = IOHIDValue.ScaleType(rawValue: IOHIDValueScaleType(kIOHIDValueScaleTypePhysical))
    /// Type for value that is scaled with respect to the element's unit
    /// exponent.
    static let exponent = IOHIDValue.ScaleType(rawValue: IOHIDValueScaleType(kIOHIDValueScaleTypeExponent))
}

#endif // canImport(IOKit)
