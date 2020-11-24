#if canImport(Darwin)

import CoreFoundation

@inlinable public func cfCast<T: CFType>(_ v: Any, to type: T.Type = T.self) -> T? {
    // TODO: Cast to _CFTollFreeBridgingMutableType
//    if let t = T.self as? _CFTollFreeBridgingNSType.Type {
//        return type(of: v) as? t.bridgedNSType
//    }
    if T.self is _CFMutableType.Type {
        assertionFailure("Cast '\(v)' to CoreFoundation mutable type '\(type)' is not supported and will always produce nil.")
        return nil
    }
    let ref = v as CFTypeRef
    if CFGetTypeID(ref) == type.typeID {
        return (ref as! T)
    } else {
        return nil
    }
}

// FIXME: Cannot make it unavailable or obsoleted
@available(*, deprecated, message: "Cast to CoreFoundation mutable type is not supported.")
@inlinable public func cfCast<T: CFMutableType>(_ v: Any, to type: T.Type = T.self) -> T? {
    fatalError("Cast '\(v)' to CoreFoundation mutable type '\(type)' is not supported.")
}

@inlinable public func cfCast<T: CFTollFreeBridgingNSType>(_ v: Any, to type: T.Type = T.self) -> T? {
    if let nsValue = v as? T.BridgedNSType {
        return (nsValue as! T)
    } else {
        return nil
    }
}

@inlinable public func cfCast<T: CFTollFreeBridgingMutableType>(_ v: Any, to type: T.Type = T.self) -> T? {
    if let nsValue = v as? T.BridgedNSType {
        return (nsValue as! T)
    } else {
        return nil
    }
}

// MARK: -

public extension CFType {
    @inlinable static func cast(_ v: Any) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

public extension CFMutableType {
    // FIXME: Cannot make it unavailable or obsoleted
    @available(*, deprecated, message: "Cast to CoreFoundation mutable type is not supported.")
    @inlinable static func cast(_ v: Any) -> Self? {
        fatalError("Cast '\(v)' to CoreFoundation mutable type '\(Self.self)' is not supported.")
    }
}

public extension CFTollFreeBridgingNSType {
    @inlinable static func cast(_ v: Any) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

// CFTollFreeBridgingMutableType
public extension CFTollFreeBridgingNSType where Self: CFMutableType {
    @inlinable static func cast(_ v: Any) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

@inlinable public func cfUnwrap(_ v: CFTypeRef) -> CFTypeRef? {
    return kCFNull.cfEqual(to: v) ? nil : v
}

#endif
