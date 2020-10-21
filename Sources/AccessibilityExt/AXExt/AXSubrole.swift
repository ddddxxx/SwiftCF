#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

public struct AXSubrole: CFStringKey {
    
    public let rawValue: CFString
    
    public init(_ key: CFString) {
        rawValue = key
    }
}

private func subrole(_ key: String) -> AXSubrole {
    return key as CFString as AXSubrole
}

/// standard subroles
public extension AXSubrole {
    static let closeButton = subrole(kAXCloseButtonSubrole)
    static let minimizeButton = subrole(kAXMinimizeButtonSubrole)
    static let zoomButton = subrole(kAXZoomButtonSubrole)
    static let toolbarButton = subrole(kAXToolbarButtonSubrole)
    static let fullScreenButton = subrole(kAXFullScreenButtonSubrole)
    static let secureTextField = subrole(kAXSecureTextFieldSubrole)
    static let tableRow = subrole(kAXTableRowSubrole)
    static let outlineRow = subrole(kAXOutlineRowSubrole)
    static let unknown = subrole(kAXUnknownSubrole)
}
/// new subroles
public extension AXSubrole {
    static let standardWindow = subrole(kAXStandardWindowSubrole)
    static let dialog = subrole(kAXDialogSubrole)
    static let systemDialog = subrole(kAXSystemDialogSubrole)
    static let floatingWindow = subrole(kAXFloatingWindowSubrole)
    static let systemFloatingWindow = subrole(kAXSystemFloatingWindowSubrole)
    static let decorative = subrole(kAXDecorativeSubrole)
    static let incrementArrow = subrole(kAXIncrementArrowSubrole)
    static let decrementArrow = subrole(kAXDecrementArrowSubrole)
    static let incrementPage = subrole(kAXIncrementPageSubrole)
    static let decrementPage = subrole(kAXDecrementPageSubrole)
    static let sortButton = subrole(kAXSortButtonSubrole)
    static let searchField = subrole(kAXSearchFieldSubrole)
    static let timeline = subrole(kAXTimelineSubrole)
    static let ratingIndicator = subrole(kAXRatingIndicatorSubrole)
    static let contentList = subrole(kAXContentListSubrole)
    /// superceded by kAXDescriptionListSubrole in OS X 10.9
    static let definitionList = subrole(kAXDefinitionListSubrole)
    /// OS X 10.9 and later
    static let descriptionList = subrole(kAXDescriptionListSubrole)
    static let toggle = subrole(kAXToggleSubrole)
    static let `switch` = subrole(kAXSwitchSubrole)
}

/// dock subroles
public extension AXSubrole {
    static let applicationDockItem = subrole(kAXApplicationDockItemSubrole)
    static let documentDockItem = subrole(kAXDocumentDockItemSubrole)
    static let folderDockItem = subrole(kAXFolderDockItemSubrole)
    static let minimizedWindowDockItem = subrole(kAXMinimizedWindowDockItemSubrole)
    static let uRLDockItem = subrole(kAXURLDockItemSubrole)
    static let dockExtraDockItem = subrole(kAXDockExtraDockItemSubrole)
    static let trashDockItem = subrole(kAXTrashDockItemSubrole)
    static let separatorDockItem = subrole(kAXSeparatorDockItemSubrole)
    static let processSwitcherList = subrole(kAXProcessSwitcherListSubrole)
}

#endif // canImport(ApplicationServices)
