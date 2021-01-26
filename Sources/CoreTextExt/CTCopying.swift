#if canImport(CoreText)

import SwiftCF
import CoreText

extension CTFont: CFCopying {
    
    /// Returns a new font with additional attributes based on the original font.
    ///
    /// This function provides a mechanism to change attributes quickly on a
    /// given font reference in response to user actions. For instance, the size
    /// can be changed in response to a user manipulating a size slider.
    ///
    /// - Parameters:
    ///   - size: The point size for the font reference. If 0.0 is specified,
    ///   the original font’s size is preserved.
    ///   - matrix: The transformation matrix for the font. In most cases, set
    ///   this parameter to be NULL.
    ///   If NULL is specified, the original font's matrix is preserved.
    ///   - attributes: A font descriptor containing additional attributes that
    ///   the new font should contain.
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
    
    /// Returns a copy of the original collection augmented with the given new
    /// font descriptors.
    ///
    /// The new font descriptors are merged with the existing descriptors to
    /// create a single set.
    ///
    /// - Parameters:
    ///   - queryDescriptors: An array of font descriptors to augment those of
    ///   the original collection.
    ///   - options: The options dictionary. For possible values, see Constants.
    @inlinable public func copy(queryDescriptors: [CTFontDescriptor] = [], options: [OptionKey: Any] = [:]) -> CTFontCollection {
        return CTFontCollectionCreateCopyWithFontDescriptors(self, queryDescriptors._bridgeToCoreFoundation(), options._bridgeToCoreFoundation())
    }
    
    @inlinable public func copy(allocator: CFAllocator) -> CTFontCollection {
        return copy()
    }
}

public extension CTParagraphStyle {
    
    @inlinable func copy(allocator: CFAllocator) -> CTParagraphStyle {
        return CTParagraphStyleCreateCopy(self)
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
