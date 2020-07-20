import CoreFoundation
import Foundation

public extension CFRunLoop {
    
    typealias Mode = CFRunLoopMode
    typealias Source = CFRunLoopSource
    typealias Observer = CFRunLoopObserver
    typealias Timer = CFRunLoopTimer
    typealias RunResult = CFRunLoopRunResult
    typealias Activity = CFRunLoopActivity
    
    @inlinable static var current: CFRunLoop {
        return CFRunLoopGetCurrent()
    }
    
    @inlinable static var main: CFRunLoop {
        return CFRunLoopGetMain()
    }
    
    @inlinable func currentMode() -> Mode {
        return CFRunLoopCopyCurrentMode(self)
    }
    
    @inlinable func allModes() -> [Mode] {
        return (CFRunLoopCopyAllModes(self) as! [CFString]).map(Mode.init(_:))
    }
    
    @inlinable func addCommonMode(_ mode: Mode) {
        CFRunLoopAddCommonMode(self, mode)
    }
    
    @inlinable func nextTimerFireDate(mode: Mode) -> CFAbsoluteTime {
        return CFRunLoopGetNextTimerFireDate(self, mode)
    }
    
    @inlinable static func run() {
        CFRunLoopRun()
    }
    
    @inlinable static func run(in mode: Mode, seconds: CFTimeInterval = 0, returnAfterSourceHandled: Bool = true) -> RunResult {
        return CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled)
    }
    
    @inlinable var isWaiting: Bool {
        return CFRunLoopIsWaiting(self)
    }
    
    @inlinable func wakeUp() {
        CFRunLoopWakeUp(self)
    }
    
    @inlinable func stop() {
        CFRunLoopStop(self)
    }
    
    @inlinable func perform(mode: Mode, block: @escaping () -> Void) {
        CFRunLoopPerformBlock(self, mode.rawValue, block)
    }
    
    @inlinable func perform(modes: [Mode], block: @escaping () -> Void) {
        CFRunLoopPerformBlock(self, modes.map { $0.rawValue } as CFArray, block)
    }
    
    @inlinable func contains(source: Source, mode: Mode) {
        CFRunLoopContainsSource(self, source, mode)
    }
    
    @inlinable func add(source: Source, mode: Mode) {
        CFRunLoopAddSource(self, source, mode)
    }
    
    @inlinable func remove(source: Source, mode: Mode) {
        CFRunLoopRemoveSource(self, source, mode)
    }
    
    @inlinable func contains(observer: Observer, mode: Mode) {
        CFRunLoopContainsObserver(self, observer, mode)
    }
    
    @inlinable func add(observer: Observer, mode: Mode) {
        CFRunLoopAddObserver(self, observer, mode)
    }
    
    @inlinable func remove(observer: Observer, mode: Mode) {
        CFRunLoopRemoveObserver(self, observer, mode)
    }
    
    @inlinable func contains(timer: Timer, mode: Mode) {
        CFRunLoopContainsTimer(self, timer, mode)
    }
    
    @inlinable func add(timer: Timer, mode: Mode) {
        CFRunLoopAddTimer(self, timer, mode)
    }
    
    @inlinable func remove(timer: Timer, mode: Mode) {
        CFRunLoopRemoveTimer(self, timer, mode)
    }
}

// MARK: - Mode

public extension CFRunLoop.Mode {
    
    
}

// MARK: - Source

public extension CFRunLoop.Source {
    
    typealias Context = CFRunLoopSourceContext
    typealias Context1 = CFRunLoopSourceContext1
    
    @inlinable static func create(allocator: CFAllocator = .default, order: CFIndex, context: Context) -> CFRunLoop.Source {
        var ctx = context
        return CFRunLoopSourceCreate(allocator, order, &ctx)
    }
    
    @inlinable var order: CFIndex {
        return CFRunLoopSourceGetOrder(self)
    }
    
    @inlinable func invalidate() {
        return CFRunLoopSourceInvalidate(self)
    }
    
    @inlinable var isValid: Bool {
        return CFRunLoopSourceIsValid(self)
    }
    
