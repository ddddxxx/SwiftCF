#if os(macOS)

import CoreGraphics

// namespace of CGWindow related functions
public enum CGWindow {
    
    public typealias ID = CGWindowID
    public typealias ListOption = CGWindowListOption
}

public extension CGWindow {
    
    static func windowInfoList(relativeTo window: ID = kCGNullWindowID, option: ListOption = []) -> [[InfoKey: Any]] {
        return CGWindowListCopyWindowInfo(option, window) as! [[InfoKey: Any]]? ?? []
    }
}

#endif
