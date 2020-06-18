#if canImport(IOKit)

import IOKit.hid

extension IOHIDElement {
    
    public typealias Cookie = IOHIDElementCookie
    public typealias CollectionType = IOHIDElementCollectionType
    
    /// Creates an element from a dictionary.
    ///
    /// The dictionary should contain keys defined in IOHIDKeys.h and start with
    /// kIOHIDElement. This call is meant be used by a
    /// IOHIDDeviceDeviceInterface object.
    ///
    /// - Parameters:
    ///   - allocator: Allocator to be used during creation.
    ///   - dictionary: dictionary containing values in which to create element.
    /// - Returns: Returns a new IOHIDElementRef.
    @inlinable static func create(allocator: CFAllocator = .default, dictionary: [HIDElementKey: Any]) -> IOHIDElement? {
        return IOHIDElementCreateWithDictionary(allocator, dictionary as CFDictionary)
    }
    
    /// Obtain the device associated with the element.
    ///
    /// Returns the a reference to the device.
    @inlinable var device: IOHIDDevice {
        return IOHIDElementGetDevice(self)
    }
    
    /// Returns the parent for the element.
    ///
    /// The parent element can be an element of type kIOHIDElementTypeCollection.
    ///
    /// Returns an IOHIDElementRef referencing the parent element.
    @inlinable var parent: IOHIDElement? {
        return IOHIDElementGetParent(self)
    }
    
    /// Returns the children for the element.
    ///
    /// An element of type kIOHIDElementTypeCollection usually contains children.
    ///
    /// Returns an CFArrayRef containing element objects of type IOHIDElementRef.
    @inlinable var children: [IOHIDElement] {
        return IOHIDElementGetChildren(self) as! [IOHIDElement]? ?? []
    }
    
    /// Establish a relationship between one or more elements.
    ///
    /// This is useful for grouping HID elements with related functionality.
    ///
    /// - Parameter other: The element to be attached. If this parameter is not
    /// a valid IOHIDElementRef, the behavior is undefined.
    @inlinable func attach(to other: IOHIDElement) {
        IOHIDElementAttach(self, other)
    }
    
    /// Remove a relationship between one or more elements.
    ///
    /// This is useful for grouping HID elements with related functionality.
    ///
    /// - Parameter other: The element to be detached. If this parameter is not
    /// a valid IOHIDElementRef, the behavior is undefined.
    @inlinable func detach(to other: IOHIDElement) {
        IOHIDElementDetach(self, other)
    }
    
    /// Obtain attached elements.
    ///
    /// Attached elements are those that have been grouped via
    /// IOHIDElementAttach.
    ///
    /// - Returns: Returns a copy of the current attached elements.
    @inlinable func attachedElements() -> [IOHIDElement] {
        return IOHIDElementCopyAttached(self) as! [IOHIDElement]? ?? []
    }
    
    /// Retrieves the cookie for the element.
    ///
    /// The IOHIDElementCookie represent a unique identifier for an element
    /// within a device.
    @inlinable var cookie: Cookie {
        return IOHIDElementGetCookie(self)
    }
    
    /// Retrieves the type for the element.
    @inlinable var type: IOHIDElementType {
        return IOHIDElementGetType(self)
    }
    
    /// Retrieves the collection type for the element.
    ///
    /// The value returned by this method only makes sense if the element type
    /// is kIOHIDElementTypeCollection.
    @inlinable var collectionType: CollectionType {
        return IOHIDElementGetCollectionType(self)
    }
    
    /// Retrieves the usage page for an element.
    @inlinable var usagePage: HIDPage {
        return HIDPage(rawValue: IOHIDElementGetUsagePage(self))
    }
    
    /// Retrieves the usage for an element.
    @inlinable var usage: HIDUsage {
        return HIDUsage(rawValue: IOHIDElementGetUsage(self))
    }
    
    /// Returns the virtual property for the element.
    ///
    /// Indicates whether the element is a virtual element.
    @inlinable var isVirtual: Bool {
        return IOHIDElementIsVirtual(self)
    }
    
    /// Returns the relative property for the element.
    ///
    /// Indicates whether the data is relative (indicating the change in value
    /// from the last report) or absolute (based on a fixed origin).
    @inlinable var isRelative: Bool {
        return IOHIDElementIsRelative(self)
    }
    
    /// Returns the wrap property for the element.
    ///
    /// Wrap indicates whether the data "rolls over" when reaching either the
    /// extreme high or low value.
    @inlinable var isWrapping: Bool {
        return IOHIDElementIsWrapping(self)
    }
    
