#if canImport(ImageIO)

import ImageIO

public extension CGImageDestination {
    
    /// Creates an image destination that writes to the specified data consumer.
    ///
    /// - Parameters:
    ///   - consumer: The data consumer to write to. For information on data
    ///   consumers see CGDataConsumer and Quartz 2D Programming Guide.
    ///   - type: The uniform type identifier (UTI) of the resulting image file.
    ///   See Uniform Type Identifiers Overview for a list of system-declared
    ///   and third-party UTIs.
    ///   - count: The number of images (not including thumbnail images) that
    ///   the image file will contain.
    /// - Returns: An image destination. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(consumer: CGDataConsumer, type: CFString, count: Int) -> CGImageDestination? {
        return CGImageDestinationCreateWithDataConsumer(consumer, type, count, nil)
    }
    
    /// Creates an image destination that writes to a Core Foundation mutable
    /// data object.
    ///
    /// - Parameters:
    ///   - data: The data object to write to. For more information on data
    ///   objects, see CFData and Data Objects.
    ///   - type: The uniform type identifier (UTI) of the resulting image file.
    ///   See Uniform Type Identifiers Overview for a list of system-declared
    ///   and third-party UTIs.
    ///   - count: The number of images (not including thumbnail images) that
    ///   the image file will contain.
    /// - Returns: An image destination. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(data: CFMutableData, type: CFString, count: Int) -> CGImageDestination? {
        return CGImageDestinationCreateWithData(data, type, count, nil)
    }
    
    /// Creates an image destination that writes to a location specified by a
    /// URL.
    ///
    /// - Parameters:
    ///   - url: The URL to write to. If the URL already exists, the data at
    ///   this location is overwritten.
    ///   - type: The UTI (uniform type identifier) of the resulting image file.
    ///   See Uniform Type Identifiers Overview for a list of system-declared
    ///   and third-party UTIs.
    ///   - count: The number of images (not including thumbnail images) that
    ///   the image file will contain.
    /// - Returns: An image destination. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(url: CFURL, type: CFString, count: Int) -> CGImageDestination? {
        return CGImageDestinationCreateWithURL(url, type, count, nil)
    }
    
    /// Applies one or more properties to all images in an image destination.
    ///
    /// - Parameter properties: A dictionary that contains the properties to
    /// apply. You can set any of the properties described in Destination
    /// Properties or the image properties described in CGImageProperties.
    @inlinable func setProperties(_ properties: [CGImage.PropertyName: Any]) {
        CGImageDestinationSetProperties(self, properties as CFDictionary)
    }
    
    /// Adds an image to an image destination.
    ///
    /// The function logs an error if you add more images than what you
    /// specified when you created the image destination.
    ///
    /// - Parameters:
    ///   - image: The image to add.
    ///   - properties: An optional dictionary that specifies the properties of
    ///   the added image. The dictionary can contain any of the properties
    ///   described in Destination Properties or the image properties described
    ///   in CGImageProperties.
    @inlinable func addImage(_ image: CGImage, properties: [CGImage.PropertyName: Any] = [:]) {
        CGImageDestinationAddImage(self, image, properties as CFDictionary)
    }
    
    /// Adds an image from an image source to an image destination.
    ///
    /// - Parameters:
    ///   - source: An image source.
    ///   - index: An index that specifies the location of the image in the
    ///   image source. The index is zero-based.
    ///   - properties: A dictionary that specifies properties to overwrite or
    ///   add to the source image properties. If a key in properties has the
    ///   value kCFNull, the corresponding property in the image destination is
    ///   removed. The dictionary can contain any of the properties described in
    ///   Destination Properties or the image properties described in
    ///   CGImageProperties.
    @inlinable func addImage(from source: CGImageSource, at index: Int, properties: [CGImage.PropertyName: Any] = [:]) {
        CGImageDestinationAddImageFromSource(self, source, index, properties as CFDictionary)
    }
    
    /// Set the next image in the image destination `idst' to be `image' with
    /// metadata properties specified in `metadata'. An error is logged if more
    /// images are added than specified in the original count of the image
    /// destination.
    @inlinable func addImage(_ image: CGImage, metadata: CGImageMetadata) {
        CGImageDestinationAddImageAndMetadata(self, image, metadata, nil)
    }
    
    /// Writes image data and properties to the data, URL, or data consumer
    /// associated with the image destination.
    ///
    /// You must call this function or the output of the image destination will
    /// not be valid. After calling this function, no additional data can be
    /// added to the image destination.
    ///
    /// - Returns: Returns true if the image is successfully written; false
    /// otherwise.
    @inlinable func finalize() -> Bool {
        return CGImageDestinationFinalize(self)
    }
    
    /// Losslessly copies the contents of the image source, 'isrc', to the
    /// destination, 'idst'. The image data will not be modified. The image's
    /// metadata can be modified by adding the keys and values defined above to
    /// 'options'. No other images should be added to the image destination.
    /// CGImageDestinationFinalize() should not be called afterward - the result
    /// is saved to the destination when this function returns.
    ///
    /// The image type of the destination must match the image source. Returns
    /// true if the operation was successful. If an error occurs, false will be
    /// returned and 'err' will be set to a CFErrorRef. Not all image formats
    /// are supported for this operation.
    @inlinable func copy(from source: CGImageSource, options: [CopyOptions: Any]) throws {
        var error: Unmanaged<CFError>?
        let success = withUnsafeMutablePointer(to: &error) { ptr in
            CGImageDestinationCopyImageSource(self, source, options as CFDictionary, ptr)
        }
        if !success {
            throw error!.takeRetainedValue()
        }
    }
    
    /// Depth data support for JPEG, HEIF, and DNG images.
    ///
    /// The auxiliaryDataInfoDictionary should contain:
    ///   - the depth data (CFDataRef) - (kCGImageAuxiliaryDataInfoData),
    ///   - the depth data description (CFDictionary) - (kCGImageAuxiliaryDataInfoDataDescription)
    ///   - metadata (CGImageMetadataRef) - (kCGImageAuxiliaryDataInfoMetadata)
    /// To add depth data to an image, call
    /// CGImageDestinationAddAuxiliaryDataInfo() after adding the CGImage to the
    /// CGImageDestinationRef.
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    @inlinable func addAuxiliaryDataInfo(_ auxiliaryDataInfo: [CGImage.AuxiliaryDataInfoKey: Any], type: CGImage.AuxiliaryDataType) {
        CGImageDestinationAddAuxiliaryDataInfo(self, type.rawValue, auxiliaryDataInfo as CFDictionary)
    }
}

extension CGImageDestination {
    
    public struct CopyOptions: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImageDestination.CopyOptions {
    static let metadata = kCGImageDestinationMetadata as CGImageDestination.CopyOptions
    static let mergeMetadata = kCGImageDestinationMergeMetadata as CGImageDestination.CopyOptions
    static let shouldExcludeXMP = kCGImageMetadataShouldExcludeXMP as CGImageDestination.CopyOptions
    static let shouldExcludeGPS = kCGImageMetadataShouldExcludeGPS as CGImageDestination.CopyOptions
    static let dateTime = kCGImageDestinationDateTime as CGImageDestination.CopyOptions
    static let orientation = kCGImageDestinationOrientation as CGImageDestination.CopyOptions
}

/// Properties for a single image in an image destination.
public extension CGImage.PropertyName {
    static let destinationLossyCompressionQuality = kCGImageDestinationLossyCompressionQuality as CGImage.PropertyName
    static let destinationBackgroundColor = kCGImageDestinationBackgroundColor as CGImage.PropertyName
}

#endif
