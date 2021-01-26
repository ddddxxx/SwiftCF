#if canImport(ImageIO)

import SwiftCF
import ImageIO

public extension CGImageSource {
    
    typealias Status = CGImageSourceStatus
    
    /// Creates an image source that reads data from the specified data provider.
    ///
    /// - Parameters:
    ///   - dataProvider: The data provider to read from. For more information
    ///   on data providers, see CGDataProvider and Quartz 2D Programming Guide.
    ///   - options: A dictionary that specifies additional creation options.
    ///   See Image Source Option Dictionary Keys for the keys you can supply.
    /// - Returns: An image source. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(dataProvider: CGDataProvider, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithDataProvider(dataProvider, options._bridgeToCoreFoundation())
    }
    
    /// reates an image source that reads from a Core Foundation data object.
    /// - Parameters:
    ///   - data: The data object to read from. For more information on data
    ///   objects, see CFData and Data Objects.
    ///   - options: A dictionary that specifies additional creation options.
    ///   See Image Source Option Dictionary Keys for the keys you can supply.
    /// - Returns: An image source. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(data: CFData, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithData(data, options._bridgeToCoreFoundation())
    }
    
    /// Creates an image source that reads from a location specified by a URL.
    /// - Parameters:
    ///   - url: The URL to read from.
    ///   - options: A dictionary that specifies additional creation options.
    ///   See Image Source Option Dictionary Keys for the keys you can supply.
    /// - Returns: An image source. You are responsible for releasing this
    /// object using CFRelease.
    @inlinable static func create(url: CFURL, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithURL(url, options._bridgeToCoreFoundation())
    }
    
    /// Create an incremental image source.
    ///
    /// The function CGImageSourceCreateIncremental creates an empty image
    /// source container to which you can add data later by calling the
    /// functions CGImageSourceUpdateDataProvider or CGImageSourceUpdateData.
    /// You don’t provide data when you call this function.
    ///
    /// An incremental image is an image that is created in chunks, similar to
    /// the way large images viewed over the web are loaded piece by piece.
    ///
    /// - Parameter options: A dictionary that specifies additional creation
    /// options. See Image Source Option Dictionary Keys for the keys you can
    /// supply.
    /// - Returns: Returns an image source object. You are responsible for
    /// releasing this object using CFRelease.
    @inlinable static func createIncremental(options: [Option: Any] = [:]) -> CGImageSource {
        return CGImageSourceCreateIncremental(options._bridgeToCoreFoundation())
    }
    
    /// Returns the uniform type identifier of the source container.
    ///
    /// The uniform type identifier (UTI) of the source container can be
    /// different from the type of the images in the container. For example, the
    /// .icns format supports embedded JPEG2000. The type of the source
    /// container is "com.apple.icns" but type of the images is JPEG2000.
    ///
    /// See Uniform Type Identifier Concepts for a list of system-declared and
    /// third-party UTIs.
    @inlinable var type: CFString? {
        return CGImageSourceGetType(self)
    }
    
    /// Returns the number of images (not including thumbnails) in the image
    /// source.
    ///
    /// The number of images. If the image source is a multilayered PSD file,
    /// the function returns 1.
    ///
    /// This function does not extract the layers of a PSD file.
    @inlinable var count: Int {
        return CGImageSourceGetCount(self)
    }
    
    /// Returns the properties of the image source.
    ///
    /// These properties apply to the container in general but not necessarily
    /// to any individual image contained in the image source.
    ///
    /// - Parameter options: A dictionary you can use to request additional
    /// options. See Image Source Option Dictionary Keys for the keys you can
    /// supply.
    /// - Returns: A dictionary that contains the properties associated with the
    /// image source container. See CGImageProperties for a list of properties
    /// that can be in the dictionary.
    @inlinable func properties(options: [Option: Any] = [:]) -> [CGImage.PropertyName: Any] {
        return CGImageSourceCopyProperties(self, options._bridgeToCoreFoundation()) as! [CGImage.PropertyName: Any]? ?? [:]
    }
    
    /// Returns the properties of the image at a specified location in an image
    /// source.
    ///
    /// - Parameters:
    ///   - index: The index of the image whose properties you want to obtain.
    ///   The index is zero-based.
    ///   - options: A dictionary you can use to request additional options. See
    ///   Image Source Option Dictionary Keys for the keys you can supply.
    /// - Returns: A dictionary that contains the properties associated with the
    /// image. See CGImageProperties for a list of properties that can be in the
    /// dictionary.
    @inlinable func properties(at index: Int, options: [Option: Any] = [:]) -> [CGImage.PropertyName: Any] {
        return CGImageSourceCopyPropertiesAtIndex(self, index, options._bridgeToCoreFoundation()) as! [CGImage.PropertyName: Any]? ?? [:]
    }
    
    /// Return the metadata of the image at 'index' in the image source 'isrc'.
    /// The index is zero-based. The `options' dictionary may be used to request
    /// additional options; see the list of keys above for more information.
    /// Please refer to CGImageMetadata.h for usage of metadata.
    @inlinable func metadata(at index: Int, options: [Option: Any] = [:]) -> CGImageMetadata? {
        return CGImageSourceCopyMetadataAtIndex(self, index, options._bridgeToCoreFoundation())
    }
    
    /// Return the image at 'index' in the image source 'isrc'.  The index is
    /// zero-based. The `options' dictionary may be used to request additional
    /// creation options; see the list of keys above for more information.
    @inlinable func image(at index: Int, options: [Option: Any] = [:]) -> CGImage? {
        return CGImageSourceCreateImageAtIndex(self, index, options._bridgeToCoreFoundation())
    }
    
    /// Remove the cached decoded image data for the image at 'index' in the
    /// image source 'isrc'. The index is zero-based.
    @inlinable func removeCache(at index: Int) {
        return CGImageSourceRemoveCacheAtIndex(self, index)
    }
    
    /// Return the thumbnail of the image at 'index' in the image source 'isrc'.
    /// The index is zero-based. The `options' dictionary may be used to request
    /// additional thumbnail creation options; see the list of keys above for
    /// more information.
    @inlinable func thumbnail(at index: Int, options: [Option: Any]) -> CGImage? {
        return CGImageSourceCreateThumbnailAtIndex(self, index, options._bridgeToCoreFoundation())
    }
    
    /// Update the incremental image source 'isrc' with new data. The new data
    /// must include all the previous data plus any additional new data. The
    /// 'final' parameter should be true when the final set of data is provided;
    /// false otherwise. */
    @inlinable func update(data: CFData, final: Bool = false) {
        return CGImageSourceUpdateData(self, data, final)
    }
    
    /// Update the incremental image source 'isrc' with a new data provider.
    /// The new data provider must provide all the previous data plus any
    /// additional new data. The `final' parameter should be true when the final
    /// set of data is provided; false otherwise. */
    @inlinable func update(dataProvider: CGDataProvider, final: Bool = false) {
        return CGImageSourceUpdateDataProvider(self, dataProvider, final)
    }
    
    /// Return the overall status of the image source 'isrc'. The status is
    /// particularly informative for incremental image sources, but may be used
    /// by clients providing non-incremental data as well. */
    @inlinable var status: Status {
        return CGImageSourceGetStatus(self)
    }
    
    /// Return the current status of the image at 'index' in the image source
    /// 'isrc'. The index is zero-based. The returned status is particularly
    /// informative for incremental image sources but may used by clients
    /// providing non-incremental data as well. */
    @inlinable func status(at index: Int) -> Status {
        return CGImageSourceGetStatusAtIndex(self, index)
    }
    
    /// Return the primary image index for HEIF images. Zero for all other
    /// formats.
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    @inlinable var primaryImageIndex: Int {
        return CGImageSourceGetPrimaryImageIndex(self)
    }
    
    /// Depth data support for JPEG, HEIF, and DNG images.
    ///
    /// The returned CFDictionary contains:
    ///
    ///   - the depth data (CFDataRef) - (kCGImageAuxiliaryDataInfoData),
    ///   - the depth data description (CFDictionary) - (kCGImageAuxiliaryDataInfoDataDescription)
    ///   - metadata (CGImageMetadataRef) - (kCGImageAuxiliaryDataInfoMetadata)
    ///
    /// CGImageSourceCopyAuxiliaryDataInfoAtIndex returns nil if the image did not contain ‘auxiliaryImageDataType’ data.
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    @inlinable func auxiliaryDataInfo(at index: Int, type: CGImage.AuxiliaryDataType) -> [CGImage.AuxiliaryDataInfoKey: Any] {
        return CGImageSourceCopyAuxiliaryDataInfoAtIndex(self, index, type.rawValue) as! [CGImage.AuxiliaryDataInfoKey: Any]? ?? [:]
    }
}

#endif
