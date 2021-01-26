#if canImport(ImageIO)

import SwiftCF
import ImageIO

extension CGImageMetadata: CFMutableCopying {
    
    @inlinable public func mutableCopy(allocator: CFAllocator) -> CGMutableImageMetadata {
        // FIXME: force unwrap
        return CGImageMetadataCreateMutableCopy(self)!
    }
}

public extension CGImageMetadata {
    
    /// Creates a collection of CGImageMetadataTags from a block of XMP data
    ///
    /// Converts XMP data into a collection of metadata tags. The data must be
    /// a complete XMP tree. XMP packet  headers (`<?xpacket .. ?>`) are
    /// supported.
    ///
    /// - Parameter xmpData: The XMP data.
    /// - Returns: Returns a collection of CGImageMetadata tags. Returns NULL if
    /// an error occurred.
    @inlinable static func create(xmpData: CFData) -> CGImageMetadata? {
        return CGImageMetadataCreateFromXMPData(xmpData)
    }
    
    /// Serializes the CGImageMetadataRef to XMP data
    ///
    /// This converts all of the metadata tags to a block of XMP data. Common
    /// uses include creating sidecar files that contain metadata for image
    /// formats that do not support embedded XMP, or cannot be edited due to
    /// other format restrictions (such as proprietary RAW camera formats).
    ///
    /// - Returns: a CFData containing an XMP representation of the metadata.
    /// Returns NULL if an error occurred.
    @inlinable func xmpData() -> CFData? {
        return CGImageMetadataCreateXMPData(self, nil)
    }
    
    /// Obtain an array of tags from a CGImageMetadataRef
    /// 
    /// - Returns: Returns an array with a shallow copy of all top-level
    /// CGImageMetadataTagRefs in a CGImageMetadataRef.
    @inlinable func tags() -> [CGImageMetadataTag] {
        return CGImageMetadataCopyTags(self) as! [CGImageMetadataTag]? ?? []
    }
    
    /// Executes a given block using each tag in the metadata
    ///
    /// This function iterates over all of the tags in a CGImageMetadataRef,
    /// executing the block for each tag. The default behavior iterates over all
    /// top-level tags in the metadata. The path of the tag and the tag itself
    /// is passed to the block. The metadata cannot be modified inside the block
    /// \- consider adding the tags of interest into another collection.
    /// - Parameters:
    ///   - rootPath: Iteration will occur for all children of the tag matching
    ///   the root path. Please refer to CGImageMetadataCopyTagWithPath for
    ///   information about path syntax. If NULL or an empty string, the block
    ///   will be executed for all top-level tags in the metadata container.
    ///   - options: A dictionary of options for iterating through the tags.
    ///   Currently the only supported option is
    ///   kCGImageMetadataEnumerateRecursively, which should be set to a
    ///   CFBoolean.
    ///   - body: The block that is executed for each tag in metadata.
    @inlinable func enumerateTags(rootPath: CFString? = nil, options: [EnumerateOptions: Any] = [:], body: CGImageMetadataTagBlock) {
        withoutActuallyEscaping(body) { escapingBody in
            CGImageMetadataEnumerateTagsUsingBlock(self, rootPath, options._bridgeToCoreFoundation(), escapingBody)
        }
    }
    
