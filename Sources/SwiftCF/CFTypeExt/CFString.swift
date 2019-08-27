import CoreFoundation

public extension CFString {
    
    @inlinable static func create(allocator: CFAllocator = .default, cString: UnsafePointer<Int8>?, encoding: CFStringEncoding)-> CFString {
        return CFStringCreateWithCString(allocator, cString, encoding)
    }
    
    @inlinable static func create(allocator: CFAllocator = .default, bytes: UnsafePointer<UInt8>?, length: CFIndex, encoding: CFStringEncoding, isExternalRepresentation: Bool = false)-> CFString {
        return CFStringCreateWithBytes(allocator, bytes, length, encoding, isExternalRepresentation)
    }
    
    @inlinable static func createNoCopy(allocator: CFAllocator = .default, cString: UnsafePointer<Int8>?, encoding: CFStringEncoding, contentsDeallocator: CFAllocator)-> CFString {
        return CFStringCreateWithCStringNoCopy(allocator, cString, encoding, contentsDeallocator)
    }
    
    @inlinable static func createNoCopy(allocator: CFAllocator = .default, bytes: UnsafePointer<UInt8>?, length: CFIndex, encoding: CFStringEncoding, isExternalRepresentation: Bool = false, contentsDeallocator: CFAllocator)-> CFString {
        return CFStringCreateWithBytesNoCopy(allocator, bytes, length, encoding, isExternalRepresentation, contentsDeallocator)
    }
    
    @inlinable var length: CFIndex {
        return CFStringGetLength(self)
    }
    
    @inlinable var fullRange: CFRange {
        return CFRange(location: 0, length: length)
    }
    
    /// This function either returns the requested pointer immediately, with no memory allocations and no copying, in constant time, or returns NULL.
    @inlinable func cStringPtr(encoding: CFStringEncoding) -> UnsafePointer<Int8>? {
        return CFStringGetCStringPtr(self, encoding)
    }
    
    @inlinable func substring(allocator: CFAllocator = .default, range: CFRange) -> CFString {
        return CFStringCreateWithSubstring(allocator, self, range)
    }
    
    @inlinable var smallestEncoding: CFStringEncoding {
        return CFStringGetSmallestEncoding(self)
    }
    
    @inlinable var fastestEncoding: CFStringEncoding {
        return CFStringGetFastestEncoding(self)
    }
    
    @inlinable static var systemEncoding: CFStringEncoding {
        return CFStringGetSystemEncoding()
    }
}

#if canImport(Carbon)

import Carbon

public extension CFString {
    
    @inlinable static var applicationEncoding: CFStringEncoding {
        return GetApplicationTextEncoding()
    }
}

#endif
