#if canImport(ApplicationServices)

import ApplicationServices

extension AXError: Error {}

extension AXError {
    
    @usableFromInline func throwIfError() throws {
        if self != .success {
            throw self
        }
    }
}

#endif // canImport(ApplicationServices)
