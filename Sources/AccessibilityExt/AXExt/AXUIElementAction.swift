#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

extension AXUIElement {
    
    /// Many UIElements have a set of actions that they can perform. Actions are
    /// designed to be simple. Actions roughly correspond to things you could do
    /// with a single click of the mouse on the UIElement. Buttons and menu
    /// items, for example, have a single action: push or pick, respectively. A
    /// scroll bar has several actions: page up, page down, up one line, down
    /// one line.
    public struct Action: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

private func action(_ key: String) -> AXUIElement.Action {
    return key as CFString as AXUIElement.Action
}

/// Standard Actions
public extension AXUIElement.Action {
    
    /// Simulate clicking the UIElement, such as a button.
    static let press = action(kAXPressAction)
    
    /// Increment the value of the UIElement.
    static let increment = action(kAXIncrementAction)
    
    /// Decrement the value of the UIElement.
    static let decrement = action(kAXDecrementAction)
    
    /// Simulate pressing Return in the UIElement, such as a text field.
    ///
    /// Don't know if this is still correct. Is this what used to be kAXAcceptAction?
    static let confirm = action(kAXConfirmAction)
    
    /// Simulate a Cancel action, such as hitting the Cancel button.
    static let cancel = action(kAXCancelAction)
    
    /// Show alternate or hidden UI.
    ///
    /// This is often used to trigger the same change that would occur on a mouse hover.
    static let showAlternateUI = action(kAXShowAlternateUIAction)
    
    /// Show default UI.
    ///
    /// This is often used to trigger the same change that would occur when a mouse hover ends.
    static let showDefaultUI = action(kAXShowDefaultUIAction)
}

/// New Actions
public extension AXUIElement.Action {
    static let raise = action(kAXRaiseAction)
    static let showMenu = action(kAXShowMenuAction)
}

/// Obsolete Actions
public extension AXUIElement.Action {
    /// Select the UIElement, such as a menu item.
    static let pick = action(kAXPickAction)
}

#endif // canImport(ApplicationServices)
