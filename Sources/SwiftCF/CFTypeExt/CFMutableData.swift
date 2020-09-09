import CoreFoundation

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
