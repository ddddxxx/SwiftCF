#if canImport(ImageIO)

import ImageIO

extension CGImageSource {
    
    public struct Option: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImageSource.Option {
    static let shouldCache = kCGImageSourceShouldCache as CGImageSource.Option
    static let shouldCacheImmediately = kCGImageSourceShouldCacheImmediately as CGImageSource.Option
    static let shouldAllowFloat = kCGImageSourceShouldAllowFloat as CGImageSource.Option
    static let createThumbnailFromImageIfAbsent = kCGImageSourceCreateThumbnailFromImageIfAbsent as CGImageSource.Option
    static let createThumbnailFromImageAlways = kCGImageSourceCreateThumbnailFromImageAlways as CGImageSource.Option
    static let thumbnailMaxPixelSize = kCGImageSourceThumbnailMaxPixelSize as CGImageSource.Option
    static let createThumbnailWithTransform = kCGImageSourceCreateThumbnailWithTransform as CGImageSource.Option
    @available(macOS 10.11, iOS 9.0, tvOS 9.0, watchOS 2.0, *)
    static let subsampleFactor = kCGImageSourceSubsampleFactor as CGImageSource.Option
}

#endif
