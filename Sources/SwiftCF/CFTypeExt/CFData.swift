import CoreFoundation

public extension CFData {
    
    @inlinable static func create(allocator: CFAllocator = .default, bytes: UnsafePointer<UInt8>?, length: CFIndex) -> CFData {
        return CFDataCreate(allocator, bytes, length)
    }
    
    @inlinable static func createNoCopy(allocator: CFAllocator = .default, bytes: UnsafePointer<UInt8>?, length: CFIndex, bytesDeallocator: CFAllocator) -> CFData {
        return CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator)
    }
    
    @inlinable var length: CFIndex {
        return CFDataGetLength(self)
    }
    
    @inlinable var fullRange: CFRange {
        return CFRange(location: 0, length: length)
    }
    
    @inlinable var bytePtr: UnsafeBufferPointer<UInt8> {
        let p = CFDataGetBytePtr(self)
        return UnsafeBufferPointer(start: p, count: length)
    }
    
    @inlinable subscript(range: CFRange) -> [UInt8] {
        #if swift(>=5.1)
        return Array(unsafeUninitializedCapacity: range.length) { p, count in
            CFDataGetBytes(self, range, p.baseAddress)
            count = range.length
        }
        #else
        return UnsafeMutableBufferPointer<UInt8>.withAutoAllocate(capacity: range.length) { p in
            CFDataGetBytes(self, range, p.baseAddress)
            return Array(p)
        }
        #endif
    }
}

extension CFData: RandomAccessCollection {
    
    @inlinable public var startIndex: Int {
        return 0
    }
    
    @inlinable public var endIndex: Int {
        return length
    }
    
    @inlinable public subscript(position: Int) -> UInt8 {
        return bytePtr[position]
    }
}
