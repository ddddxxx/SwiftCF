import CoreFoundation

public extension CFError {
    
    @inlinable static func create(allocator: CFAllocator = .default, domain: Domain, code: CFIndex, userInfo: [UserInfoKey: Any] = [:]) -> CFError {
        return CFErrorCreate(allocator, domain as CFErrorDomain, code, userInfo as CFDictionary)
    }
    
    @inlinable var domain: Domain {
        return CFErrorGetDomain(self) as Domain
    }
    
    @inlinable var code: CFIndex {
        return CFErrorGetCode(self)
    }
    
    @inlinable func userInfo() -> [UserInfoKey: Any] {
        return CFErrorCopyUserInfo(self) as! [UserInfoKey: Any]? ?? [:]
    }
    
    @inlinable func description() -> CFString? {
        return CFErrorCopyDescription(self)
    }
    
    @inlinable func failureReason() -> CFString? {
        return CFErrorCopyFailureReason(self)
    }
    
    @inlinable func recoverySuggestion() -> CFString? {
        return CFErrorCopyRecoverySuggestion(self)
    }
}

// MARK: - Domain

extension CFError {
    
    public struct Domain: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CFError.Domain {
    static let posix = kCFErrorDomainPOSIX as CFError.Domain
    static let osStatus = kCFErrorDomainOSStatus as CFError.Domain
    static let mach = kCFErrorDomainMach as CFError.Domain
    static let cocoa = kCFErrorDomainCocoa as CFError.Domain
}

// MARK: - UserInfoKey

extension CFError {
    
    public struct UserInfoKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CFError.UserInfoKey {
    static let localizedDescription = kCFErrorLocalizedDescriptionKey as CFError.UserInfoKey
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let localizedFailure = kCFErrorLocalizedFailureKey as CFError.UserInfoKey
    static let localizedFailureReason = kCFErrorLocalizedFailureReasonKey as CFError.UserInfoKey
    static let localizedRecoverySuggestion = kCFErrorLocalizedRecoverySuggestionKey as CFError.UserInfoKey
    static let description = kCFErrorDescriptionKey as CFError.UserInfoKey
    static let underlyingError = kCFErrorUnderlyingErrorKey as CFError.UserInfoKey
    static let url = kCFErrorURLKey as CFError.UserInfoKey
    static let filePath = kCFErrorFilePathKey as CFError.UserInfoKey
}
