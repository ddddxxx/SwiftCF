#if canImport(ImageIO)

import ImageIO

extension CGImage {
    
    public struct AuxiliaryDataType: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImage.AuxiliaryDataType {
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let depth = kCGImageAuxiliaryDataTypeDepth as CGImage.AuxiliaryDataType
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let disparity = kCGImageAuxiliaryDataTypeDisparity as CGImage.AuxiliaryDataType
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    static let portraitEffectsMatte = kCGImageAuxiliaryDataTypePortraitEffectsMatte as CGImage.AuxiliaryDataType
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    static let semanticSegmentationSkinMatte = kCGImageAuxiliaryDataTypeSemanticSegmentationSkinMatte as CGImage.AuxiliaryDataType
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    static let semanticSegmentationHairMatte = kCGImageAuxiliaryDataTypeSemanticSegmentationHairMatte as CGImage.AuxiliaryDataType
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    static let semanticSegmentationTeethMatte = kCGImageAuxiliaryDataTypeSemanticSegmentationTeethMatte as CGImage.AuxiliaryDataType
}

extension CGImage {
    
    public struct AuxiliaryDataInfoKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public extension CGImage.AuxiliaryDataInfoKey {
    static let data = kCGImageAuxiliaryDataInfoData as CGImage.AuxiliaryDataInfoKey
    static let dataDescription = kCGImageAuxiliaryDataInfoDataDescription as CGImage.AuxiliaryDataInfoKey
    static let metadata = kCGImageAuxiliaryDataInfoMetadata as CGImage.AuxiliaryDataInfoKey
}

#endif
