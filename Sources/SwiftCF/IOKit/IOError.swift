#if canImport(IOKit)

import IOKit

extension IOReturn {
    
    @usableFromInline func throwIfIOError() throws {
        if let err = IOError(rawValue: self) {
            throw err
        }
    }
}

public typealias IOError = KernelError

public extension IOError {
    /// General error
    static let ioError = IOError(rawValue: kIOReturnError)!
    /// Can't allocate memory
    static let ioNoMemory = IOError(rawValue: kIOReturnNoMemory)!
    /// Resource shortage
    static let ioNoResources = IOError(rawValue: kIOReturnNoResources)!
    /// Error during IPC
    static let ioIPCError = IOError(rawValue: kIOReturnIPCError)!
    /// No such device
    static let ioNoDevice = IOError(rawValue: kIOReturnNoDevice)!
    /// Privilege violation
    static let ioNotPrivileged = IOError(rawValue: kIOReturnNotPrivileged)!
    /// Invalid argument
    static let ioBadArgument = IOError(rawValue: kIOReturnBadArgument)!
    /// Device read locked
    static let ioLockedRead = IOError(rawValue: kIOReturnLockedRead)!
    /// Device write locked
    static let ioLockedWrite = IOError(rawValue: kIOReturnLockedWrite)!
    /// Exclusive access and device already open
    static let ioExclusiveAccess = IOError(rawValue: kIOReturnExclusiveAccess)!
    /// Sent/received messages had different msg_id
    static let ioBadMessageID = IOError(rawValue: kIOReturnBadMessageID)!
    /// Unsupported function
    static let ioUnsupported = IOError(rawValue: kIOReturnUnsupported)!
    /// Misc. VM failure
    static let ioVMError = IOError(rawValue: kIOReturnVMError)!
    /// Internal error
    static let ioInternalError = IOError(rawValue: kIOReturnInternalError)!
    /// General I/O error
    static let ioIOError = IOError(rawValue: kIOReturnIOError)!
    /// Can't acquire lock
    static let ioCannotLock = IOError(rawValue: kIOReturnCannotLock)!
    /// Device not open
    static let ioNotOpen = IOError(rawValue: kIOReturnNotOpen)!
    /// Read not supported
    static let ioNotReadable = IOError(rawValue: kIOReturnNotReadable)!
    /// Write not supported
    static let ioNotWritable = IOError(rawValue: kIOReturnNotWritable)!
    /// Alignment error
    static let ioNotAligned = IOError(rawValue: kIOReturnNotAligned)!
    /// Media error
    static let ioBadMedia = IOError(rawValue: kIOReturnBadMedia)!
    /// Device(s) still open
    static let ioStillOpen = IOError(rawValue: kIOReturnStillOpen)!
    /// RLD failure
    static let ioRLDError = IOError(rawValue: kIOReturnRLDError)!
    /// DMA failure
    static let ioDmaError = IOError(rawValue: kIOReturnDMAError)!
    /// Device busy
    static let ioBusy = IOError(rawValue: kIOReturnBusy)!
    /// I/O timeout
    static let ioTimeout = IOError(rawValue: kIOReturnTimeout)!
    /// Device offline
    static let ioOffline = IOError(rawValue: kIOReturnOffline)!
    /// Not ready
    static let ioNotReady = IOError(rawValue: kIOReturnNotReady)!
    /// Device not attached
    static let ioNotAttached = IOError(rawValue: kIOReturnNotAttached)!
    /// No DMA channels left
    static let ioNoChannels = IOError(rawValue: kIOReturnNoChannels)!
    /// No space for data
    static let ioNoSpace = IOError(rawValue: kIOReturnNoSpace)!
    /// Port already exists
    static let ioPortExists = IOError(rawValue: kIOReturnPortExists)!
    /// Can't wire down physical memory
    static let ioCannotWire = IOError(rawValue: kIOReturnCannotWire)!
    /// No interrupt attached
    static let ioNoInterrupt = IOError(rawValue: kIOReturnNoInterrupt)!
    /// No DMA frames enqueued
    static let ioNoFrames = IOError(rawValue: kIOReturnNoFrames)!
    /// Oversized msg received on interrupt port
    static let ioMessageTooLarge = IOError(rawValue: kIOReturnMessageTooLarge)!
    /// Not permitted
    static let ioNotPermitted = IOError(rawValue: kIOReturnNotPermitted)!
    /// No power to device
    static let ioNoPower = IOError(rawValue: kIOReturnNoPower)!
    /// Media not present
    static let ioNoMedia = IOError(rawValue: kIOReturnNoMedia)!
    /// media not formatted
    static let ioUnformattedMedia = IOError(rawValue: kIOReturnUnformattedMedia)!
    /// No such mode
    static let ioUnsupportedMode = IOError(rawValue: kIOReturnUnsupportedMode)!
    /// Data underrun
    static let ioUnderrun = IOError(rawValue: kIOReturnUnderrun)!
    /// Data overrun
    static let ioOverrun = IOError(rawValue: kIOReturnOverrun)!
    /// The device is not working properly
    static let ioDeviceError = IOError(rawValue: kIOReturnDeviceError)!
    /// A completion routine is required
    static let ioNoCompletion = IOError(rawValue: kIOReturnNoCompletion)!
    /// Operation aborted
    static let ioAborted = IOError(rawValue: kIOReturnAborted)!
    /// Bus bandwidth would be exceeded
    static let ioNoBandwidth = IOError(rawValue: kIOReturnNoBandwidth)!
    /// Device not responding
    static let ioNotResponding = IOError(rawValue: kIOReturnNotResponding)!
    /// Isochronous I/O request for distant past
    static let ioIsoTooOld = IOError(rawValue: kIOReturnIsoTooOld)!
    /// Isochronous I/O request for distant future
    static let ioIsoTooNew = IOError(rawValue: kIOReturnIsoTooNew)!
    /// Data was not found
    static let ioNotFound = IOError(rawValue: kIOReturnNotFound)!
    /// Should never be seen
    static let ioInvalid = IOError(rawValue: kIOReturnInvalid)!
}

#endif // canImport(IOKit)
