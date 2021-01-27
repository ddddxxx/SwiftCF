import CoreFoundation

public extension CFDictionary {
    
    static let empty = CFDictionary.create(keys: nil, values: nil, count: 0)
    
    @inlinable static func create(allocator: CFAllocator = .default, keys: UnsafeMutablePointer<UnsafeRawPointer?>?, values: UnsafeMutablePointer<UnsafeRawPointer?>?, count: CFIndex, keyCallBacks: UnsafePointer<CFDictionaryKeyCallBacks>? = pCFTypeDictionaryKeyCallBacks, valueCallBacks: UnsafePointer<CFDictionaryValueCallBacks>? = pCFTypeDictionaryValueCallBacks) -> CFDictionary {
        return CFDictionaryCreate(allocator, keys, values, count, keyCallBacks, valueCallBacks)
    }
    
    @inlinable func copy(allocator: CFAllocator = .default) -> CFDictionary {
        return CFDictionaryCreateCopy(allocator, self)
    }
    
    @inlinable func mutableCopy(allocator: CFAllocator = .default, capacity: CFIndex = 0) -> CFMutableDictionary {
        return CFDictionaryCreateMutableCopy(allocator, capacity, self)
    }
    
    @inlinable var count: CFIndex {
        return CFDictionaryGetCount(self)
    }
    
    @inlinable func count(ofKey key: CFTypeRef) -> CFIndex {
        return CFDictionaryGetCountOfKey(self, .fromCF(key))
    }
    
    @inlinable func count(ofValue value: CFTypeRef) -> CFIndex {
        return CFDictionaryGetCountOfValue(self, .fromCF(value))
    }
    
    @inlinable func contains(key: CFTypeRef) -> Bool {
        return CFDictionaryContainsValue(self, .fromCF(key))
    }
    
    @inlinable func contains(value: CFTypeRef) -> Bool {
        return CFDictionaryContainsValue(self, .fromCF(value))
    }
    
    @inlinable func value(key: CFTypeRef) -> CFTypeRef? {
        return rawValue(key: key)?.asCF()
    }
    
    @inlinable func rawValue(key: CFTypeRef) -> UnsafeRawPointer? {
        return CFDictionaryGetValue(self, .fromCF(key))
    }
}

public extension CFMutableDictionary {
    
    @inlinable static func create(allocator: CFAllocator = .default, capacity: CFIndex, keyCallBacks: UnsafePointer<CFDictionaryKeyCallBacks>? = pCFTypeDictionaryKeyCallBacks, valueCallBacks: UnsafePointer<CFDictionaryValueCallBacks>? = pCFTypeDictionaryValueCallBacks) -> CFMutableDictionary {
        return CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks)
    }
    
    @inlinable func addValue(_ value: CFTypeRef, for key: CFTypeRef) {
        CFDictionaryAddValue(self, .fromCF(key), .fromCF(value))
    }
    
    @inlinable func setValue(_ value: CFTypeRef, for key: CFTypeRef) {
        CFDictionarySetValue(self, .fromCF(key), .fromCF(value))
    }
    
    @inlinable func replaceValue(_ value: CFTypeRef, for key: CFTypeRef) {
        CFDictionaryReplaceValue(self, .fromCF(key), .fromCF(value))
    }
    
    @inlinable func removeValue(for key: CFTypeRef) {
        CFDictionaryRemoveValue(self, .fromCF(key))
    }
    
    @inlinable func removeAllValues() {
        CFDictionaryRemoveAllValues(self)
    }
}
