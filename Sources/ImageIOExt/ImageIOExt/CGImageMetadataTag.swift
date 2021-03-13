#if canImport(ImageIO)

import SwiftCF
import ImageIO

public extension CGImageMetadataTag {
    
    @inlinable static func create(namespace: Namespace, _ prefix: Prefix? = nil, name: CFString, type: CGImageMetadataType, value: CFTypeRef) -> CGImageMetadataTag? {
        return CGImageMetadataTagCreate(namespace.rawValue, prefix?.rawValue, name, type, value)
    }
    
    @inlinable func namespace() -> Namespace? {
        return CGImageMetadataTagCopyNamespace(self).map(Namespace.init)
    }
    
    @inlinable func prefix() -> Prefix? {
        return CGImageMetadataTagCopyPrefix(self).map(Prefix.init)
    }
    
    @inlinable func name() -> CFString? {
        return CGImageMetadataTagCopyName(self)
    }
    
    @inlinable func value() -> CFTypeRef? {
        return CGImageMetadataTagCopyValue(self)
    }
    
    @inlinable var type: CGImageMetadataType {
        return CGImageMetadataTagGetType(self)
    }
    
    @inlinable func qualifiers() -> [CGImageMetadataTag] {
        return CGImageMetadataTagCopyQualifiers(self)?.asSwift() ?? []
    }
}

extension CGImageMetadataTag {
    
    public struct Namespace: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImageMetadataTag.Namespace {
    static let exif = kCGImageMetadataNamespaceExif as CGImageMetadataTag.Namespace
    static let exifAux = kCGImageMetadataNamespaceExifAux as CGImageMetadataTag.Namespace
    static let exifEX = kCGImageMetadataNamespaceExifEX as CGImageMetadataTag.Namespace
    static let dublinCore = kCGImageMetadataNamespaceDublinCore as CGImageMetadataTag.Namespace
    static let iptcCore = kCGImageMetadataNamespaceIPTCCore as CGImageMetadataTag.Namespace
    @available(macOS 10.13.4, iOS 11.3, tvOS 11.3, watchOS 4.3, *)
    static let iptcExtension = kCGImageMetadataNamespaceIPTCExtension as CGImageMetadataTag.Namespace
    static let photoshop = kCGImageMetadataNamespacePhotoshop as CGImageMetadataTag.Namespace
    static let tiff = kCGImageMetadataNamespaceTIFF as CGImageMetadataTag.Namespace
    static let xmpBasic = kCGImageMetadataNamespaceXMPBasic as CGImageMetadataTag.Namespace
    static let xmpRights = kCGImageMetadataNamespaceXMPRights as CGImageMetadataTag.Namespace
}

extension CGImageMetadataTag {
    
    public struct Prefix: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImageMetadataTag.Prefix {
    static let exif = kCGImageMetadataPrefixExif as CGImageMetadataTag.Prefix
    static let exifAux = kCGImageMetadataPrefixExifAux as CGImageMetadataTag.Prefix
    static let exifEX = kCGImageMetadataPrefixExifEX as CGImageMetadataTag.Prefix
    static let dublinCore = kCGImageMetadataPrefixDublinCore as CGImageMetadataTag.Prefix
    static let iptcCore = kCGImageMetadataPrefixIPTCCore as CGImageMetadataTag.Prefix
    @available(macOS 10.13.4, iOS 11.3, tvOS 11.3, watchOS 4.3, *)
    static let iptcExtension = kCGImageMetadataPrefixIPTCExtension as CGImageMetadataTag.Prefix
    static let photoshop = kCGImageMetadataPrefixPhotoshop as CGImageMetadataTag.Prefix
    static let tiff = kCGImageMetadataPrefixTIFF as CGImageMetadataTag.Prefix
    static let xmpBasic = kCGImageMetadataPrefixXMPBasic as CGImageMetadataTag.Prefix
    static let xmpRights = kCGImageMetadataPrefixXMPRights as CGImageMetadataTag.Prefix
}

#endif
