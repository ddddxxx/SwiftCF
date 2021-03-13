#if canImport(CoreText)

import SwiftCF
import Foundation
import CoreText

public extension CTFontCollection {
    
    /// Returns a new font collection matching all available fonts.
    ///
    /// - Parameter options: The options dictionary. See constant option keys.
    /// - Returns: This function creates a new collection containing all fonts
    /// available to the current application.
    @inlinable static func availableFonts(options: [OptionKey: Any] = [:]) -> CTFontCollection {
        return CTFontCollectionCreateFromAvailableFonts(options._bridgeToCF())
    }
    
    /// Returns a new collection based on the array of font descriptors.
    ///
    /// - Parameters:
    ///   - queryDescriptors: An array of font descriptors to use for matching.
    ///   May be NULL, in which case the matching descriptors will be NULL.
    ///   - options: The options dictionary. See constant option keys.
    /// - Returns: This function creates a new collection based on the provided
    /// font descriptors. The contents of this collection is defined by matching
    /// the provided descriptors against all available font descriptors.
    @inlinable static func create(queryDescriptors: [CTFontDescriptor] = [], options: [OptionKey: Any] = [:]) -> CTFontCollection {
        return CTFontCollectionCreateWithFontDescriptors(queryDescriptors._bridgeToCF(), options._bridgeToCF())
    }
    
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
    @inlinable func copy(queryDescriptors: [CTFontDescriptor] = [], options: [OptionKey: Any] = [:]) -> CTFontCollection {
        return CTFontCollectionCreateCopyWithFontDescriptors(self, queryDescriptors._bridgeToCF(), options._bridgeToCF())
    }
    
    #if os(macOS)
    
    /// Returns a mutable copy of the original collection.
    @inlinable func mutableCopy() -> CTMutableFontCollection {
        return CTFontCollectionCreateMutableCopy(self)
    }
    
    /// Returns the array of descriptors to match.
    ///
    /// - Returns: This function returns a retained reference to the array of
    /// descriptors to be used to query (match) the system font database. The
    /// return value is undefined if CTFontCollectionCreateFromAvailableFonts
    /// was used to create the collection.
    @inlinable func queryDescriptors() -> [CTFontDescriptor] {
        return CTFontCollectionCopyQueryDescriptors(self) as! [CTFontDescriptor]? ?? []
    }
    
    /// Returns the array of descriptors to exclude from the match.
    ///
    /// - Returns: This function returns a retained reference to the array of
    /// descriptors to be used to query (match) the system font database.
    @inlinable func exclusionDescriptors() -> [CTFontDescriptor] {
        return CTFontCollectionCopyExclusionDescriptors(self) as! [CTFontDescriptor]? ?? []
    }
    
    #endif // os(macOS)
    
    /// Returns an array of font descriptors matching the collection.
    ///
    /// - Returns: An array of CTFontDescriptors matching the collection
    /// definition or NULL if there are none.
    @inlinable func matchingFontDescriptors() -> [CTFontDescriptor] {
        return CTFontCollectionCreateMatchingFontDescriptors(self)  as! [CTFontDescriptor]? ?? []
    }
    
    /// Returns an array of font descriptors matching the collection.
    ///
    /// - Parameter options: The options dictionary. See constant option keys.
    /// May be NULL, in which case this call returns the same results as
    /// CTFontCollectionCreateMatchingFontDescriptors, using the options passed
    /// in when the collection was created.
    /// - Returns: An array of CTFontDescriptors matching the collection
    /// definition or NULL if there are none.
    @available(macOS 10.7, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    @inlinable func matchingFontDescriptors(options: [OptionKey: Any] = [:]) -> [CTFontDescriptor]? {
        return CTFontCollectionCreateMatchingFontDescriptorsWithOptions(self, options._bridgeToCF()) as! [CTFontDescriptor]? ?? []
    }
    
    #if os(macOS)
    
    /// Option bits for use with CTFontCollection.fontAttribute(s).
    typealias CopyOptions = CTFontCollectionCopyOptions
    
    /// Returns an array of font descriptor attribute values.
    ///
    /// - Parameters:
    ///   - key: The attribute to retrieve for each descriptor in the
    ///   collection.
    ///   - options: Options to alter the return value.
    /// - Returns: An array containing one value for each descriptor. With
    /// kCTFontCollectionCopyDefaultOptions, the values will be in the same
    /// order as the results from CTFontCollectionCreateMatchingFontDescriptors
    /// and NULL values will be transformed to kCFNull. When the
    /// kCTFontCollectionCopyUnique is set, duplicate values will be removed.
    /// When kCTFontCollectionCopyStandardSort is set, the values will be sorted
    /// in standard UI order.
    @inlinable func fontAttribute(key: CTFont.AttributeKey, options: CopyOptions) -> [Any?] {
        return CTFontCollectionCopyFontAttribute(self, key.rawValue, options).map(cfUnwrap(_:))
    }
    
    /// Returns an array of dictionaries containing font descriptor attribute
    /// values.
    ///
    /// - Parameters:
    ///   - keys: The attributes to retrieve for each descriptor in the
    ///   collection.
    ///   - options: Options to alter the return value.
    /// - Returns: An array containing one CFDictionary value for each
    /// descriptor mapping the requested attribute names. With
    /// kCTFontCollectionCopyDefaultOptions, the values will be in the same
    /// order as the results from CTFontCollectionCreateMatchingFontDescriptors.
    /// When the kCTFontCollectionCopyUnique is set, duplicate values will be
    /// removed. When kCTFontCollectionCopyStandardSort is set, the values will
    /// be sorted in standard UI order.
    @inlinable func fontAttributes(keys: Set<CTFont.AttributeKey>, options: CopyOptions) -> [[CTFont.AttributeKey: Any?]] {
        return CTFontCollectionCopyFontAttributes(self, keys as NSSet, options).map { ($0 as! [CTFont.AttributeKey: CFTypeRef]).mapValues(cfUnwrap(_:)) }
    }
    
    #endif // os(macOS)
}

#if os(macOS)

extension CTMutableFontCollection {
    
    /// Replaces the array of descriptors to match.
    /// - Parameter descriptors: An array of CTFontDescriptorRef. May be NULL to
    /// represent an empty collection, in which case the matching descriptors
    /// will also be NULL.
    @inlinable func setQueryDescriptors(_ descriptors: [CTFontDescriptor]) {
        return CTFontCollectionSetQueryDescriptors(self, descriptors._bridgeToCF())
    }
    
    /// Replaces the array of descriptors to exclude from the match.
    /// - Parameter descriptors: An array of CTFontDescriptorRef. May be NULL.
    @inlinable func setExclusionDescriptors(_ descriptors: [CTFontDescriptor]) {
        return CTFontCollectionSetExclusionDescriptors(self, descriptors._bridgeToCF())
    }
}

#endif // os(macOS)

#endif // canImport(CoreText)
