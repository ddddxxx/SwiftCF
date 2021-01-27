#if os(macOS)

import SwiftCF
import CoreGraphics

extension CGWindow {
    
    public struct InfoKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGWindow.InfoKey {
    // required keys
    static let number = kCGWindowNumber as CGWindow.InfoKey
    static let storeType = kCGWindowStoreType as CGWindow.InfoKey
    static let layer = kCGWindowLayer as CGWindow.InfoKey
    static let bounds = kCGWindowBounds as CGWindow.InfoKey
    static let sharingState = kCGWindowSharingState as CGWindow.InfoKey
    static let alpha = kCGWindowAlpha as CGWindow.InfoKey
    static let ownerPID = kCGWindowOwnerPID as CGWindow.InfoKey
    static let memoryUsage = kCGWindowMemoryUsage as CGWindow.InfoKey
    // optional keys
    static let ownerName = kCGWindowOwnerName as CGWindow.InfoKey
    static let name = kCGWindowName as CGWindow.InfoKey
    static let isOnscreen = kCGWindowIsOnscreen as CGWindow.InfoKey
    static let backingLocationVideoMemory = kCGWindowBackingLocationVideoMemory as CGWindow.InfoKey
}

#endif
