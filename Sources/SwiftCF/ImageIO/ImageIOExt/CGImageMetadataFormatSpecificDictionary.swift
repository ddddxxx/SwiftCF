#if canImport(ImageIO)

import ImageIO

extension CGImageMetadata {
    
    public struct FormatSpecificDictionary: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImageMetadata.FormatSpecificDictionary {
    static let tiff = kCGImagePropertyTIFFDictionary as CGImageMetadata.FormatSpecificDictionary
    static let gif = kCGImagePropertyGIFDictionary as CGImageMetadata.FormatSpecificDictionary
    static let jfif = kCGImagePropertyJFIFDictionary as CGImageMetadata.FormatSpecificDictionary
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    static let heics = kCGImagePropertyHEICSDictionary as CGImageMetadata.FormatSpecificDictionary
    static let exif = kCGImagePropertyExifDictionary as CGImageMetadata.FormatSpecificDictionary
    static let png = kCGImagePropertyPNGDictionary as CGImageMetadata.FormatSpecificDictionary
    static let iptc = kCGImagePropertyIPTCDictionary as CGImageMetadata.FormatSpecificDictionary
    static let gps = kCGImagePropertyGPSDictionary as CGImageMetadata.FormatSpecificDictionary
    static let raw = kCGImagePropertyRawDictionary as CGImageMetadata.FormatSpecificDictionary
    static let ciff = kCGImagePropertyCIFFDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerCanon = kCGImagePropertyMakerCanonDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerNikon = kCGImagePropertyMakerNikonDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerMinolta = kCGImagePropertyMakerMinoltaDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerFuji = kCGImagePropertyMakerFujiDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerOlympus = kCGImagePropertyMakerOlympusDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerPentax = kCGImagePropertyMakerPentaxDictionary as CGImageMetadata.FormatSpecificDictionary
    static let _8BIM = kCGImageProperty8BIMDictionary as CGImageMetadata.FormatSpecificDictionary
    static let dng = kCGImagePropertyDNGDictionary as CGImageMetadata.FormatSpecificDictionary
    static let exifAux = kCGImagePropertyExifAuxDictionary as CGImageMetadata.FormatSpecificDictionary
    @available(iOS 11.3, tvOS 11.3, watchOS 4.3, *)
    static let openEXR = kCGImagePropertyOpenEXRDictionary as CGImageMetadata.FormatSpecificDictionary
    static let makerApple = kCGImagePropertyMakerAppleDictionary as CGImageMetadata.FormatSpecificDictionary
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let fileContents = kCGImagePropertyFileContentsDictionary as CGImageMetadata.FormatSpecificDictionary
}

#endif
