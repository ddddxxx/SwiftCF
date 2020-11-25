import CoreFoundation

// MARK: CFCopying

public protocol CFCopying: CFType {
    associatedtype CopyType: CFType
    func copy(allocator: CFAllocator) -> CopyType
}

public extension CFCopying {
    
    @inlinable func copy() -> CopyType {
        return copy(allocator: .default)
    }
}

// MARK: - CFMutableCopying

public protocol CFMutableCopying: CFType {
    associatedtype MutableCopyType
    func mutableCopy(allocator: CFAllocator) -> MutableCopyType
}

public protocol CFMutableCopyingWithCapacity: CFMutableCopying {
    // FIXME: Only needed for associated type inference.
    override associatedtype MutableCopyType
    func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> MutableCopyType
}

public extension CFMutableCopying {
    @inlinable func mutableCopy(allocator: CFAllocator = .default) -> MutableCopyType {
        return mutableCopy(allocator: allocator)
    }
}

public extension CFMutableCopyingWithCapacity {
    @inlinable func mutableCopy(allocator: CFAllocator = .default, capacity: CFIndex = 0) -> MutableCopyType {
        return mutableCopy(allocator: allocator, capacity: capacity)
    }
}

// MARK: - CFImmutableType

public protocol CFImmutableTypeWithMutablePair: CFCopying, CFMutableCopying where CopyType == Self {
    typealias MutableType = MutableCopyType
}

// MARK: - CFMutableType

public protocol _CFMutableType: CFType {}

public protocol CFMutableType: _CFMutableType, CFMutableCopying where MutableCopyType == Self {}

public protocol _CFMutableTypeWithImmutablePair: _CFMutableType {
    var immutableType: CFType.Type { get }
}

public protocol CFMutableTypeWithImmutablePair: _CFMutableTypeWithImmutablePair, CFMutableType, CFCopying {
    typealias ImmutableType = CopyType
}

extension CFMutableTypeWithImmutablePair where ImmutableType: CFType {
    @inlinable public var immutableType: CFType.Type {
        return ImmutableType.self
    }
}

// MARK: - Conformance

extension CFArray: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFArray {
        return CFArrayCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableArray {
        return CFArrayCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFAttributedString: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFAttributedString {
        return CFAttributedStringCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableAttributedString {
        return CFAttributedStringCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFBag: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFBag {
        return CFBagCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableBag {
        return CFBagCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFBinaryHeap: CFMutableCopyingWithCapacity, CFMutableType {
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFBinaryHeap {
        return CFBinaryHeapCreateCopy(allocator, capacity, self)
    }
}

extension CFBitVector: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFBitVector {
        return CFBitVectorCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableBitVector {
        return CFBitVectorCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFCharacterSet: CFImmutableTypeWithMutablePair {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFCharacterSet {
        return CFCharacterSetCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator) -> CFMutableCharacterSet {
        return CFCharacterSetCreateMutableCopy(allocator, self)
    }
}

extension CFData: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFData {
        return CFDataCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableData {
        return CFDataCreateMutableCopy(allocator, capacity, self)
    }
}
extension CFDictionary: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFDictionary {
        return CFDictionaryCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableDictionary {
        return CFDictionaryCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFSet: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFSet {
        return CFSetCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableSet {
        return CFSetCreateMutableCopy(allocator, capacity, self)
    }
}

extension CFString: CFImmutableTypeWithMutablePair, CFMutableCopyingWithCapacity {
    
    @inlinable public func copy(allocator: CFAllocator) -> CFString {
        return CFStringCreateCopy(allocator, self)
    }
    
    @inlinable public func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> CFMutableString {
        return CFStringCreateMutableCopy(allocator, capacity, self)
    }
}

// MARK: - Mutable Type

extension CFMutableArray: CFMutableTypeWithImmutablePair {}

extension CFMutableAttributedString: CFMutableTypeWithImmutablePair {}

extension CFMutableBag: CFMutableTypeWithImmutablePair {}

extension CFMutableBitVector: CFMutableTypeWithImmutablePair {}

extension CFMutableCharacterSet: CFMutableTypeWithImmutablePair {}

extension CFMutableData: CFMutableTypeWithImmutablePair {}

extension CFMutableDictionary: CFMutableTypeWithImmutablePair {}

extension CFMutableSet: CFMutableTypeWithImmutablePair {}

extension CFMutableString: CFMutableTypeWithImmutablePair {}
