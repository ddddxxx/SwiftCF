import CoreFoundation

public extension CFType /* _CFObject */ {
    
    @inlinable static var cfDescription: CFString {
        return CFCopyTypeIDDescription(typeID)
    }
    
    @inlinable var cfDescription: CFString {
        return CFCopyDescription(self)
    }
    
    @inlinable func cfEqual(to v: CFTypeRef) -> Bool {
        return CFEqual(self, v)
    }
    
    @inlinable var cfHash: CFHashCode {
        return CFHash(self)
    }
    
    #if canImport(Darwin)
    @inlinable var cfRetainCount: CFIndex {
        return CFGetRetainCount(self)
    }
    #endif
    
    @inlinable var cfAllocator: CFAllocator {
        return CFGetAllocator(self)
    }
}
