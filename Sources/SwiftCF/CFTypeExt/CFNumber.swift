import CoreFoundation

public extension CFNumber {
    
    static let positiveInfinity = kCFNumberPositiveInfinity!
    static let negativeInfinity = kCFNumberNegativeInfinity!
    static let nan = kCFNumberNaN!
    
    @inlinable var type: CFNumberType {
        return CFNumberGetType(self)
    }
    
    @inlinable var byteSize: CFIndex {
        return CFNumberGetByteSize(self)
    }
    
    @inlinable var isFloatType: Bool {
        return CFNumberIsFloatType(self)
    }
    
    @inlinable func value<T: CFNumberRepresentable>() -> T {
        return T._from(cfNumber: self).result
    }
}

// MARK: - CFNumberRepresentable

public protocol CFNumberRepresentable {
    static var cfNumberType: CFNumberType { get }
    static func _from(cfNumber: CFNumber) -> (result: Self, lossless: Bool)
}

public extension CFNumberRepresentable where Self: BinaryInteger {
    static func _from(cfNumber: CFNumber) -> (result: Self, lossless: Bool) {
        var result = Self.zero
        let lossless = CFNumberGetValue(cfNumber, Self.cfNumberType, &result)
        return (result, lossless)
    }
}

public extension CFNumberRepresentable where Self: FloatingPoint {
    static func _from(cfNumber: CFNumber) -> (result: Self, lossless: Bool) {
        var result = Self.zero
        let lossless = CFNumberGetValue(cfNumber, Self.cfNumberType, &result)
        return (result, lossless)
    }
}

extension Int8: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.sInt8Type
}

extension Int16: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.sInt16Type
}

extension Int32: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.sInt32Type
}

extension Int64: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.sInt64Type
}

extension NSInteger: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.nsIntegerType
}

extension Float32: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.float32Type
}

extension Float64: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.float64Type
}

#if canImport(CoreGraphics)

import CoreGraphics

extension CGFloat: CFNumberRepresentable {
    public static let cfNumberType = CFNumberType.cgFloatType
}

#endif // canImport(CoreGraphics)