    /// Searches for a specific CGImageMetadataTag in a CGImageMetadataRef
    ///
    /// This is the primary function for clients to obtain specific metadata
    /// properties from an image. The 'path' mechanism provides a way to access
    /// both simple top-level properties, such as Date & Time, or complex
    /// deeply-nested properties with ease.
    ///
    /// # Path
    ///
    /// Paths consist of a tag prefix (i.e. "exif") joined with a tag name (i.e.
    /// "Flash") by a colon (":"), such as CFSTR("exif:Flash").
    ///
    /// Elements of ordered and unordered arrays are accessed via 0-based
    /// indices inside square [] brackets.
    ///
    /// Elements of alternate-text arrays are accessed by an RFC 3066 language
    /// code inside square [] brackets.
    ///
    /// Fields of a structure are delimited by a period, '.'.
    ///
    /// Qualifiers are delimited by the '?' character. Only tags with string
    /// values (kCGImageMetadataTypeString) are allowed to have qualifiers -
    /// arrays and structures may not contain qualifiers.
    ///
    /// If parent is NULL, a prefix must be specified for the first tag.
    ///
    /// Prefixes for all subsequent tags are optional. If unspecified, the
    /// prefix is inherented from the nearest parent tag with a prefix. Custom
    /// prefixes must be registered using
    /// CGImageMetadataRegisterNamespaceForPrefix prior to use in any path-based
    /// functions.
    ///
    /// Examples:
    ///   - 'path' = CFSTR("xmp:CreateDate")
    ///   - 'path' = CFSTR("exif:Flash.Fired")
    ///   - 'parent' = tag at path CFSTR("exif:Flash"), path =
    ///   CFSTR("exif:Fired") (equivilent to previous)
    ///   - 'path' = CFSTR("exif:Flash.RedEyeMode")
    ///   - 'path' = CFSTR("dc:title")
    ///   - 'path' = CFSTR("dc:subject")
    ///   - 'path' = CFSTR("dc:subject[2]")
    ///   - 'parent' = tag at path CFSTR("dc:subject"), path = CFSTR("[2]")
    ///   (equivilent to previous)
    ///   - 'path' = CFSTR("dc:description[x-default])"
    ///   - 'path' = CFSTR("dc.description[de])"
    ///   - 'path' = CFSTR("dc.description[fr])"
    ///   - 'path' = CFSTR("foo:product)"
    ///   - 'path' = CFSTR("foo:product?bar:manufacturer)"
    /// 
    /// - Parameters:
    ///   - path: A string representing a path to the desired tag.
    ///   - parent: A parent tag. If NULL, the path is relative to the root of
    ///   the CGImageMetadataRef (i.e. it is not a child of another property).
    ///   If the parent is provided, the effective path will be the
    ///   concatenation of the parent's path and the 'path' parameter. This is
    ///   useful for accessing array elements or structure fields inside nested
    ///   tags.
    /// - Returns: Returns a copy of CGImageMetadataTag matching 'path', or NULL
    /// if no match is found. The copy of the tag's value is shallow. Tags
    /// copied from an immutable CGImageMetadataRef are also immutable. Because
    /// this function returns a copy of the tag's value, any modification of the
    /// tag's value must be followed by a CGImageMetadataSetTagWithPath to
    /// commit the change to the metadata container.
    @inlinable func tag(for path: CFString, parent: CGImageMetadataTag? = nil) -> CGImageMetadataTag? {
        return CGImageMetadataCopyTagWithPath(self, parent, path)
    }
    
    /// Searches for a specific CGImageMetadataTag matching a kCGImageProperty
    /// constant
    ///
    /// Provides a bridge for values from CGImageCopyPropertiesAtIndex,
    /// simplifying access for properties defined in EXIF and IPTC standards,
    /// which have no notion of namespaces, prefixes, or XMP property types.
    ///
    /// Metadata Working Group guidance is factored into the mapping of
    /// CGImageProperties to XMP compatible CGImageMetadataTags.
    ///
    /// For example, kCGImagePropertyExifDateTimeOriginal will get the value of
    /// the corresponding XMP tag, which is photoshop:DateCreated. Note that
    /// property values will still be in their XMP forms, such as
    /// "YYYY-MM-DDThh:mm:ss" for DateTime, rather than the EXIF or IPTC
    /// DateTime formats.
    /// 
    /// - Parameters:
    ///   - imagePropertyName: the name of the property. This must be a defined
    ///   property constant corresponding to the 'dictionaryName'. For example,
    ///   kCGImagePropertyTIFFOrientation, kCGImagePropertyExifDateTimeOriginal,
    ///   or kCGImagePropertyIPTCKeywords. A warning will be logged if the
    ///   CGImageProperty is unsupported by CGImageMetadata.
    ///   - dictionary: the metadata subdictionary to which the image property
    ///   belongs, such as kCGImagePropertyExifDictionary or
    ///   kCGImagePropertyIPTCDictionary. Not all dictionaries and properties
    ///   are supported at this time.
    /// - Returns: Returns a CGImageMetadataTagRef with the appropriate
    /// namespace, prefix, tag name, and XMP value for the corresponding
    /// CGImageProperty. Returns NULL if the property could not be found.
    @inlinable func tag(matching imagePropertyName: CGImage.PropertyName, dictionary: FormatSpecificDictionary) -> CGImageMetadataTag? {
        return CGImageMetadataCopyTagMatchingImageProperty(self, dictionary.rawValue, imagePropertyName.rawValue)
    }
    
