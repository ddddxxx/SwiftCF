import CoreFoundation

public extension CFDictionary {
    
    @inlinable static func create(allocator: CFAllocator = .default, keys: UnsafeMutablePointer<UnsafeRawPointer?>?, values: UnsafeMutablePointer<UnsafeRawPointer?>?, count: CFIndex, keyCallBacks: UnsafePointer<CFDictionaryKeyCallBacks>? = pCFTypeDictionaryKeyCallBacks, valueCallBacks: UnsafePointer<CFDictionaryValueCallBacks>? = pCFTypeDictionaryValueCallBacks) -> CFDictionary {
        return CFDictionaryCreate(allocator, keys, values, count, keyCallBacks, valueCallBacks)
    }
    
    static let empty = CFDictionary.create(keys: nil, values: nil, count: 0)
    
    @inlinable var count: CFIndex {
        return CFDictionaryGetCount(self)
    }
    
    @inlinable func count(ofKey key: CFTypeRef) -> CFIndex {
        return CFDictionaryGetCountOfKey(self, bridge(key))
    }
    
    @inlinable func count(ofValue value: CFTypeRef) -> CFIndex {
        return CFDictionaryGetCountOfValue(self, bridge(value))
    }
    
    @inlinable func contains(key: CFTypeRef) -> Bool {
        return CFDictionaryContainsValue(self, bridge(key))
    }
    
    @inlinable func contains(value: CFTypeRef) -> Bool {
        return CFDictionaryContainsValue(self, bridge(value))
    }
    
    @inlinable func value(key: CFTypeRef) -> CFTypeRef? {
        return rawValue(key: key).map(bridge)
    }
    
    @inlinable func rawValue(key: CFTypeRef) -> UnsafeRawPointer? {
        return CFDictionaryGetValue(self, bridge(key))
    }
}