    @inlinable var context: Context {
        var ctx = Context()
        CFRunLoopSourceGetContext(self, &ctx)
        return ctx
    }
    
    @inlinable func signal() {
        return CFRunLoopSourceSignal(self)
    }
}

// MARK: - Observer

public extension CFRunLoop.Observer {
    
    typealias Context = CFRunLoopObserverContext
    typealias CallBack = CFRunLoopObserverCallBack
    
    @inlinable static func create(allocator: CFAllocator = .default, activities: CFRunLoop.Activity, repeats: Bool, order: CFIndex, callout: @escaping CallBack, context: Context) -> CFRunLoopObserver {
        var ctx = context
        return CFRunLoopObserverCreate(allocator, activities.rawValue, repeats, order, callout, &ctx)
    }
    
    @inlinable static func create(allocator: CFAllocator = .default, activities: CFRunLoop.Activity, repeats: Bool, order: CFIndex, block: @escaping (CFRunLoop.Observer?, CFRunLoop.Activity) -> Void) -> CFRunLoopObserver {
        return CFRunLoopObserverCreateWithHandler(allocator, activities.rawValue, repeats, order, block)
    }
    
    @inlinable var activity: CFRunLoop.Activity {
        let raw = CFRunLoopObserverGetActivities(self)
        return CFRunLoop.Activity(rawValue: raw)
    }
    
    @inlinable var doesRepeat: Bool {
        return CFRunLoopObserverDoesRepeat(self)
    }
    
    @inlinable var order: CFIndex {
        return CFRunLoopObserverGetOrder(self)
    }
    
    @inlinable func invalidate() {
        return CFRunLoopObserverInvalidate(self)
    }
    
    @inlinable var isValid: Bool {
        return CFRunLoopObserverIsValid(self)
    }
    
    @inlinable var context: Context {
        var ctx = Context()
        CFRunLoopObserverGetContext(self, &ctx)
        return ctx
    }
}

// MARK: - Timer

public extension CFRunLoop.Timer {
    
    typealias Context = CFRunLoopTimerContext
    typealias CallBack = CFRunLoopTimerCallBack
    
    @inlinable static func create(allocator: CFAllocator = .default, fireDate: CFAbsoluteTime, interval: CFTimeInterval, flags: CFOptionFlags, order: CFIndex, callout: @escaping CallBack, context: Context) -> CFRunLoopTimer {
        var ctx = context
        return CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, &ctx)
    }
    
    @inlinable static func create(allocator: CFAllocator = .default, fireDate: CFAbsoluteTime, interval: CFTimeInterval, flags: CFOptionFlags, order: CFIndex, block: @escaping (CFRunLoop.Timer?) -> Void) -> CFRunLoopTimer {
        return CFRunLoopTimerCreateWithHandler(allocator, fireDate, interval, flags, order, block)
    }
    
    @inlinable var nextFireDate: CFAbsoluteTime {
        get {
            return CFRunLoopTimerGetNextFireDate(self)
        }
        set {
            CFRunLoopTimerSetNextFireDate(self, newValue)
        }
    }
    
    @inlinable var interval: CFTimeInterval {
        return CFRunLoopTimerGetInterval(self)
    }
    
    @inlinable var doesRepeat: Bool {
        return CFRunLoopTimerDoesRepeat(self)
    }
    
    @inlinable var order: CFIndex {
        return CFRunLoopTimerGetOrder(self)
    }
    
    @inlinable func invalidate() {
        return CFRunLoopTimerInvalidate(self)
    }
    
    @inlinable var isValid: Bool {
        return CFRunLoopTimerIsValid(self)
    }
    
    @inlinable var context: Context {
        var ctx = Context()
        CFRunLoopTimerGetContext(self, &ctx)
        return ctx
    }
    
    @inlinable var tolerance: CFTimeInterval {
        get {
            return CFRunLoopTimerGetTolerance(self)
        }
        set {
            CFRunLoopTimerSetTolerance(self, newValue)
        }
    }
}