    /// Searches for a specific tag in a CGImageMetadataRef and returns its
    /// string value.
    ///
    /// This is a convenience method for searching for a tag at path and
    /// extracting the string value.
    ///
    /// - Parameters:
    ///   - path: A string with the path to the desired tag. Please consult
    ///   the documentation of CGImageMetadataCopyTagWithPath for information
    ///   about path syntax.
    ///   - parent: A parent tag. If NULL, the path is relative to the root of
    ///   the CGImageMetadataRef (i.e. it is not a child of another property).
    /// - Returns: Returns a string from a CGImageMetadataTag located at 'path'.
    /// The tag must be of type kCGImageMetadataTypeString or
    /// kCGImageMetadataTypeAlternateText. For AlternateText tags, the element
    /// with the "x-default" language qualifier will be returned. For other
    /// types, NULL will be returned.
    @inlinable func stringValue(for path: CFString, parent: CGImageMetadataTag? = nil) -> CFString? {
        return CGImageMetadataCopyStringValueWithPath(self, parent, path)
    }
}

public extension CGMutableImageMetadata {
    
    /// Creates an empty CGMutableImageMetadataRef
    @inlinable static func create() -> CGMutableImageMetadata {
        return CGImageMetadataCreateMutable()
    }
    
    /// Sets the tag at a specific path in a CGMutableImageMetadata container or
    /// a parent tag
    ///
    /// This is the primary function for adding new metadata tags to a metadata
    /// container, or updating existing tags. All tags required to reach the
    /// final tag (at the end of the path) will be created, if needed. Tags will
    /// created with default types (ordered arrays). Creating tags will fail if
    /// a prefix is encountered that has not been registered. Use
    /// CGImageMetadataRegisterNamespaceForPrefix to associate a prefix with a
    /// namespace prior to using a path-based CGImageMetadata function. Note
    /// that if a parent tag is provided, the children of that tag reference
    /// will be modified, which may be a different reference from the tag stored
    /// in the metadata container. Since tags are normally obtained as a copy,
    /// it is typically neccesary to use CGImageMetadataSetTagWithPath to commit
    /// the changed parent object back to the metadata container (using the
    /// parent's path and NULL for the parent).
    /// 
    /// - Parameters:
    ///   - tag: The CGImageMetadataTag to be added to the metadata. The tag
    ///   will be retained.
    ///   - path: A string with the path to the desired tag. Please consult
    ///   the documentation of CGImageMetadataCopyTagWithPath for information
    ///   about path syntax.
    ///   - parent: A parent tag. If NULL, the path is relative to the root of
    ///   the CGImageMetadataRef (i.e. it is not a child of another property).
    ///   Note that if a parent tag is provided, the children of that tag
    ///   reference will be modified, which may be a different reference from
    ///   the tag stored in the metadata container. Since tags are normally
    ///   obtained as a copy, it is typically neccesary to use
    ///   CGImageMetadataSetTagWithPath to commit the changed parent object back
    ///   to the metadata container (using the parent's path and NULL for the
    ///   parent).
    /// - Returns: Returns true if successful, false otherwise.
    @inlinable func setTag(_ tag: CGImageMetadataTag, for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataSetTagWithPath(self, parent, path, tag)
    }
    
    /// Removes the tag at a specific path from a CGMutableImageMetadata container or from the parent tag
    ///
    /// Use this function to delete a metadata tag matching a specific path from
    /// a mutable metadata container. Note that if a parent tag is provided, the
    /// children of that tag reference will be modified, which may be a
    /// different reference from the tag stored in the metadata container. Since
    /// tags are normally obtained as a copy, it is typically neccesary to use
    /// CGImageMetadataSetTagWithPath to commit the changed parent object back
    /// to the metadata container (using the parent's path and NULL for the
    /// parent).
    /// - Parameters:
    ///   - path: A string with the path to the desired tag. Please consult the
    ///   documentation of @link CGImageMetadataCopyTagWithPath @/link for
    ///   information about path syntax.
    ///   - parent: A parent tag. If NULL, the path is relative to the root of
    ///   the CGImageMetadataRef (i.e. it is not a child of another property).
    @inlinable func removeTag(for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataRemoveTagWithPath(self, parent, path)
    }
    
