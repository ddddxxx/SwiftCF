import CoreFoundation

@inlinable public func cfCast<Source, Target: CFType>(_ v: Source, to type: Target.Type = Target.self) -> Target? {
    // TODO: Cast to _CFTollFreeBridgingMutableType
//    if let t = T.self as? _CFTollFreeBridgingNSType.Type {
//        return type(of: v) as? t.bridgedNSType
//    }
//    if Target.self is _CFMutableType.Type {
//        assertionFailure("Cast '\(v)' to CoreFoundation mutable type '\(type)' is not supported and will always produce nil.")
//        return nil
//    }
    let ref = v as CFTypeRef
    if CFGetTypeID(ref) == type.typeID {
        return (ref as! Target)
    } else {
        return nil
    }
}

@inlinable public func cfCast<T, Result: _CFTollFreeBridgeable>(_ v: T, to type: Result.Type = Result.self) -> Result? {
    if let nsValue = v as? Result.BridgedNSType {
        return (nsValue as! Result)
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

public extension _CFTollFreeBridgeable {
    @inlinable static func cast<Source>(_ v: Source) -> Self? {
        return cfCast(v, to: Self.self)
    }
}

@inlinable public func cfUnwrap(_ v: CFTypeRef) -> CFTypeRef? {
    return kCFNull.cfEqual(to: v) ? nil : v
}
