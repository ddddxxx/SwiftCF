#if canImport(ImageIO)

import ImageIO

extension CGImageDestination: CFType {
    public static let typeID = CGImageDestinationGetTypeID()
}

extension CGImageSource: CFType {
    public static let typeID = CGImageSourceGetTypeID()
}

extension CGImageMetadata: CFType {
    public static let typeID = CGImageMetadataGetTypeID()
}

extension CGImageMetadataTag: CFType {
    public static let typeID = CGImageMetadataTagGetTypeID()
}

#endif // canImport(ImageIO)