    /// Sets the value of the tag at a specific path in a
    /// CGMutableImageMetadataRef container or a parent tag
    ///
    /// This function is used to add new metadata values to a metadata container,
    /// or update existing tag values. All tags required to reach the final tag
    /// (at the end of the path) are created, if needed. Tags are created with
    /// default types (i.e. arrays will be ordered). Creating tags will fail if
    /// a prefix is encountered that has not been registered. Use
    /// CGImageMetadataRegisterNamespaceForPrefix to associate a prefix with a
    /// namespace prior to using a path-based CGImageMetadata function.
    ///
    /// Examples
    ///   - 'path' = CFSTR("xmp:CreateDate"), 'value' = CFSTR("2011-09-20T14:54:47-08:00")
    ///   - 'path' = CFSTR("dc:subject[0]"), 'value' = CFSTR("San Francisco")
    ///   - 'path' = CFSTR("dc:subject[1]"), 'value' = CFSTR("Golden Gate Bridge")
    ///   - 'path' = CFSTR("dc:description[en]") 'value' = CFSTR("my image description")
    ///   - 'path' = CFSTR("dc:description[de]") 'value' = CFSTR("meine bildbeschreibung")
    ///
    /// Note that if a parent tag is provided, the children of that tag
    /// reference will be modified, which may be a different reference from the
    /// tag stored in the metadata container. Since tags are normally obtained
    /// as a copy, it is typically neccesary to use
    /// CGImageMetadataSetTagWithPath to commit the changed parent object back
    /// to the metadata container (using the parent's path and NULL for the parent).
    /// 
    /// - Parameters:
    ///   - value: The value to be added to the CGImageMetadataTag matching the
    ///   path. The tag will be retained. The restrictions for the value are the
    ///   same as in CGImageMetadataTagCreate.
    ///   - path: A string with the path to the desired tag. Please consult
    ///   the documentation of CGImageMetadataCopyTagWithPath for information
    ///   about path syntax.
    ///   - parent: A parent tag. If NULL, the path is relative to the root of
    ///   the CGImageMetadataRef (i.e. it is not a child of another property).
    /// - Returns: Returns true if successful, false otherwise.
    @inlinable func setValue(_ value: CFTypeRef, for path: CFString, parent: CGImageMetadataTag? = nil) -> Bool {
        return CGImageMetadataSetValueWithPath(self, parent, path, value)
    }
    
    /// Sets the value of the CGImageMetadataTag matching a kCGImageProperty
    /// constant
    ///
    /// Provides a bridge for values from CGImageCopyPropertiesAtIndex,
    /// simplifying changing property values defined in EXIF and IPTC standards,
    /// which have no notion of namespaces, prefixes, or XMP property types.
    ///
    /// Metadata Working Group guidance is factored into the mapping of
    /// CGImageProperties to XMP compatible CGImageMetadataTags.
    /// 
    /// For example, setting kCGImagePropertyExifDateTimeOriginal will set the
    /// value of the corresponding XMP tag, which is photoshop:DateCreated. Note
    /// that property values should still be in their XMP forms, such as
    /// "YYYY-MM-DDThh:mm:ss" for DateTime, rather than the EXIF or IPTC
    /// DateTime formats. Although this function will allow the caller to set
    /// custom values for these properties, you should consult the appropriate
    /// specifications for details about property value formats for EXIF and
    /// IPTC tags in XMP.
    /// 
    /// - Parameters:
    ///   - value: A CFTypeRef with the value for the tag. The same value
    ///   restrictions apply as in CGImageMetadataTagCreate.
    ///   - imagePropertyName: the name of the property. This must be a defined
    ///   property constant corresponding to the 'dictionaryName'. For example,
    ///   kCGImagePropertyTIFFOrientation, kCGImagePropertyExifDateTimeOriginal,
    ///   or kCGImagePropertyIPTCKeywords. A warning will be logged if the
    ///   CGImageProperty is unsupported by CGImageMetadata.
    ///   - dictionary: the metadata subdictionary to which the image property
    ///   belongs, such as kCGImagePropertyExifDictionary or
    ///   kCGImagePropertyIPTCDictionary. Not all dictionaries and properties
    ///   are supported at this time.
    /// - Returns: Returns true if successful, false otherwise.
    @inlinable func setValue(_ value: CFTypeRef, matching imagePropertyName: CGImage.PropertyName, dictionary: FormatSpecificDictionary) -> Bool {
        return CGImageMetadataSetValueMatchingImageProperty(self, dictionary.rawValue, imagePropertyName.rawValue, value)
    }
}

extension CGImageMetadata {
    
    public struct EnumerateOptions: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
        
        /// A key for the 'options' of CGImageMetadataEnumerateTagsUsingBlock.
        /// If present, the value should be a CFBoolean. If true, tags will be
        /// enumerated recursively, if false, only the direct children of
        /// 'rootPath' will be enumerated. The default is non-recursive.
        public static let recursively = kCGImageMetadataEnumerateRecursively as EnumerateOptions
    }
}

#endif
