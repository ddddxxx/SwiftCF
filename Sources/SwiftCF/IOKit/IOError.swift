#if canImport(IOKit)

import IOKit
import Foundation

extension IOReturn {
    
    @usableFromInline func throwIfError() throws {
        if let err = IOError(rawValue: self) {
            throw err
        }
    }
}

public struct IOError: Error, RawRepresentable, Equatable, Hashable {
    
    public var rawValue: IOReturn
    
    public init?(rawValue: IOReturn) {
        guard rawValue != kIOReturnSuccess else {
            return nil
        }
        self.rawValue = rawValue
    }
}

public extension IOError {
    /// General error
    static let error = IOError(rawValue: kIOReturnError)!
    /// Can't allocate memory
    static let noMemory = IOError(rawValue: kIOReturnNoMemory)!
    /// Resource shortage
    static let noResources = IOError(rawValue: kIOReturnNoResources)!
    /// Error during IPC
    static let ipcError = IOError(rawValue: kIOReturnIPCError)!
    /// No such device
    static let noDevice = IOError(rawValue: kIOReturnNoDevice)!
    /// Privilege violation
    static let notPrivileged = IOError(rawValue: kIOReturnNotPrivileged)!
    /// Invalid argument
    static let badArgument = IOError(rawValue: kIOReturnBadArgument)!
    /// Device read locked
    static let lockedRead = IOError(rawValue: kIOReturnLockedRead)!
    /// Device write locked
    static let lockedWrite = IOError(rawValue: kIOReturnLockedWrite)!
    /// Exclusive access and device already open
    static let exclusiveAccess = IOError(rawValue: kIOReturnExclusiveAccess)!
    /// Sent/received messages had different msg_id
    static let badMessageID = IOError(rawValue: kIOReturnBadMessageID)!
    /// Unsupported function
    static let unsupported = IOError(rawValue: kIOReturnUnsupported)!
    /// Misc. VM failure
    static let vmError = IOError(rawValue: kIOReturnVMError)!
    /// Internal error
    static let internalError = IOError(rawValue: kIOReturnInternalError)!
    /// General I/O error
    static let ioError = IOError(rawValue: kIOReturnIOError)!
    /// Can't acquire lock
    static let cannotLock = IOError(rawValue: kIOReturnCannotLock)!
    /// Device not open
    static let notOpen = IOError(rawValue: kIOReturnNotOpen)!
    /// Read not supported
    static let notReadable = IOError(rawValue: kIOReturnNotReadable)!
    /// Write not supported
    static let notWritable = IOError(rawValue: kIOReturnNotWritable)!
    /// Alignment error
    static let notAligned = IOError(rawValue: kIOReturnNotAligned)!
    /// Media error
    static let badMedia = IOError(rawValue: kIOReturnBadMedia)!
    /// Device(s) still open
    static let stillOpen = IOError(rawValue: kIOReturnStillOpen)!
    /// RLD failure
    static let rldError = IOError(rawValue: kIOReturnRLDError)!
    /// DMA failure
    static let dmaError = IOError(rawValue: kIOReturnDMAError)!
    /// Device busy
    static let busy = IOError(rawValue: kIOReturnBusy)!
    /// I/O timeout
    static let timeout = IOError(rawValue: kIOReturnTimeout)!
    /// Device offline
    static let offline = IOError(rawValue: kIOReturnOffline)!
    /// Not ready
    static let notReady = IOError(rawValue: kIOReturnNotReady)!
    /// Device not attached
    static let notAttached = IOError(rawValue: kIOReturnNotAttached)!
    /// No DMA channels left
    static let noChannels = IOError(rawValue: kIOReturnNoChannels)!
    /// No space for data
    static let noSpace = IOError(rawValue: kIOReturnNoSpace)!
    /// Port already exists
    static let portExists = IOError(rawValue: kIOReturnPortExists)!
    /// Can't wire down physical memory
    static let cannotWire = IOError(rawValue: kIOReturnCannotWire)!
    /// No interrupt attached
    static let noInterrupt = IOError(rawValue: kIOReturnNoInterrupt)!
    /// No DMA frames enqueued
    static let noFrames = IOError(rawValue: kIOReturnNoFrames)!
    /// Oversized msg received on interrupt port
    static let messageTooLarge = IOError(rawValue: kIOReturnMessageTooLarge)!
    /// Not permitted
    static let notPermitted = IOError(rawValue: kIOReturnNotPermitted)!
    /// No power to device
    static let noPower = IOError(rawValue: kIOReturnNoPower)!
    /// Media not present
    static let noMedia = IOError(rawValue: kIOReturnNoMedia)!
    /// media not formatted
    static let unformattedMedia = IOError(rawValue: kIOReturnUnformattedMedia)!
    /// No such mode
    static let unsupportedMode = IOError(rawValue: kIOReturnUnsupportedMode)!
    /// Data underrun
    static let underrun = IOError(rawValue: kIOReturnUnderrun)!
    /// Data overrun
    static let overrun = IOError(rawValue: kIOReturnOverrun)!
    /// The device is not working properly
    static let deviceError = IOError(rawValue: kIOReturnDeviceError)!
    /// A completion routine is required
    static let noCompletion = IOError(rawValue: kIOReturnNoCompletion)!
    /// Operation aborted
    static let aborted = IOError(rawValue: kIOReturnAborted)!
    /// Bus bandwidth would be exceeded
    static let noBandwidth = IOError(rawValue: kIOReturnNoBandwidth)!
    /// Device not responding
    static let notResponding = IOError(rawValue: kIOReturnNotResponding)!
    /// Isochronous I/O request for distant past
    static let isoTooOld = IOError(rawValue: kIOReturnIsoTooOld)!
    /// Isochronous I/O request for distant future
    static let isoTooNew = IOError(rawValue: kIOReturnIsoTooNew)!
    /// Data was not found
    static let notFound = IOError(rawValue: kIOReturnNotFound)!
    /// Should never be seen
    static let invalid = IOError(rawValue: kIOReturnInvalid)!
}

