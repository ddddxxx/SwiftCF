#if canImport(IOKit)

import SwiftCF
import IOKit

extension IOReturn {
    
    @usableFromInline func throwIfIOError() throws {
        if let err = KernelError(rawValue: self) {
            throw err
        }
    }
}

/// A namespace for IOReturn errors.
public enum IOError {}

public extension IOError {
    /// General error
    static let error = KernelError(rawValue: kIOReturnError)!
    /// Can't allocate memory
    static let noMemory = KernelError(rawValue: kIOReturnNoMemory)!
    /// Resource shortage
    static let noResources = KernelError(rawValue: kIOReturnNoResources)!
    /// Error during IPC
    static let ipcError = KernelError(rawValue: kIOReturnIPCError)!
    /// No such device
    static let noDevice = KernelError(rawValue: kIOReturnNoDevice)!
    /// Privilege violation
    static let notPrivileged = KernelError(rawValue: kIOReturnNotPrivileged)!
    /// Invalid argument
    static let badArgument = KernelError(rawValue: kIOReturnBadArgument)!
    /// Device read locked
    static let lockedRead = KernelError(rawValue: kIOReturnLockedRead)!
    /// Device write locked
    static let lockedWrite = KernelError(rawValue: kIOReturnLockedWrite)!
    /// Exclusive access and device already open
    static let exclusiveAccess = KernelError(rawValue: kIOReturnExclusiveAccess)!
    /// Sent/received messages had different msg_id
    static let badMessageID = KernelError(rawValue: kIOReturnBadMessageID)!
    /// Unsupported function
    static let unsupported = KernelError(rawValue: kIOReturnUnsupported)!
    /// Misc. VM failure
    static let vmError = KernelError(rawValue: kIOReturnVMError)!
    /// Internal error
    static let internalError = KernelError(rawValue: kIOReturnInternalError)!
    /// General I/O error
    static let ioError = KernelError(rawValue: kIOReturnIOError)!
    /// Can't acquire lock
    static let cannotLock = KernelError(rawValue: kIOReturnCannotLock)!
    /// Device not open
    static let notOpen = KernelError(rawValue: kIOReturnNotOpen)!
    /// Read not supported
    static let notReadable = KernelError(rawValue: kIOReturnNotReadable)!
    /// Write not supported
    static let notWritable = KernelError(rawValue: kIOReturnNotWritable)!
    /// Alignment error
    static let notAligned = KernelError(rawValue: kIOReturnNotAligned)!
    /// Media error
    static let badMedia = KernelError(rawValue: kIOReturnBadMedia)!
    /// Device(s) still open
    static let stillOpen = KernelError(rawValue: kIOReturnStillOpen)!
    /// RLD failure
    static let rldError = KernelError(rawValue: kIOReturnRLDError)!
    /// DMA failure
    static let dmaError = KernelError(rawValue: kIOReturnDMAError)!
    /// Device busy
    static let busy = KernelError(rawValue: kIOReturnBusy)!
    /// I/O timeout
    static let timeout = KernelError(rawValue: kIOReturnTimeout)!
    /// Device offline
    static let offline = KernelError(rawValue: kIOReturnOffline)!
    /// Not ready
    static let notReady = KernelError(rawValue: kIOReturnNotReady)!
    /// Device not attached
    static let notAttached = KernelError(rawValue: kIOReturnNotAttached)!
    /// No DMA channels left
    static let noChannels = KernelError(rawValue: kIOReturnNoChannels)!
    /// No space for data
    static let noSpace = KernelError(rawValue: kIOReturnNoSpace)!
    /// Port already exists
    static let portExists = KernelError(rawValue: kIOReturnPortExists)!
    /// Can't wire down physical memory
    static let cannotWire = KernelError(rawValue: kIOReturnCannotWire)!
    /// No interrupt attached
    static let noInterrupt = KernelError(rawValue: kIOReturnNoInterrupt)!
    /// No DMA frames enqueued
    static let noFrames = KernelError(rawValue: kIOReturnNoFrames)!
    /// Oversized msg received on interrupt port
    static let messageTooLarge = KernelError(rawValue: kIOReturnMessageTooLarge)!
    /// Not permitted
    static let notPermitted = KernelError(rawValue: kIOReturnNotPermitted)!
    /// No power to device
    static let noPower = KernelError(rawValue: kIOReturnNoPower)!
    /// Media not present
    static let noMedia = KernelError(rawValue: kIOReturnNoMedia)!
    /// media not formatted
    static let unformattedMedia = KernelError(rawValue: kIOReturnUnformattedMedia)!
    /// No such mode
    static let unsupportedMode = KernelError(rawValue: kIOReturnUnsupportedMode)!
    /// Data underrun
    static let underrun = KernelError(rawValue: kIOReturnUnderrun)!
    /// Data overrun
    static let overrun = KernelError(rawValue: kIOReturnOverrun)!
    /// The device is not working properly
    static let deviceError = KernelError(rawValue: kIOReturnDeviceError)!
    /// A completion routine is required
    static let noCompletion = KernelError(rawValue: kIOReturnNoCompletion)!
    /// Operation aborted
    static let aborted = KernelError(rawValue: kIOReturnAborted)!
    /// Bus bandwidth would be exceeded
    static let noBandwidth = KernelError(rawValue: kIOReturnNoBandwidth)!
    /// Device not responding
    static let notResponding = KernelError(rawValue: kIOReturnNotResponding)!
    /// Isochronous I/O request for distant past
    static let isoTooOld = KernelError(rawValue: kIOReturnIsoTooOld)!
    /// Isochronous I/O request for distant future
    static let isoTooNew = KernelError(rawValue: kIOReturnIsoTooNew)!
    /// Data was not found
    static let notFound = KernelError(rawValue: kIOReturnNotFound)!
    /// Should never be seen
    static let invalid = KernelError(rawValue: kIOReturnInvalid)!
}

public extension KernelError {
    /// A namespace for IOReturn errors.
    static let io = IOError.self
}

#endif // canImport(IOKit)