    /// Returns the array property for the element.
    ///
    /// Indicates whether the element represents variable or array data values.
    /// Variable values represent data from a physical control. An array returns
    /// an index in each field that corresponds to the pressed button (like
    /// keyboard scan codes). Note: The HID Manager will represent most elements
    /// as "variable" including the possible usages of an array. Array indices
    /// will remain as "array" elements with a usage of 0xffffffff.
    @inlinable var isArray: Bool {
        return IOHIDElementIsArray(self)
    }
    
    /// Returns the linear property for the element.
    ///
    /// Indicates whether the value for the element has been processed in some
    /// way, and no longer represents a linear relationship between what is
    /// measured and the value that is reported.
    @inlinable var isNonLinear: Bool {
        return IOHIDElementIsNonLinear(self)
    }
    
    /// Returns the preferred state property for the element.
    ///
    /// Indicates whether the element has a preferred state to which it will
    /// return when the user is not physically interacting with the control.
    @inlinable var hasPreferredState: Bool {
        return IOHIDElementHasPreferredState(self)
    }
    
    /// Returns the null state property for the element.
    ///
    /// Indicates whether the element has a state in which it is not sending
    /// meaningful data.
    @inlinable var hasNullState: Bool {
        return IOHIDElementHasNullState(self)
    }
    
    /// Returns the name for the element.
    @inlinable var name: CFString {
        return IOHIDElementGetName(self)
    }
    
    /// Returns the report ID for the element.
    ///
    /// The report ID represents what report this particular element belongs to.
    @inlinable var reportID: UInt32 {
        return IOHIDElementGetReportID(self)
    }
    
    /// Returns the report size in bits for the element.
    @inlinable var reportsize: UInt32 {
        return IOHIDElementGetReportSize(self)
    }
    
    /// Returns the report count for the element.
    @inlinable var reportCount: UInt32 {
        return IOHIDElementGetReportCount(self)
    }
    
    /// Returns the unit property for the element.
    ///
    /// The unit property is described in more detail in Section 6.2.2.7 of the
    /// "Device Class Definition for Human Interface Devices(HID)" Specification,
    /// Version 1.11.
    @inlinable var unit: UInt32 {
        return IOHIDElementGetUnit(self)
    }
    
    /// Returns the unit exponenet in base 10 for the element.
    ///
    /// The unit exponent property is described in more detail in Section
    /// 6.2.2.7 of the "Device Class Definition for Human Interface Devices(HID)"
    /// Specification, Version 1.11.
    @inlinable var unitExponent: UInt32 {
        return IOHIDElementGetUnitExponent(self)
    }
    
    /// Returns the minimum value possible for the element.
    ///
    /// This corresponds to the logical minimun, which indicates the lower
    /// bounds of a variable element.
    @inlinable var logicalMin: CFIndex {
        return IOHIDElementGetLogicalMin(self)
    }
    
    /// Returns the maximum value possible for the element.
    ///
    /// This corresponds to the logical maximum, which indicates the upper
    /// bounds of a variable element.
    @inlinable var logicalMax: CFIndex {
        return IOHIDElementGetLogicalMax(self)
    }
    
    /// Returns the scaled minimum value possible for the element.
    ///
    /// Minimum value for the physical extent of a variable element. This
    /// represents the value for the logical minimum with units applied to it.
    @inlinable var physicalMin: CFIndex {
        return IOHIDElementGetPhysicalMin(self)
    }
    
    /// Returns the scaled maximum value possible for the element.
    ///
    /// Maximum value for the physical extent of a variable element. This
    /// represents the value for the logical maximum with units applied to it.
    @inlinable var physicalMax: CFIndex {
        return IOHIDElementGetPhysicalMax(self)
    }
    
    /// Returns the an element property.
    ///
    /// Property keys are prefixed by kIOHIDElement and declared in IOHIDKeys.h.
    ///
    /// - Parameter key: The key to be used when querying the element.
    /// - Returns: Returns the property.
    @inlinable func property(for key: HIDPropertyKey) -> CFTypeRef? {
        return IOHIDElementGetProperty(self, key.rawValue)
    }
    
    /// Sets an element property.
    ///
    /// This method can be used to set arbitrary element properties, such as
    /// application specific references.
    ///
    /// - Parameters:
    ///   - key: The key to be used when querying the element.
    /// - Returns: Returns TRUE if successful.
    @inlinable func setProperty(_ property: CFTypeRef, for key: HIDPropertyKey) -> Bool {
        return IOHIDElementSetProperty(self, key.rawValue, property)
    }
}

#endif // canImport(IOKit)
