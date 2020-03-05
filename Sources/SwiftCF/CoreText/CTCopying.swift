#if canImport(CoreText)

import CoreText

extension CTFont: CFCopying {
    
    @inlinable public func copy(size: CGFloat = 0, matrix: CGAffineTransform? = nil, attributes: CTFontDescriptor? = nil) -> CTFont {
        return withUnsafePointer(to: matrix ?? self.matrix) { mtx in
            return CTFontCreateCopyWithAttributes(self, 0, mtx, attributes)
        }
    }
    
    @inlinable public func copy(allocator: CFAllocator) -> CTFont {
        return copy()
    }
}

extension CTRubyAnnotation: CFCopying {
    
    @inlinable public func copy(allocator: CFAllocator) -> CTRubyAnnotation {
        return CTRubyAnnotationCreateCopy(self)
    }
}

extension CTFontCollection: CFCopying {
    
    @inlinable public func copy(queryDescriptors: [CTFontDescriptor] = [], options: CFDictionary = .empty) -> CTFontCollection {
        return CTFontCollectionCreateCopyWithFontDescriptors(self, queryDescriptors as CFArray, options)
    }
    
    @inlinable public func copy(allocator: CFAllocator) -> CTFontCollection {
        return copy()
    }
}

#if os(macOS)

extension CTFontCollection: CFImmutableTypeWithMutablePair, CFMutableCopying {
    
    @inlinable public func mutableCopy(allocator: CFAllocator) -> CTMutableFontCollection {
        return CTFontCollectionCreateMutableCopy(self)
    }
}

extension CTMutableFontCollection: CFMutableTypeWithImmutablePair {
    public typealias ImmutableType = CTFontCollection
}

#endif // os(macOS)

#endif // canImport(CoreText)
