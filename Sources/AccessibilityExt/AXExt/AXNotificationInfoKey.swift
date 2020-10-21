#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

extension AXNotification {
    
    public struct InfoKey: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

private func key(_ key: String) -> AXNotification.InfoKey {
    return key as CFString as AXNotification.InfoKey
}

public extension AXNotification.InfoKey {
    /// Notification info key used to specify an element.
    static let uiElements = key(kAXUIElementsKey)
    /// Notification info key used to specify a priority for the notification. See AXPriority.
    static let priority = key(kAXPriorityKey)
    /// Notification info key used to specify an announcement to be spoken with a notification.
    static let announcement = key(kAXAnnouncementKey)
    /// Notification info key used to specify the title of an element to be spoken with a notification.
    static let uiElementTitle = key(kAXUIElementTitleKey)
}

#endif // canImport(ApplicationServices)
