#if canImport(Darwin)

import Darwin.Mach

extension kern_return_t {
    
    @usableFromInline func throwIfKernelError() throws {
        if let err = KernelError(rawValue: self) {
            throw err
        }
    }
}

public struct KernelError: Error, RawRepresentable, Equatable, Hashable {
    
    public static let errorDomain = "ddddxxx.SwiftCF.KernelError"
    
    public var rawValue: kern_return_t
    
    public init?(rawValue: kern_return_t) {
        guard rawValue != KERN_SUCCESS else {
            return nil
        }
        self.rawValue = rawValue
    }
    
    public var errorDescription: String? {
        guard let cstr = mach_error_string(rawValue) else {
            return "Unknown kernel error \(rawValue)"
        }
        return String(cString: cstr)
    }
}

public extension KernelError {
    /// Specified address is not currently valid.
    static let invalidAddress = KernelError(rawValue: KERN_INVALID_ADDRESS)!
    /// Specified memory is valid, but does not permit the required forms of
    /// access.
    static let protectionFailure = KernelError(rawValue: KERN_PROTECTION_FAILURE)!
    /// The address range specified is already in use, or no address range of
    /// the size specified could be found.
    static let noSpace = KernelError(rawValue: KERN_NO_SPACE)!
    /// The function requested was not applicable to this type of argument, or
    /// an argument is invalid
    static let invalidArgument = KernelError(rawValue: KERN_INVALID_ARGUMENT)!
    /// The function could not be performed.  A catch-all.
    static let failure = KernelError(rawValue: KERN_FAILURE)!
    /// A system resource could not be allocated to fulfill this request.  This
    /// failure may not be permanent.
    static let resourceShortage = KernelError(rawValue: KERN_RESOURCE_SHORTAGE)!
    /// The task in question does not hold receive rights for the port argument.
    static let notReceiver = KernelError(rawValue: KERN_NOT_RECEIVER)!
    /// Bogus access restriction.
    static let noAccess = KernelError(rawValue: KERN_NO_ACCESS)!
    /// During a page fault, the target address refers to a memory object that
    /// has been destroyed.  This failure is permanent.
    static let memoryFailure = KernelError(rawValue: KERN_MEMORY_FAILURE)!
    /// During a page fault, the memory object indicated that the data could not
    /// be returned.  This failure may be temporary; future attempts to access
    /// this same data may succeed, as defined by the memory object.
    static let memoryError = KernelError(rawValue: KERN_MEMORY_ERROR)!
    /// The receive right is already a member of the portset.
    static let alreadyInSet = KernelError(rawValue: KERN_ALREADY_IN_SET)!
    /// The receive right is not a member of a port set.
    static let notInSet = KernelError(rawValue: KERN_NOT_IN_SET)!
    /// The name already denotes a right in the task.
    static let nameExists = KernelError(rawValue: KERN_NAME_EXISTS)!
    /// The operation was aborted.  Ipc code will catch this and reflect it as a
    /// message error.
    static let aborted = KernelError(rawValue: KERN_ABORTED)!
    /// The name doesn't denote a right in the task.
    static let invalidName = KernelError(rawValue: KERN_INVALID_NAME)!
    /// Target task isn't an active task.
    static let invalidTask = KernelError(rawValue: KERN_INVALID_TASK)!
    /// The name denotes a right, but not an appropriate right.
    static let invalidRight = KernelError(rawValue: KERN_INVALID_RIGHT)!
    /// A blatant range error.
    static let invalidValue = KernelError(rawValue: KERN_INVALID_VALUE)!
    /// Operation would overflow limit on user-references.
    static let urefsOverflow = KernelError(rawValue: KERN_UREFS_OVERFLOW)!
    /// The supplied (port) capability is improper.
    static let invalidCapability = KernelError(rawValue: KERN_INVALID_CAPABILITY)!
    /// The task already has send or receive rights for the port under another
    /// name.
    static let rightExists = KernelError(rawValue: KERN_RIGHT_EXISTS)!
    /// Target host isn't actually a host.
    static let invalidHost = KernelError(rawValue: KERN_INVALID_HOST)!
    /// An attempt was made to supply "precious" data for memory that is already
    /// present in a memory object.
    static let memoryPresent = KernelError(rawValue: KERN_MEMORY_PRESENT)!
    /// A page was requested of a memory manager via memoryObjectDataRequest for
    /// an object using a MEMORY_OBJECT_COPY_CALL strategy, with the
    /// VM_PROT_WANTS_COPY flag being used to specify that the page desired is
    /// for a copy of the object, and the memory manager has detected the page
    /// was pushed into a copy of the object while the kernel was walking the
    /// shadow chain from the copy to the object. This error code is delivered
    /// via memoryObjectDataError and is handled by the kernel (it forces the
    /// kernel to restart the fault). It will not be seen by users.
    static let memoryDataMoved = KernelError(rawValue: KERN_MEMORY_DATA_MOVED)!
    /// A strategic copy was attempted of an object upon which a quicker copy is
    /// now possible. The caller should retry the copy using vmObjectCopyQuickly.
    /// This error code is seen only by the kernel.
    static let memoryRestartCopy = KernelError(rawValue: KERN_MEMORY_RESTART_COPY)!
    /// An argument applied to assert processor set privilege was not a
    /// processor set control port.
    static let invalidProcessorSet = KernelError(rawValue: KERN_INVALID_PROCESSOR_SET)!
    /// The specified scheduling attributes exceed the thread's limits.
    static let policyLimit = KernelError(rawValue: KERN_POLICY_LIMIT)!
    /// The specified scheduling policy is not currently enabled for the
    /// processor set.
    static let invalidPolicy = KernelError(rawValue: KERN_INVALID_POLICY)!
    /// The external memory manager failed to initialize the memory object.
    static let invalidObject = KernelError(rawValue: KERN_INVALID_OBJECT)!
    /// A thread is attempting to wait for an event for which there is already a
    /// waiting thread.
    static let alreadyWaiting = KernelError(rawValue: KERN_ALREADY_WAITING)!
    /// An attempt was made to destroy the default processor set.
    static let defaultSet = KernelError(rawValue: KERN_DEFAULT_SET)!
    /// An attempt was made to fetch an exception port that is protected, or to
    /// abort a thread while processing a protected exception.
    static let exceptionProtected = KernelError(rawValue: KERN_EXCEPTION_PROTECTED)!
    /// A ledger was required but not supplied.
    static let invalidLedger = KernelError(rawValue: KERN_INVALID_LEDGER)!
    /// The port was not a memory cache control port.
    static let invalidMemoryControl = KernelError(rawValue: KERN_INVALID_MEMORY_CONTROL)!
    /// An argument supplied to assert security privilege was not a host
    /// security port.
    static let invalidSecurity = KernelError(rawValue: KERN_INVALID_SECURITY)!
    /// threadDepressAbort was called on a thread which was not currently
    /// depressed.
    static let notDepressed = KernelError(rawValue: KERN_NOT_DEPRESSED)!
    /// Object has been terminated and is no longer available
    static let terminated = KernelError(rawValue: KERN_TERMINATED)!
    /// Lock set has been destroyed and is no longer available.
    static let lockSetDestroyed = KernelError(rawValue: KERN_LOCK_SET_DESTROYED)!
    /// The thread holding the lock terminated before releasing the lock
    static let lockUnstable = KernelError(rawValue: KERN_LOCK_UNSTABLE)!
    /// The lock is already owned by another thread
    static let lockOwned = KernelError(rawValue: KERN_LOCK_OWNED)!
    /// The lock is already owned by the calling thread
    static let lockOwnedSelf = KernelError(rawValue: KERN_LOCK_OWNED_SELF)!
    /// Semaphore has been destroyed and is no longer available.
    static let semaphoreDestroyed = KernelError(rawValue: KERN_SEMAPHORE_DESTROYED)!
    /// Return from RPC indicating the target server was terminated before it
    /// successfully replied
    static let rpcServerTerminated = KernelError(rawValue: KERN_RPC_SERVER_TERMINATED)!
    /// Terminate an orphaned activation.
    static let rpcTerminateOrphan = KernelError(rawValue: KERN_RPC_TERMINATE_ORPHAN)!
    /// Allow an orphaned activation to continue executing.
    static let rpcContinueOrphan = KernelError(rawValue: KERN_RPC_CONTINUE_ORPHAN)!
    /// Empty thread activation (No thread linked to it)
    static let notSupported = KernelError(rawValue: KERN_NOT_SUPPORTED)!
    /// Remote node down or inaccessible.
    static let nodeDown = KernelError(rawValue: KERN_NODE_DOWN)!
    /// A signalled thread was not actually waiting.
    static let notWaiting = KernelError(rawValue: KERN_NOT_WAITING)!
    /// Some thread-oriented operation (semaphoreWait) timed out
    static let operationTimedOut = KernelError(rawValue: KERN_OPERATION_TIMED_OUT)!
    /// During a page fault, indicates that the page was rejected as a result of
    /// a signature check.
    static let codesignError = KernelError(rawValue: KERN_CODESIGN_ERROR)!
    /// The requested property cannot be changed at this time.
    static let policyStatic = KernelError(rawValue: KERN_POLICY_STATIC)!
    /// The provided buffer is of insufficient size for the requested data.
    static let insufficientBufferSize = KernelError(rawValue: KERN_INSUFFICIENT_BUFFER_SIZE)!
    #if compiler(>=5.3) && false
    // TODO: KERN_DENIED
    /// Denied by security policy
    static let denied = KernelError(rawValue: KERN_DENIED)!
    #endif
}

import Foundation

extension KernelError: CustomNSError {}

extension KernelError: LocalizedError {}

#endif
