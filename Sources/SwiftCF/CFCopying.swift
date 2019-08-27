import CoreFoundation

// MARK: CFCopying

public protocol _CFCopying: CFType {
    static var copyType: CFType.Type { get }
    func _copy(allocator: CFAllocator) -> Any
}

public protocol CFCopying: _CFCopying {
    associatedtype CopyType
    func copy(allocator: CFAllocator) -> CopyType
}

extension CFCopying where CopyType: CFType {
    @inlinable public static var copyType: CFType.Type {
        return CopyType.self
    }
}

public extension CFCopying {
    
    @inlinable func _copy(allocator: CFAllocator) -> Any {
        return copy(allocator: allocator)
    }
    
    @inlinable func copy(allocator: CFAllocator = .default) -> CopyType {
        return copy(allocator: allocator)
    }
}

// MARK: - CFMutableCopying

public protocol _CFMutableCopying: CFType {
    static var mutableCopyType: CFType.Type { get }
    func _mutableCopy(allocator: CFAllocator) -> Any
}

public protocol CFMutableCopying: _CFMutableCopying {
    associatedtype MutableCopyType
    func mutableCopy(allocator: CFAllocator) -> MutableCopyType
}

public protocol CFMutableCopyingWithCapacity: CFMutableCopying {
    // FIXME: Only needed for associated type inference.
    override associatedtype MutableCopyType
    func mutableCopy(allocator: CFAllocator, capacity: CFIndex) -> MutableCopyType
}

public extension CFMutableCopying where MutableCopyType: CFType {
    @inlinable static var mutableCopyType: CFType.Type {
        return MutableCopyType.self
    }
}

public extension CFMutableCopying {
    @inlinable func _mutableCopy(allocator: CFAllocator) -> Any {
        return mutableCopy(allocator: allocator)
    }
    
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

public protocol _CFImmutableTypeWithMutablePair: CFType {
    var mutableType: CFType.Type { get }
}

public protocol CFImmutableTypeWithMutablePair: _CFImmutableTypeWithMutablePair, CFCopying, CFMutableCopying where CopyType == Self {
    typealias MutableType = MutableCopyType
}

extension CFImmutableTypeWithMutablePair where MutableType: CFType {
    @inlinable public var mutableType: CFType.Type {
        return MutableType.self
    }
}

// MARK: - CFMutableType

public protocol _CFMutableType: _CFMutableCopying {}

public protocol CFMutableType: _CFMutableType, CFMutableCopying where MutableCopyType == Self {}

public protocol _CFMutableTypeWithImmutablePair: CFType {
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
