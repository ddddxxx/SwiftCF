import CoreFoundation

@inlinable public func cfCast<Source, Target: CFType>(_ v: Source, to type: Target.Type = Target.self) -> Target? {
    // TODO: Cast to _CFTollFreeBridgingMutableType
//    if let t = T.self as? _CFTollFreeBridgingNSType.Type {
//        return type(of: v) as? t.bridgedNSType
//    }
    if Target.self is _CFMutableType.Type {
        assertionFailure("Cast '\(v)' to CoreFoundation mutable type '\(type)' is not supported and will always produce nil.")
        return nil
    }
    let ref = v as CFTypeRef
    if CFGetTypeID(ref) == type.typeID {
        return (ref as! Target)
    } else {
        return nil
    }
}

// FIXME: Cannot make it unavailable or obsoleted
@available(*, deprecated, message: "Cast to CoreFoundation mutable type is not supported.")
@inlinable public func cfCast<Source, Target: CFMutableType>(_ v: Source, to type: Target.Type = Target.self) -> Target? {
    fatalError("Cast '\(v)' to CoreFoundation mutable type '\(type)' is not supported.")
}

@inlinable public func cfCast<T, Result: CFTollFreeBridging>(_ v: T, to type: Result.Type = Result.self) -> Result? {
    if let nsValue = v as? Result.BridgedNSType {
        return (nsValue as! Result)
    } else {
        return nil
    }
}

@inlinable public func cfCast<Source, Target: CFTollFreeBridgingMutableType>(_ v: Source, to type: Target.Type = Target.self) -> Target? {
    if let nsValue = v as? Target.BridgedNSType {
        return (nsValue as! Target)
    } else {
        return nil
    }
}

// MARK: -

public extension CFType {
    @inlinable static func cast<Source>(_ v: Source) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

public extension CFMutableType {
    // FIXME: Cannot make it unavailable or obsoleted
    @available(*, deprecated, message: "Cast to CoreFoundation mutable type is not supported.")
    @inlinable static func cast<Source>(_ v: Source) -> Self? {
        fatalError("Cast '\(v)' to CoreFoundation mutable type '\(Self.self)' is not supported.")
    }
}

public extension CFTollFreeBridging {
    @inlinable static func cast<Source>(_ v: Source) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

// CFTollFreeBridgingMutableType
public extension CFTollFreeBridging where Self: CFMutableType {
    @inlinable static func cast<Source>(_ v: Source) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

@inlinable public func cfUnwrap(_ v: CFTypeRef) -> CFTypeRef? {
    return kCFNull.cfEqual(to: v) ? nil : v
}