extension IOError: CustomNSError {
    
    public static let errorDomain = "ddddxxx.SwiftCF.IOKit"
    
    public var errorCode: Int {
        return Int(rawValue)
    }
    
    public var errorUserInfo: [String: Any] {
        guard let desc = errorDescription else { return [:] }
        return [NSLocalizedDescriptionKey: desc]
    }
}

extension IOError: LocalizedError {
    
    public var errorDescription: String? {
        switch self.rawValue {
        case kIOReturnError: return "General error"
        case kIOReturnNoMemory: return "Can't allocate memory"
        case kIOReturnNoResources: return "Resource shortage"
        case kIOReturnIPCError: return "Error during IPC"
        case kIOReturnNoDevice: return "No such device"
        case kIOReturnNotPrivileged: return "Privilege violation"
        case kIOReturnBadArgument: return "Invalid argument"
        case kIOReturnLockedRead: return "Device read locked"
        case kIOReturnLockedWrite: return "Device write locked"
        case kIOReturnExclusiveAccess: return "Exclusive access and device already open"
        case kIOReturnBadMessageID: return "Sent/received messages had different msg_id"
        case kIOReturnUnsupported: return "Unsupported function"
        case kIOReturnVMError: return "Misc. VM failure"
        case kIOReturnInternalError: return "Internal error"
        case kIOReturnIOError: return "General I/O error"
        case kIOReturnCannotLock: return "Can't acquire lock"
        case kIOReturnNotOpen: return "Device not open"
        case kIOReturnNotReadable: return "Read not supported"
        case kIOReturnNotWritable: return "Write not supported"
        case kIOReturnNotAligned: return "Alignment error"
        case kIOReturnBadMedia: return "Media error"
        case kIOReturnStillOpen: return "Device(s) still open"
        case kIOReturnRLDError: return "RLD failure"
        case kIOReturnDMAError: return "DMA failure"
        case kIOReturnBusy: return "Device busy"
        case kIOReturnTimeout: return "I/O timeout"
        case kIOReturnOffline: return "Device offline"
        case kIOReturnNotReady: return "Not ready"
        case kIOReturnNotAttached: return "Device not attached"
        case kIOReturnNoChannels: return "No DMA channels left"
        case kIOReturnNoSpace: return "No space for data"
        case kIOReturnPortExists: return "Port already exists"
        case kIOReturnCannotWire: return "Can't wire down physical memory"
        case kIOReturnNoInterrupt: return "No interrupt attached"
        case kIOReturnNoFrames: return "No DMA frames enqueued"
        case kIOReturnMessageTooLarge: return "Oversized msg received on interrupt port"
        case kIOReturnNotPermitted: return "Not permitted"
        case kIOReturnNoPower: return "No power to device"
        case kIOReturnNoMedia: return "Media not present"
        case kIOReturnUnformattedMedia: return "media not formatted"
        case kIOReturnUnsupportedMode: return "No such mode"
        case kIOReturnUnderrun: return "Data underrun"
        case kIOReturnOverrun: return "Data overrun"
        case kIOReturnDeviceError: return "The device is not working properly"
        case kIOReturnNoCompletion: return "A completion routine is required"
        case kIOReturnAborted: return "Operation aborted"
        case kIOReturnNoBandwidth: return "Bus bandwidth would be exceeded"
        case kIOReturnNotResponding: return "Device not responding"
        case kIOReturnIsoTooOld: return "Isochronous I/O request for distant past"
        case kIOReturnIsoTooNew: return "Isochronous I/O request for distant future"
        case kIOReturnNotFound: return "Data was not found"
        case kIOReturnInvalid: return "Should never be seen"
        case kIOReturnSuccess: return "No Error"
        default: return "Unknown error"
        }
    }
}

#endif // canImport(IOKit)
