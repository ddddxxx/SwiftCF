#if canImport(ApplicationServices)

import SwiftCF
import ApplicationServices

extension AXUIElement: CFType {
    
    public static let typeID = AXUIElementGetTypeID()
}

extension AXObserver: CFType {
    
    public static let typeID = AXObserverGetTypeID()
}

extension AXValue: CFType {
    
    public static let typeID = AXValueGetTypeID()
}

#endif // canImport(ApplicationServices)
