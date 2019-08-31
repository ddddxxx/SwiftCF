import cswiftcf

@usableFromInline let _ALLOCA_S_THRESHOLD = 1024

extension UnsafeMutableRawBufferPointer {
    
    @inlinable static func withStackAllocate<T>(byteCount: Int, alignment: Int, body: (UnsafeMutableRawBufferPointer) -> T) -> T {
        func _withAlloca(size: Int, body: (UnsafeMutableRawPointer) -> Any) -> Any {
            return withoutActuallyEscaping(body) { body in
                return withAlloca(size, body) { ptr, ctx in
                    let body = ctx as! ((UnsafeMutableRawPointer) -> Any)
                    return body(ptr)
                }
            }
        }
        // TODO: align
        return _withAlloca(size: byteCount) { ptr in
            let buffer = UnsafeMutableRawBufferPointer(start: ptr, count: byteCount)
            return body(buffer)
        } as! T
    }
    
    @inlinable static func withAutoAllocate<T>(byteCount: Int, alignment: Int, body: (UnsafeMutableRawBufferPointer) -> T) -> T {
        if byteCount <= _ALLOCA_S_THRESHOLD {
            return withStackAllocate(byteCount: byteCount, alignment: alignment, body: body)
        } else {
            let ptr = UnsafeMutableRawBufferPointer.allocate(byteCount: byteCount, alignment: alignment)
            defer { ptr.deallocate() }
            return body(ptr)
        }
    }
}

extension UnsafeMutableBufferPointer {
    
    @inlinable static func withStackAllocate<T>(capacity: Int, body: (UnsafeMutableBufferPointer<Element>) -> T) -> T {
        let size = capacity * MemoryLayout<Element>.stride
        let alignment = MemoryLayout<Element>.alignment
        return UnsafeMutableRawBufferPointer.withStackAllocate(byteCount: size, alignment: alignment) { ptr in
            return body(ptr.bindMemory(to: Element.self))
        }
    }
    
    @inlinable static func withAutoAllocate<T>(capacity: Int, body: (UnsafeMutableBufferPointer<Element>) -> T) -> T {
        let size = capacity * MemoryLayout<Element>.stride
        let alignment = MemoryLayout<Element>.alignment
        return UnsafeMutableRawBufferPointer.withAutoAllocate(byteCount: size, alignment: alignment) { ptr in
            return body(ptr.bindMemory(to: Element.self))
        }
    }
}

#if swift(<5.1)

extension Array {
    
    init(unsafeUninitializedCapacity: Int, initializingWith initializer: (inout UnsafeMutableBufferPointer<Element>, inout Int) throws -> Void) rethrows {
        try self.init(_unsafeUninitializedCapacity: unsafeUninitializedCapacity, initializingWith: initializer)
    }
}

#endif
