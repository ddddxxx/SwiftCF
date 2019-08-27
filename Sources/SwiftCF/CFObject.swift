import CoreFoundation

public extension CFType /* _CFObject */ {
    
    @inlinable var cfDescription: CFString {
        return CFCopyDescription(self)
    }
    
    @inlinable var cfTypeIDDescription: CFString {
        return CFCopyTypeIDDescription(CFGetTypeID(self))
    }
    
    @inlinable func cfEqual(to v: CFTypeRef) -> Bool {
        return CFEqual(self, v)
    }
    
    @inlinable var cfHash: CFHashCode {
        return CFHash(self)
    }
    
    @inlinable var cfRetainCount: CFIndex {
        return CFGetRetainCount(self)
    }
    
    @inlinable var cfAllocator: CFAllocator {
        return CFGetAllocator(self)
    }
}
