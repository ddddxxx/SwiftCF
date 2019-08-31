import CoreFoundation
import cswiftcf

public extension CFArray {
    
    @inlinable static func create(allocator: CFAllocator = .default, values: UnsafeMutablePointer<UnsafeRawPointer?>?, count: CFIndex, pCallBacks: UnsafePointer<CFArrayCallBacks>? = pCFTypeArrayCallBacks) -> CFArray {
        return CFArrayCreate(allocator, values, count, pCallBacks)
    }
    
    static let empty: CFArray = CFArray.create(values: nil, count: 0)
    
    @inlinable var count: CFIndex {
        return CFArrayGetCount(self)
    }
    
    @inlinable var fullRange: CFRange {
        return CFRange(location: 0, length: count)
    }
    
    @inlinable func count(of value: CFTypeRef) -> CFIndex {
        return count(of: value, in: fullRange)
    }
    
    @inlinable func count(of value: CFTypeRef, in range: CFRange) -> CFIndex {
        return CFArrayGetCountOfValue(self, range, bridge(value))
    }
    
    @inlinable func contains(_ value: CFTypeRef, in range: CFRange? = nil) -> Bool {
        return CFArrayContainsValue(self, range ?? fullRange, bridge(value))
    }
    
    @inlinable func value(at index: CFIndex) -> CFTypeRef {
        return bridge(rawValue(at: index))
    }
    
    @inlinable func rawValue(at index: CFIndex) -> UnsafeRawPointer {
        return CFArrayGetValueAtIndex(self, index)!
    }
    
    @inlinable func values(in range: CFRange) -> [CFTypeRef] {
        guard range.length > 0 else {
            return []
        }
        return Array(unsafeUninitializedCapacity: range.length) { p, count in
            CFArrayGetValues(self, range, UnsafeMutablePointer(OpaquePointer(p.baseAddress)))
            count = range.length
        }
    }
}

extension CFArray: RandomAccessCollection {
    
    @inlinable public var startIndex: Int {
        return 0
    }
    
    @inlinable public var endIndex: Int {
        return count
    }
    
    @inlinable public subscript(position: Int) -> CFTypeRef {
        return value(at: position)
    }
}

// MARK: - CFMutableArray

public extension CFMutableArray {
    
    @inlinable static func create(allocator: CFAllocator = .default, capacity: CFIndex = 0, pCallBacks: UnsafePointer<CFArrayCallBacks>? = pCFTypeArrayCallBacks) -> CFMutableArray {
        return CFArrayCreateMutable(allocator, capacity, pCallBacks)
    }
    
    @inlinable func append(_ value: CFTypeRef) {
        append(rawValue: bridge(value))
    }
    
    @inlinable func append(rawValue: UnsafeRawPointer) {
        CFArrayAppendValue(self, rawValue)
    }
    
    @inlinable func append(contentsOf array: CFArray, range: CFRange? = nil) {
        CFArrayAppendArray(self, array, range ?? array.fullRange)
    }
    
    @inlinable func insert(_ value: CFTypeRef, at index: CFIndex) {
        insert(rawValue: bridge(value), at: index)
    }
    
    @inlinable func insert(rawValue: UnsafeRawPointer, at index: CFIndex) {
        CFArrayInsertValueAtIndex(self, index, rawValue)
    }
    
    @inlinable func set(_ value: CFTypeRef, at index: CFIndex) {
        set(rawValue: bridge(value), at: index)
    }
    
    @inlinable func set(rawValue: UnsafeRawPointer, at index: CFIndex) {
        CFArraySetValueAtIndex(self, index, rawValue)
    }
    
    @inlinable func remove(at index: CFIndex) {
        CFArrayRemoveValueAtIndex(self, index)
    }
    
    @inlinable func removeAll() {
        CFArrayRemoveAllValues(self)
    }
    
    @inlinable func replace(range: CFRange, values: [CFTypeRef]) {
        values.withUnsafeBufferPointer { p in
            CFArrayReplaceValues(self, range, UnsafeMutablePointer(OpaquePointer(p.baseAddress)), values.count)
        }
    }
    
    @inlinable func swapAt(_ i: CFIndex, _ j: CFIndex) {
        CFArrayExchangeValuesAtIndices(self, i, j)
    }
}

