#if canImport(ImageIO)

import ImageIO

public extension CGImageSource {
    
    @inlinable static func create(dataProvider: CGDataProvider, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithDataProvider(dataProvider, .from(options))
    }
    
    @inlinable static func create(data: CFData, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithData(data, .from(options))
    }
    
    @inlinable static func create(url: CFURL, options: [Option: Any] = [:]) -> CGImageSource? {
        return CGImageSourceCreateWithURL(url, .from(options))
    }
    
    @inlinable static func createIncremental(options: [Option: Any] = [:]) -> CGImageSource {
        return CGImageSourceCreateIncremental(.from(options))
    }
    
    @inlinable var count: Int {
        return CGImageSourceGetCount(self)
    }
    
    // TODO: wrap result
    @inlinable func properties(options: [Option: Any] = [:]) -> CFDictionary? {
        return CGImageSourceCopyProperties(self, .from(options))
    }
    
    @inlinable func properties(at index: Int, options: [Option: Any] = [:]) -> CFDictionary? {
        return CGImageSourceCopyPropertiesAtIndex(self, index, .from(options))
    }
    
    @inlinable func metadata(at index: Int, options: [Option: Any] = [:]) -> CGImageMetadata? {
        return CGImageSourceCopyMetadataAtIndex(self, index, .from(options))
    }
    
    @inlinable func image(at index: Int, options: [Option: Any] = [:]) -> CGImage? {
        return CGImageSourceCreateImageAtIndex(self, index, .from(options))
    }
    
    @inlinable func removeCache(at index: Int) {
        return CGImageSourceRemoveCacheAtIndex(self, index)
    }
    
    @inlinable func thumbnail(at index: Int, options: [Option: Any]) -> CGImage? {
        return CGImageSourceCreateThumbnailAtIndex(self, index, .from(options))
    }
    
    @inlinable func update(data: CFData, final: Bool = false) {
        return CGImageSourceUpdateData(self, data, final)
    }
    
    @inlinable func update(dataProvider: CGDataProvider, final: Bool = false) {
        return CGImageSourceUpdateDataProvider(self, dataProvider, final)
    }
    
    @inlinable var status: CGImageSourceStatus {
        return CGImageSourceGetStatus(self)
    }
    
    @inlinable func status(at index: Int) -> CGImageSourceStatus {
        return CGImageSourceGetStatusAtIndex(self, index)
    }
    
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    @inlinable var primaryImageIndex: Int {
        return CGImageSourceGetPrimaryImageIndex(self)
    }
    
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    @inlinable func auxiliaryDataInfo(at index: Int, type: CGImage.AuxiliaryDataType) -> [CGImage.AuxiliaryDataInfoKey: Any] {
        return CGImageSourceCopyAuxiliaryDataInfoAtIndex(self, index, type.rawValue) as! [CGImage.AuxiliaryDataInfoKey: Any]? ?? [:]
    }
}

#endif
