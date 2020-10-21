#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

public struct AXRole: CFStringKey {
    
    public let rawValue: CFString
    
    public init(_ key: CFString) {
        rawValue = key
    }
}

private func role(_ key: String) -> AXRole {
    return key as CFString as AXRole
}

public extension AXRole {
    static let application = role(kAXApplicationRole)
    static let systemWide = role(kAXSystemWideRole)
    static let window = role(kAXWindowRole)
    static let sheet = role(kAXSheetRole)
    static let drawer = role(kAXDrawerRole)
    static let growArea = role(kAXGrowAreaRole)
    static let image = role(kAXImageRole)
    static let unknown = role(kAXUnknownRole)
    static let button = role(kAXButtonRole)
    static let radioButton = role(kAXRadioButtonRole)
    static let checkBox = role(kAXCheckBoxRole)
    static let popUpButton = role(kAXPopUpButtonRole)
    static let menuButton = role(kAXMenuButtonRole)
    static let tabGroup = role(kAXTabGroupRole)
    static let table = role(kAXTableRole)
    static let column = role(kAXColumnRole)
    static let row = role(kAXRowRole)
    static let outline = role(kAXOutlineRole)
    static let browser = role(kAXBrowserRole)
    static let scrollArea = role(kAXScrollAreaRole)
    static let scrollBar = role(kAXScrollBarRole)
    static let radioGroup = role(kAXRadioGroupRole)
    static let list = role(kAXListRole)
    static let group = role(kAXGroupRole)
    static let valueIndicator = role(kAXValueIndicatorRole)
    static let comboBox = role(kAXComboBoxRole)
    static let slider = role(kAXSliderRole)
    static let incrementor = role(kAXIncrementorRole)
    static let busyIndicator = role(kAXBusyIndicatorRole)
    static let progressIndicator = role(kAXProgressIndicatorRole)
    static let relevanceIndicator = role(kAXRelevanceIndicatorRole)
    static let toolbar = role(kAXToolbarRole)
    static let disclosureTriangle = role(kAXDisclosureTriangleRole)
    static let textField = role(kAXTextFieldRole)
    static let textArea = role(kAXTextAreaRole)
    static let staticText = role(kAXStaticTextRole)
    static let menuBar = role(kAXMenuBarRole)
    static let menuBarItem = role(kAXMenuBarItemRole)
    static let menu = role(kAXMenuRole)
    static let menuItem = role(kAXMenuItemRole)
    static let splitGroup = role(kAXSplitGroupRole)
    static let splitter = role(kAXSplitterRole)
    static let colorWell = role(kAXColorWellRole)
    static let timeField = role(kAXTimeFieldRole)
    static let dateField = role(kAXDateFieldRole)
    static let helpTag = role(kAXHelpTagRole)
    static let matte = role(kAXMatteRole)
    static let dockItem = role(kAXDockItemRole)
    static let ruler = role(kAXRulerRole)
    static let rulerMarker = role(kAXRulerMarkerRole)
    static let grid = role(kAXGridRole)
    static let levelIndicator = role(kAXLevelIndicatorRole)
    static let cell = role(kAXCellRole)
    static let layoutArea = role(kAXLayoutAreaRole)
    static let layoutItem = role(kAXLayoutItemRole)
    static let handle = role(kAXHandleRole)
    static let popover = role(kAXPopoverRole)
}

#endif // canImport(ApplicationServices)
