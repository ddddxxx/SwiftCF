#if os(macOS)

import SwiftCF
import CoreGraphics

// namespace of CGWindow related functions
public enum CGWindow {
    
    public typealias ID = CGWindowID
    public typealias ListOption = CGWindowListOption
}

public extension CGWindow {
    
    /// Return an array of window dictionaries for windows within the user
    /// session.
    /// This function returns NULL if the caller is not running within a Quartz
    /// GUI session or the window server is disabled. You should release the
    /// array when you are finished using it.
    static func windowInfoList(relativeTo window: ID = kCGNullWindowID, option: ListOption = []) -> [[InfoKey: Any]] {
        return CGWindowListCopyWindowInfo(option, window) as! [[InfoKey: Any]]? ?? []
    }
}

#endif
