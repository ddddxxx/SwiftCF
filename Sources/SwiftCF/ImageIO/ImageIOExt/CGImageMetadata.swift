#if canImport(ImageIO)

import ImageIO

extension CGImageMetadata: CFMutableCopying {
    
    @inlinable public func mutableCopy(allocator: CFAllocator) -> CGMutableImageMetadata {
        // FIXME: force unwrap
        return CGImageMetadataCreateMutableCopy(self)!
    }
}

public extension CGImageMetadata {
    
    @inlinable static func create(xmpData: CFData) -> CGImageMetadata? {
        return CGImageMetadataCreateFromXMPData(xmpData)
    }
    
    @inlinable func xmpData() -> CFData? {
        return CGImageMetadataCreateXMPData(self, nil)
    }
    
    @inlinable func tags() -> [CGImageMetadataTag] {
        return CGImageMetadataCopyTags(self) as! [CGImageMetadataTag]? ?? []
    }
    
    @inlinable func enumerateTags(rootPath: CFString? = nil, recursive: Bool, body: CGImageMetadataTagBlock) {
        let options: CFDictionary? = recursive ? [kCGImageMetadataEnumerateRecursively: true]  as CFDictionary : nil
        withoutActuallyEscaping(body) { escapingBody in
            CGImageMetadataEnumerateTagsUsingBlock(self, rootPath, options, escapingBody)
        }
    }
    
    @inlinable func tag(for path: CFString, parent: CGImageMetadataTag? = nil) -> CGImageMetadataTag? {
        return CGImageMetadataCopyTagWithPath(self, parent, path)
    }
    
    @inlinable func tag(matching imagePropertyName: CGImage.PropertyName, dictionary: FormatSpecificDictionary) -> CGImageMetadataTag? {
        return CGImageMetadataCopyTagMatchingImageProperty(self, dictionary.rawValue, imagePropertyName.rawValue)
    }
    
    @inlinable func stringValue(for path: CFString, parent: CGImageMetadataTag? = nil) -> CFString? {
        return CGImageMetadataCopyStringValueWithPath(self, parent, path)
    }
}

public extension CGMutableImageMetadata {
    
    @inlinable static func create() -> CGMutableImageMetadata {
        return CGImageMetadataCreateMutable()
    }
    
    @inlinable func setTag(_ tag: CGImageMetadataTag, for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataSetTagWithPath(self, parent, path, tag)
    }
    
    @inlinable func removeTag(for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataRemoveTagWithPath(self, parent, path)
    }
    
    @inlinable func setValue(_ value: CFTypeRef, for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataSetValueWithPath(self, parent, path, value)
    }
    
    @inlinable func setValue(_ value: CFTypeRef, matching imagePropertyName: CGImage.PropertyName, dictionary: FormatSpecificDictionary) -> Bool {
        return CGImageMetadataSetValueMatchingImageProperty(self, dictionary.rawValue, imagePropertyName.rawValue, value)
    }
}

#endif
