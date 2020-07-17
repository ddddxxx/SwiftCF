#if canImport(ApplicationServices)

import ApplicationServices

public extension AXValue {
    
    /// Encodes a structure pointed to by valuePtr into a CFTypeRef.
    @inlinable static func create(type: AXValueType, value: Any) -> AXValue? {
        var value = value
        return AXValueCreate(type, &value)
    }
    
    /// Returns the structure type encoded in value. If the type is not
    /// recognized, it returns kAXValueIllegalType.
    @inlinable var type: AXValueType {
        return AXValueGetType(self)
    }
    
    /// Decodes the structure stored in value. If the type is not recognized,
    /// nil is returned.
    @inlinable var value: Any? {
        let type = self.type
        switch type {
        case .cgPoint, AXValueType(rawValue: kAXValueCGPointType)!:
            var value = CGPoint()
            let success = AXValueGetValue(self, type, &value)
            precondition(success)
            return value
        case .cgSize, AXValueType(rawValue: kAXValueCGSizeType)!:
            var value = CGSize()
            let success = AXValueGetValue(self, type, &value)
            precondition(success)
            return value
        case .cgRect, AXValueType(rawValue: kAXValueCGRectType)!:
            var value = CGRect()
            let success = AXValueGetValue(self, type, &value)
            precondition(success)
            return value
        case .cfRange, AXValueType(rawValue: kAXValueCFRangeType)!:
            var value = CFRange()
            let success = AXValueGetValue(self, type, &value)
            precondition(success)
            return value
        case .axError, AXValueType(rawValue: kAXValueAXErrorType)!:
            var value = AXError.success
            let success = AXValueGetValue(self, type, &value)
            precondition(success)
            return value
        case .illegal, AXValueType(rawValue: kAXValueIllegalType)!:
            return nil
        @unknown default:
            return nil
        }
        
    }
}

@available(macOS 10.11, *)
public extension AXValue {
    
    @inlinable static func cgPoint(_ value: CGPoint) -> AXValue {
        return AXValue.create(type: .cgPoint, value: value)!
    }
    
    @inlinable static func cgSize(_ value: CGSize) -> AXValue {
        return AXValue.create(type: .cgSize, value: value)!
    }
    
    @inlinable static func cgRect(_ value: CGRect) -> AXValue {
        return AXValue.create(type: .cgRect, value: value)!
    }
    
    @inlinable static func cfRange(_ value: CFRange) -> AXValue {
        return AXValue.create(type: .cfRange, value: value)!
    }
    
    @inlinable static func axError(_ value: AXError) -> AXValue {
        return AXValue.create(type: .axError, value: value)!
    }
    
    @inlinable static func illegal() -> AXValue {
        let value: Void = ()
        return AXValue.create(type: .illegal, value: value)!
    }
}

#endif // canImport(ApplicationServices)
