import CoreFoundation

public extension CFError {
    
    @inlinable static func create(allocator: CFAllocator = .default, domain: Domain, code: CFIndex, userInfo: [UserInfoKey: Any] = [:]) -> CFError {
        return CFErrorCreate(allocator, domain.rawValue, code, .from(userInfo))
    }
    
    @inlinable var domain: Domain {
        return Domain(CFErrorGetDomain(self))
    }
    
    @inlinable var code: CFIndex {
        return CFErrorGetCode(self)
    }
    
    @inlinable func userInfo() -> [UserInfoKey: Any] {
        return CFErrorCopyUserInfo(self)?.asSwift() ?? [:]
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
    static let posix = CFError.Domain(kCFErrorDomainPOSIX)
    static let osStatus = CFError.Domain(kCFErrorDomainOSStatus)
    static let mach = CFError.Domain(kCFErrorDomainMach)
    static let cocoa = CFError.Domain(kCFErrorDomainCocoa)
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
    static let localizedDescription = CFError.UserInfoKey(kCFErrorLocalizedDescriptionKey)
    @available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    static let localizedFailure = CFError.UserInfoKey(kCFErrorLocalizedFailureKey)
    static let localizedFailureReason = CFError.UserInfoKey(kCFErrorLocalizedFailureReasonKey)
    static let localizedRecoverySuggestion = CFError.UserInfoKey(kCFErrorLocalizedRecoverySuggestionKey)
    static let description = CFError.UserInfoKey(kCFErrorDescriptionKey)
    static let underlyingError = CFError.UserInfoKey(kCFErrorUnderlyingErrorKey)
    static let url = CFError.UserInfoKey(kCFErrorURLKey)
    static let filePath = CFError.UserInfoKey(kCFErrorFilePathKey)
}
