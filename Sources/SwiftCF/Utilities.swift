import CoreFoundation

extension UnsafeRawPointer {
    
    @inlinable
    func asCF() -> CFTypeRef {
        return Unmanaged<CFTypeRef>.fromOpaque(self).takeUnretainedValue()
    }
    
    @inlinable
    static func fromCF(_ v: CFTypeRef) -> UnsafeRawPointer {
        return UnsafeRawPointer(Unmanaged.passUnretained(v).toOpaque())
    }
}

public let pCFTypeArrayCallBacks = withUnsafePointer(to: kCFTypeArrayCallBacks) { return $0 }
public let pCFTypeDictionaryKeyCallBacks = withUnsafePointer(to: kCFTypeDictionaryKeyCallBacks) { return $0 }
public let pCFTypeDictionaryValueCallBacks = withUnsafePointer(to: kCFTypeDictionaryValueCallBacks) { return $0 }

#if swift(<5.1)

extension Array {
    
    @inlinable
    init(unsafeUninitializedCapacity: Int, initializingWith initializer: (inout UnsafeMutableBufferPointer<Element>, inout Int) throws -> Void) rethrows {
        try self.init(_unsafeUninitializedCapacity: unsafeUninitializedCapacity, initializingWith: initializer)
    }
}

#endif
