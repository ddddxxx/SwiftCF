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
        guard range.length > 0 else {
            return []
        }
        return Array(unsafeUninitializedCapacity: range.length) { p, count in
            CFDataGetBytes(self, range, p.baseAddress)
            count = range.length
        }
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

// MARK: - CFMutableData

public extension CFMutableData {
    
    @inlinable static func create(allocator: CFAllocator = .default, capacity: CFIndex = 0) -> CFMutableData {
        return CFDataCreateMutable(allocator, capacity)
    }
    
    @inlinable var mutableBytePtr: UnsafeMutableBufferPointer<UInt8> {
        let p = CFDataGetMutableBytePtr(self)
        return UnsafeMutableBufferPointer(start: p, count: length)
    }
    
    @inlinable func setLength(_ length: CFIndex) {
        CFDataSetLength(self, length)
    }
    
    @inlinable func increaseLength(_ extraLength: CFIndex) {
        CFDataIncreaseLength(self, extraLength)
    }
    
    @inlinable func append(bytes: UnsafePointer<UInt8>, length: CFIndex) {
        CFDataAppendBytes(self, bytes, length)
    }
    
    @inlinable func replaceBytes(range: CFRange, newBytes: UnsafePointer<UInt8>, length: CFIndex) {
        CFDataReplaceBytes(self, range, newBytes, length)
    }
    
    @inlinable func deleteBytes(range: CFRange) {
        CFDataDeleteBytes(self, range)
    }
}
