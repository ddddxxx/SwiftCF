import CoreFoundation

public extension CFAllocator {
    
    static let systemDefault = kCFAllocatorSystemDefault!
    static let malloc = kCFAllocatorMalloc!
    static let mallocZone = kCFAllocatorMallocZone!
    static let null = kCFAllocatorNull!
    static let useContext = kCFAllocatorUseContext!
    
    @inlinable static var `default`: CFAllocator {
        get {
            return CFAllocatorGetDefault().takeUnretainedValue()
        }
        set {
            CFAllocatorSetDefault(newValue)
        }
    }
    
    /// Set an allocator as the default in a nested fashion.
    @inlinable func withDefaultAllocator(do body: () throws -> Void) rethrows {
        var previous = CFAllocator.default
        CFAllocator.default = self
        defer {
            CFAllocator.default = previous
        }
        try body()
    }
    
    @inlinable var context: CFAllocatorContext {
        var ctx = CFAllocatorContext()
        CFAllocatorGetContext(self, &ctx)
        return ctx
    }
    
    @inlinable func allocate(size: CFIndex) -> UnsafeMutableRawPointer {
        return CFAllocatorAllocate(self, size, 0)
    }
    
    @inlinable func reallocate(_ ptr: UnsafeMutableRawPointer, newSize: CFIndex) -> UnsafeMutableRawPointer {
        return CFAllocatorReallocate(self, ptr, newSize, 0)
    }
    
    @inlinable func deallocate(_ ptr: UnsafeMutableRawPointer) {
        CFAllocatorDeallocate(self, ptr)
    }
    
    @inlinable func preferredSize(for size: CFIndex) -> CFIndex {
        return CFAllocatorGetPreferredSizeForSize(self, size, 0)
    }
}
