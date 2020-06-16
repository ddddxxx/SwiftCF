#if canImport(IOKit)

import IOKit.hid

public struct HIDUsage: RawRepresentable {
    
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}

extension HIDUsage: Equatable, Hashable {}

extension HIDUsage: Comparable {
    
    public static func < (lhs: HIDUsage, rhs: HIDUsage) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

private func usage(_ raw: Int) -> HIDUsage {
    return HIDUsage(rawValue: UInt32(raw))
}

public extension HIDUsage {
    /// Undefined Usage for all usage pages
    static let Undefined = usage(kHIDUsage_Undefined)
}

/// GenericDesktop Page (0x01)
public extension HIDUsage {
    /// Physical Collection
    static let gd_Pointer = usage(kHIDUsage_GD_Pointer)
    /// Application Collection
    static let gd_Mouse = usage(kHIDUsage_GD_Mouse)
    /* 0x03 Reserved */
    /// Application Collection
    static let gd_Joystick = usage(kHIDUsage_GD_Joystick)
    /// Application Collection
    static let gd_GamePad = usage(kHIDUsage_GD_GamePad)
    /// Application Collection
    static let gd_Keyboard = usage(kHIDUsage_GD_Keyboard)
    /// Application Collection
    static let gd_Keypad = usage(kHIDUsage_GD_Keypad)
    /// Application Collection
    static let gd_MultiAxisController = usage(kHIDUsage_GD_MultiAxisController)
    /// Application Collection
    static let gd_TabletPCSystemControls = usage(kHIDUsage_GD_TabletPCSystemControls)
    /// Application Collection
    static let gd_AssistiveControl = usage(kHIDUsage_GD_AssistiveControl)
    /// Application Collection
    static let gd_SpatialController = usage(kHIDUsage_GD_SpatialController)
    /// Application Collection
    static let gd_AssistiveControlCompatible = usage(kHIDUsage_GD_AssistiveControlCompatible)
    
    /* 0x0B - 0x2F Reserved */
    
    /// Dynamic Value
    static let gd_X = usage(kHIDUsage_GD_X)
    /// Dynamic Value
    static let gd_Y = usage(kHIDUsage_GD_Y)
    /// Dynamic Value
    static let gd_Z = usage(kHIDUsage_GD_Z)
    /// Dynamic Value
    static let gd_Rx = usage(kHIDUsage_GD_Rx)
    /// Dynamic Value
    static let gd_Ry = usage(kHIDUsage_GD_Ry)
    /// Dynamic Value
    static let gd_Rz = usage(kHIDUsage_GD_Rz)
    /// Dynamic Value
    static let gd_Slider = usage(kHIDUsage_GD_Slider)
    /// Dynamic Value
    static let gd_Dial = usage(kHIDUsage_GD_Dial)
    /// Dynamic Value
    static let gd_Wheel = usage(kHIDUsage_GD_Wheel)
    /// Dynamic Value
    static let gd_Hatswitch = usage(kHIDUsage_GD_Hatswitch)
    /// Logical Collection
    static let gd_CountedBuffer = usage(kHIDUsage_GD_CountedBuffer)
    /// Dynamic Value
    static let gd_ByteCount = usage(kHIDUsage_GD_ByteCount)
    /// One-Shot Control
    static let gd_MotionWakeup = usage(kHIDUsage_GD_MotionWakeup)
    /// On/Off Control
    static let gd_Start = usage(kHIDUsage_GD_Start)
    /// On/Off Control
    static let gd_Select = usage(kHIDUsage_GD_Select)
    
    /* 0x3F Reserved */
    
    /// Dynamic Value
    static let gd_Vx = usage(kHIDUsage_GD_Vx)
    /// Dynamic Value
    static let gd_Vy = usage(kHIDUsage_GD_Vy)
    /// Dynamic Value
    static let gd_Vz = usage(kHIDUsage_GD_Vz)
    /// Dynamic Value
    static let gd_Vbrx = usage(kHIDUsage_GD_Vbrx)
    /// Dynamic Value
    static let gd_Vbry = usage(kHIDUsage_GD_Vbry)
    /// Dynamic Value
    static let gd_Vbrz = usage(kHIDUsage_GD_Vbrz)
    /// Dynamic Value
    static let gd_Vno = usage(kHIDUsage_GD_Vno)
    /* 0x47 - 0x7F Reserved */
    /// Application Collection
    static let gd_SystemControl = usage(kHIDUsage_GD_SystemControl)
    /// One-Shot Control
    static let gd_SystemPowerDown = usage(kHIDUsage_GD_SystemPowerDown)
    /// One-Shot Control
    static let gd_SystemSleep = usage(kHIDUsage_GD_SystemSleep)
    /// One-Shot Control
    static let gd_SystemWakeUp = usage(kHIDUsage_GD_SystemWakeUp)
    /// One-Shot Control
    static let gd_SystemContextMenu = usage(kHIDUsage_GD_SystemContextMenu)
    /// One-Shot Control
    static let gd_SystemMainMenu = usage(kHIDUsage_GD_SystemMainMenu)
    /// One-Shot Control
    static let gd_SystemAppMenu = usage(kHIDUsage_GD_SystemAppMenu)
    /// One-Shot Control
    static let gd_SystemMenuHelp = usage(kHIDUsage_GD_SystemMenuHelp)
    /// One-Shot Control
    static let gd_SystemMenuExit = usage(kHIDUsage_GD_SystemMenuExit)
    /// Selector
    static let gd_SystemMenuSelect = usage(kHIDUsage_GD_SystemMenuSelect)
    /// Selector
    static let gd_SystemMenu = usage(kHIDUsage_GD_SystemMenu)
    /// Re-Trigger Control
    static let gd_SystemMenuRight = usage(kHIDUsage_GD_SystemMenuRight)
    /// Re-Trigger Control
    static let gd_SystemMenuLeft = usage(kHIDUsage_GD_SystemMenuLeft)
    /// Re-Trigger Control
    static let gd_SystemMenuUp = usage(kHIDUsage_GD_SystemMenuUp)
    /// Re-Trigger Control
    static let gd_SystemMenuDown = usage(kHIDUsage_GD_SystemMenuDown)
    
    /* 0x8E - 0x8F Reserved */
    
    /// On/Off Control
    static let gd_DPadUp = usage(kHIDUsage_GD_DPadUp)
    /// On/Off Control
    static let gd_DPadDown = usage(kHIDUsage_GD_DPadDown)
    /// On/Off Control
    static let gd_DPadRight = usage(kHIDUsage_GD_DPadRight)
    /// On/Off Control
    static let gd_DPadLeft = usage(kHIDUsage_GD_DPadLeft)
    /// On/Off Control
    static let gd_IndexTrigger = usage(kHIDUsage_GD_IndexTrigger)
    /// On/Off Control
    static let gd_PalmTrigger = usage(kHIDUsage_GD_PalmTrigger)
    /// On/Off Control
    static let gd_Thumbstick = usage(kHIDUsage_GD_Thumbstick)
    
    /// 0x94 - 0xFFFF Reserved
    static let gd_Reserved = usage(kHIDUsage_GD_Reserved)
}

/// Simulation Page (0x02)
///
/// This section provides detailed descriptions of the usages employed by
/// simulation devices.
public extension HIDUsage {
    /// Application Collection
    static let sim_FlightSimulationDevice = usage(kHIDUsage_Sim_FlightSimulationDevice)
    /// Application Collection
    static let sim_AutomobileSimulationDevice = usage(kHIDUsage_Sim_AutomobileSimulationDevice)
    /// Application Collection
    static let sim_TankSimulationDevice = usage(kHIDUsage_Sim_TankSimulationDevice)
    /// Application Collection
    static let sim_SpaceshipSimulationDevice = usage(kHIDUsage_Sim_SpaceshipSimulationDevice)
    /// Application Collection
    static let sim_SubmarineSimulationDevice = usage(kHIDUsage_Sim_SubmarineSimulationDevice)
    /// Application Collection
    static let sim_SailingSimulationDevice = usage(kHIDUsage_Sim_SailingSimulationDevice)
    /// Application Collection
    static let sim_MotorcycleSimulationDevice = usage(kHIDUsage_Sim_MotorcycleSimulationDevice)
    /// Application Collection
    static let sim_SportsSimulationDevice = usage(kHIDUsage_Sim_SportsSimulationDevice)
    /// Application Collection
    static let sim_AirplaneSimulationDevice = usage(kHIDUsage_Sim_AirplaneSimulationDevice)
    /// Application Collection
    static let sim_HelicopterSimulationDevice = usage(kHIDUsage_Sim_HelicopterSimulationDevice)
    /// Application Collection
    static let sim_MagicCarpetSimulationDevice = usage(kHIDUsage_Sim_MagicCarpetSimulationDevice)
    /// Application Collection
    static let sim_BicycleSimulationDevice = usage(kHIDUsage_Sim_BicycleSimulationDevice)
    /* 0x0D - 0x1F Reserved */
    /// Application Collection
    static let sim_FlightControlStick = usage(kHIDUsage_Sim_FlightControlStick)
    /// Application Collection
    static let sim_FlightStick = usage(kHIDUsage_Sim_FlightStick)
    /// Physical Collection
    static let sim_CyclicControl = usage(kHIDUsage_Sim_CyclicControl)
    /// Physical Collection
    static let sim_CyclicTrim = usage(kHIDUsage_Sim_CyclicTrim)
    /// Application Collection
    static let sim_FlightYoke = usage(kHIDUsage_Sim_FlightYoke)
    /// Physical Collection
    static let sim_TrackControl = usage(kHIDUsage_Sim_TrackControl)
    
    /* 0x26 - 0xAF Reserved */
    
    /// Dynamic Value
    static let sim_Aileron = usage(kHIDUsage_Sim_Aileron)
    /// Dynamic Value
    static let sim_AileronTrim = usage(kHIDUsage_Sim_AileronTrim)
    /// Dynamic Value
    static let sim_AntiTorqueControl = usage(kHIDUsage_Sim_AntiTorqueControl)
    /// On/Off Control
    static let sim_AutopilotEnable = usage(kHIDUsage_Sim_AutopilotEnable)
    /// One-Shot Control
    static let sim_ChaffRelease = usage(kHIDUsage_Sim_ChaffRelease)
    /// Dynamic Value
    static let sim_CollectiveControl = usage(kHIDUsage_Sim_CollectiveControl)
    /// Dynamic Value
    static let sim_DiveBrake = usage(kHIDUsage_Sim_DiveBrake)
    /// On/Off Control
    static let sim_ElectronicCountermeasures = usage(kHIDUsage_Sim_ElectronicCountermeasures)
    /// Dynamic Value
    static let sim_Elevator = usage(kHIDUsage_Sim_Elevator)
    /// Dynamic Value
    static let sim_ElevatorTrim = usage(kHIDUsage_Sim_ElevatorTrim)
    /// Dynamic Value
    static let sim_Rudder = usage(kHIDUsage_Sim_Rudder)
    /// Dynamic Value
    static let sim_Throttle = usage(kHIDUsage_Sim_Throttle)
    /// On/Off Control
    static let sim_FlightCommunications = usage(kHIDUsage_Sim_FlightCommunications)
    /// One-Shot Control
    static let sim_FlareRelease = usage(kHIDUsage_Sim_FlareRelease)
    /// On/Off Control
    static let sim_LandingGear = usage(kHIDUsage_Sim_LandingGear)
    /// Dynamic Value
    static let sim_ToeBrake = usage(kHIDUsage_Sim_ToeBrake)
    /// Momentary Control
    static let sim_Trigger = usage(kHIDUsage_Sim_Trigger)
    /// On/Off Control
    static let sim_WeaponsArm = usage(kHIDUsage_Sim_WeaponsArm)
    /// Selector
    static let sim_Weapons = usage(kHIDUsage_Sim_Weapons)
    /// Dynamic Value
    static let sim_WingFlaps = usage(kHIDUsage_Sim_WingFlaps)
    /// Dynamic Value
    static let sim_Accelerator = usage(kHIDUsage_Sim_Accelerator)
    /// Dynamic Value
    static let sim_Brake = usage(kHIDUsage_Sim_Brake)
    /// Dynamic Value
    static let sim_Clutch = usage(kHIDUsage_Sim_Clutch)
    /// Dynamic Value
    static let sim_Shifter = usage(kHIDUsage_Sim_Shifter)
    /// Dynamic Value
    static let sim_Steering = usage(kHIDUsage_Sim_Steering)
    /// Dynamic Value
    static let sim_TurretDirection = usage(kHIDUsage_Sim_TurretDirection)
    /// Dynamic Value
    static let sim_BarrelElevation = usage(kHIDUsage_Sim_BarrelElevation)
    /// Dynamic Value
    static let sim_DivePlane = usage(kHIDUsage_Sim_DivePlane)
    /// Dynamic Value
    static let sim_Ballast = usage(kHIDUsage_Sim_Ballast)
    /// Dynamic Value
    static let sim_BicycleCrank = usage(kHIDUsage_Sim_BicycleCrank)
    /// Dynamic Value
    static let sim_HandleBars = usage(kHIDUsage_Sim_HandleBars)
    /// Dynamic Value
    static let sim_FrontBrake = usage(kHIDUsage_Sim_FrontBrake)
    /// Dynamic Value
    static let sim_RearBrake = usage(kHIDUsage_Sim_RearBrake)
    
    /// 0xD1 - 0xFFFF Reserved
    static let sim_Reserved = usage(kHIDUsage_Sim_Reserved)
}

/// VR Page (0x03)
///
/// Virtual Reality controls depend on designators to identify the individual
/// controls. Most of the following are usages are applied to the collections
/// of entities that comprise the actual device.
public extension HIDUsage {
    /// Application Collection
    static let vr_Belt = usage(kHIDUsage_VR_Belt)
    /// Application Collection
    static let vr_BodySuit = usage(kHIDUsage_VR_BodySuit)
    /// Physical Collection
    static let vr_Flexor = usage(kHIDUsage_VR_Flexor)
    /// Application Collection
    static let vr_Glove = usage(kHIDUsage_VR_Glove)
    /// Physical Collection
    static let vr_HeadTracker = usage(kHIDUsage_VR_HeadTracker)
    /// Application Collection
    static let vr_HeadMountedDisplay = usage(kHIDUsage_VR_HeadMountedDisplay)
    /// Application Collection
    static let vr_HandTracker = usage(kHIDUsage_VR_HandTracker)
    /// Application Collection
    static let vr_Oculometer = usage(kHIDUsage_VR_Oculometer)
    /// Application Collection
    static let vr_Vest = usage(kHIDUsage_VR_Vest)
    /// Application Collection
    static let vr_AnimatronicDevice = usage(kHIDUsage_VR_AnimatronicDevice)
    
    /* 0x0B - 0x1F Reserved */
    
    /// On/Off Control
    static let vr_StereoEnable = usage(kHIDUsage_VR_StereoEnable)
    /// On/Off Control
    static let vr_DisplayEnable = usage(kHIDUsage_VR_DisplayEnable)
    /// 0x22 - 0xFFFF Reserved
    static let vr_Reserved = usage(kHIDUsage_VR_Reserved)
}

/// Sport Page (0x04)
public extension HIDUsage {
    /// Application Collection
    static let sprt_BaseballBat = usage(kHIDUsage_Sprt_BaseballBat)
    /// Application Collection
    static let sprt_GolfClub = usage(kHIDUsage_Sprt_GolfClub)
    /// Application Collection
    static let sprt_RowingMachine = usage(kHIDUsage_Sprt_RowingMachine)
    /// Application Collection
    static let sprt_Treadmill = usage(kHIDUsage_Sprt_Treadmill)
    
    /* 0x05 - 0x2F Reserved */
    
    /// Dynamic Value
    static let sprt_Oar = usage(kHIDUsage_Sprt_Oar)
    /// Dynamic Value
    static let sprt_Slope = usage(kHIDUsage_Sprt_Slope)
    /// Dynamic Value
    static let sprt_Rate = usage(kHIDUsage_Sprt_Rate)
    /// Dynamic Value
    static let sprt_StickSpeed = usage(kHIDUsage_Sprt_StickSpeed)
    /// Dynamic Value
    static let sprt_StickFaceAngle = usage(kHIDUsage_Sprt_StickFaceAngle)
    /// Dynamic Value
    static let sprt_StickHeelOrToe = usage(kHIDUsage_Sprt_StickHeelOrToe)
    /// Dynamic Value
    static let sprt_StickFollowThrough = usage(kHIDUsage_Sprt_StickFollowThrough)
    /// Dynamic Value
    static let sprt_StickTempo = usage(kHIDUsage_Sprt_StickTempo)
    /// Named Array
    static let sprt_StickType = usage(kHIDUsage_Sprt_StickType)
    /// Dynamic Value
    static let sprt_StickHeight = usage(kHIDUsage_Sprt_StickHeight)
    
    /* 0x3A - 0x4F Reserved */
    
    /// Selector
    static let sprt_Putter = usage(kHIDUsage_Sprt_Putter)
    /// Selector
    static let sprt_1Iron = usage(kHIDUsage_Sprt_1Iron)
    /// Selector
    static let sprt_2Iron = usage(kHIDUsage_Sprt_2Iron)
    /// Selector
    static let sprt_3Iron = usage(kHIDUsage_Sprt_3Iron)
    /// Selector
    static let sprt_4Iron = usage(kHIDUsage_Sprt_4Iron)
    /// Selector
    static let sprt_5Iron = usage(kHIDUsage_Sprt_5Iron)
    /// Selector
    static let sprt_6Iron = usage(kHIDUsage_Sprt_6Iron)
    /// Selector
    static let sprt_7Iron = usage(kHIDUsage_Sprt_7Iron)
    /// Selector
    static let sprt_8Iron = usage(kHIDUsage_Sprt_8Iron)
    /// Selector
    static let sprt_9Iron = usage(kHIDUsage_Sprt_9Iron)
    /// Selector
    static let sprt_10Iron = usage(kHIDUsage_Sprt_10Iron)
    /// Selector
    static let sprt_11Iron = usage(kHIDUsage_Sprt_11Iron)
    /// Selector
    static let sprt_SandWedge = usage(kHIDUsage_Sprt_SandWedge)
    /// Selector
    static let sprt_LoftWedge = usage(kHIDUsage_Sprt_LoftWedge)
    /// Selector
    static let sprt_PowerWedge = usage(kHIDUsage_Sprt_PowerWedge)
    /// Selector
    static let sprt_1Wood = usage(kHIDUsage_Sprt_1Wood)
    /// Selector
    static let sprt_3Wood = usage(kHIDUsage_Sprt_3Wood)
    /// Selector
    static let sprt_5Wood = usage(kHIDUsage_Sprt_5Wood)
    /// Selector
    static let sprt_7Wood = usage(kHIDUsage_Sprt_7Wood)
    /// Selector
    static let sprt_9Wood = usage(kHIDUsage_Sprt_9Wood)
    
    /// 0x64 - 0xFFFF Reserved
    static let sprt_Reserved = usage(kHIDUsage_Sprt_Reserved)
}

/// Game Page (0x05)
public extension HIDUsage {
    /// Application Collection
    static let game_3DGameController = usage(kHIDUsage_Game_3DGameController)
    /// Application Collection
    static let game_PinballDevice = usage(kHIDUsage_Game_PinballDevice)
    /// Application Collection
    static let game_GunDevice = usage(kHIDUsage_Game_GunDevice)
    
    /* 0x04 - 0x1F Reserved */
    
    /// Physical Collection
    static let game_PointofView = usage(kHIDUsage_Game_PointofView)
    /// Dynamic Value
    static let game_TurnRightOrLeft = usage(kHIDUsage_Game_TurnRightOrLeft)
    /// Dynamic Value
    static let game_PitchUpOrDown = usage(kHIDUsage_Game_PitchUpOrDown)
    /// Dynamic Value
    static let game_RollRightOrLeft = usage(kHIDUsage_Game_RollRightOrLeft)
    /// Dynamic Value
    static let game_MoveRightOrLeft = usage(kHIDUsage_Game_MoveRightOrLeft)
    /// Dynamic Value
    static let game_MoveForwardOrBackward = usage(kHIDUsage_Game_MoveForwardOrBackward)
    /// Dynamic Value
    static let game_MoveUpOrDown = usage(kHIDUsage_Game_MoveUpOrDown)
    /// Dynamic Value
    static let game_LeanRightOrLeft = usage(kHIDUsage_Game_LeanRightOrLeft)
    /// Dynamic Value
    static let game_LeanForwardOrBackward = usage(kHIDUsage_Game_LeanForwardOrBackward)
    /// Dynamic Value
    static let game_HeightOfPOV = usage(kHIDUsage_Game_HeightOfPOV)
    /// Momentary Control
    static let game_Flipper = usage(kHIDUsage_Game_Flipper)
    /// Momentary Control
    static let game_SecondaryFlipper = usage(kHIDUsage_Game_SecondaryFlipper)
    /// Momentary Control
    static let game_Bump = usage(kHIDUsage_Game_Bump)
    /// One-Shot Control
    static let game_NewGame = usage(kHIDUsage_Game_NewGame)
    /// One-Shot Control
    static let game_ShootBall = usage(kHIDUsage_Game_ShootBall)
    /// One-Shot Control
    static let game_Player = usage(kHIDUsage_Game_Player)
    /// On/Off Control
    static let game_GunBolt = usage(kHIDUsage_Game_GunBolt)
    /// On/Off Control
    static let game_GunClip = usage(kHIDUsage_Game_GunClip)
    /// Selector
    static let game_Gun = usage(kHIDUsage_Game_Gun)
    /// Selector
    static let game_GunSingleShot = usage(kHIDUsage_Game_GunSingleShot)
    /// Selector
    static let game_GunBurst = usage(kHIDUsage_Game_GunBurst)
    /// Selector
    static let game_GunAutomatic = usage(kHIDUsage_Game_GunAutomatic)
    /// On/Off Control
    static let game_GunSafety = usage(kHIDUsage_Game_GunSafety)
    /// Logical Collection
    static let game_GamepadFireOrJump = usage(kHIDUsage_Game_GamepadFireOrJump)
    /// Logical Collection
    static let game_GamepadTrigger = usage(kHIDUsage_Game_GamepadTrigger)
    /// Static Flag
    static let game_GamepadFormFitting_Compatibility = usage(kHIDUsage_Game_GamepadFormFitting_Compatibility)
    /// Static Flag
    static let game_GamepadFormFitting = usage(kHIDUsage_Game_GamepadFormFitting)
    
    /// 0x3A - 0xFFFF Reserved
    static let game_Reserved = usage(kHIDUsage_Game_Reserved)
}

/// Generic Device Controls (0x0g)
public extension HIDUsage {
    /// Application Collection
    static let genDevControls_BackgroundControls = usage(kHIDUsage_GenDevControls_BackgroundControls)
}

/// KeyboardOrKeypad Page (0x07)
///
/// This section is the Usage Page for key codes to be used in implementing a
/// USB keyboard. A Boot Keyboard (84-, 101- or 104-key) should at a minimum
/// support all associated usage codes as indicated in the �oot� column below.
///
/// The usage type of all key codes is Selectors (Sel), except for the modifier
/// keys Keyboard Left Control (0x224) to Keyboard Right GUI (0x231) which are
/// Dynamic Flags (DV).
///
/// Note: A general note on Usages and languages: Due to the variation of
/// keyboards from language to language, it is not feasible to specify exact key
/// mappings for every language. Where this list is not specific for a key
/// function in a language, the closest equivalent key position should be used,
/// so that a keyboard may be modified for a different language by simply
/// printing different keycaps. One example is the Y key on a North American
/// keyboard. In Germany this is typically Z. Rather than changing the keyboard
/// firmware to put the Z Usage into that place in the descriptor list, the
/// vendor should use the Y Usage on both the North American and German
/// keyboards. This continues to be the existing practice in the industry, in
/// order to minimize the number of changes to the electronics to accommodate
/// otherlanguages.
public extension HIDUsage {
    /// ErrorRollOver
    static let keyboardErrorRollOver = usage(kHIDUsage_KeyboardErrorRollOver)
    /// POSTFail
    static let keyboardPOSTFail = usage(kHIDUsage_KeyboardPOSTFail)
    /// ErrorUndefined
    static let keyboardErrorUndefined = usage(kHIDUsage_KeyboardErrorUndefined)
    /// a or A
    static let keyboardA = usage(kHIDUsage_KeyboardA)
    /// b or B
    static let keyboardB = usage(kHIDUsage_KeyboardB)
    /// c or C
    static let keyboardC = usage(kHIDUsage_KeyboardC)
    /// d or D
    static let keyboardD = usage(kHIDUsage_KeyboardD)
    /// e or E
    static let keyboardE = usage(kHIDUsage_KeyboardE)
    /// f or F
    static let keyboardF = usage(kHIDUsage_KeyboardF)
    /// g or G
    static let keyboardG = usage(kHIDUsage_KeyboardG)
    /// h or H
    static let keyboardH = usage(kHIDUsage_KeyboardH)
    /// i or I
    static let keyboardI = usage(kHIDUsage_KeyboardI)
    /// j or J
    static let keyboardJ = usage(kHIDUsage_KeyboardJ)
    /// k or K
    static let keyboardK = usage(kHIDUsage_KeyboardK)
    /// l or L
    static let keyboardL = usage(kHIDUsage_KeyboardL)
    /// m or M
    static let keyboardM = usage(kHIDUsage_KeyboardM)
    /// n or N
    static let keyboardN = usage(kHIDUsage_KeyboardN)
    /// o or O
    static let keyboardO = usage(kHIDUsage_KeyboardO)
    /// p or P
    static let keyboardP = usage(kHIDUsage_KeyboardP)
    /// q or Q
    static let keyboardQ = usage(kHIDUsage_KeyboardQ)
    /// r or R
    static let keyboardR = usage(kHIDUsage_KeyboardR)
    /// s or S
    static let keyboardS = usage(kHIDUsage_KeyboardS)
    /// t or T
    static let keyboardT = usage(kHIDUsage_KeyboardT)
    /// u or U
    static let keyboardU = usage(kHIDUsage_KeyboardU)
    /// v or V
    static let keyboardV = usage(kHIDUsage_KeyboardV)
    /// w or W
    static let keyboardW = usage(kHIDUsage_KeyboardW)
    /// x or X
    static let keyboardX = usage(kHIDUsage_KeyboardX)
    /// y or Y
    static let keyboardY = usage(kHIDUsage_KeyboardY)
    /// z or Z
    static let keyboardZ = usage(kHIDUsage_KeyboardZ)
    /// 1 or !
    static let keyboard1 = usage(kHIDUsage_Keyboard1)
    /// 2 or @
    static let keyboard2 = usage(kHIDUsage_Keyboard2)
    /// 3 or #
    static let keyboard3 = usage(kHIDUsage_Keyboard3)
    /// 4 or $
    static let keyboard4 = usage(kHIDUsage_Keyboard4)
    /// 5 or %
    static let keyboard5 = usage(kHIDUsage_Keyboard5)
    /// 6 or ^
    static let keyboard6 = usage(kHIDUsage_Keyboard6)
    /// 7 or &
    static let keyboard7 = usage(kHIDUsage_Keyboard7)
    /// 8 or *
    static let keyboard8 = usage(kHIDUsage_Keyboard8)
    /// 9 or (
    static let keyboard9 = usage(kHIDUsage_Keyboard9)
    /// 0 or )
    static let keyboard0 = usage(kHIDUsage_Keyboard0)
    /// Return (Enter)
    static let keyboardReturnOrEnter = usage(kHIDUsage_KeyboardReturnOrEnter)
    /// Escape
    static let keyboardEscape = usage(kHIDUsage_KeyboardEscape)
    /// Delete (Backspace)
    static let keyboardDeleteOrBackspace = usage(kHIDUsage_KeyboardDeleteOrBackspace)
    /// Tab
    static let keyboardTab = usage(kHIDUsage_KeyboardTab)
    /// Spacebar
    static let keyboardSpacebar = usage(kHIDUsage_KeyboardSpacebar)
    /// - or _
    static let keyboardHyphen = usage(kHIDUsage_KeyboardHyphen)
    /// = or +
    static let keyboardEqualSign = usage(kHIDUsage_KeyboardEqualSign)
    /// [ or {
    static let keyboardOpenBracket = usage(kHIDUsage_KeyboardOpenBracket)
    /// ] or }
    static let keyboardCloseBracket = usage(kHIDUsage_KeyboardCloseBracket)
    /// \ or |
    static let keyboardBackslash = usage(kHIDUsage_KeyboardBackslash)
    /// Non-US # or _
    static let keyboardNonUSPound = usage(kHIDUsage_KeyboardNonUSPound)
    /// ; or :
    static let keyboardSemicolon = usage(kHIDUsage_KeyboardSemicolon)
    /// ' or "
    static let keyboardQuote = usage(kHIDUsage_KeyboardQuote)
    /// Grave Accent and Tilde
    static let keyboardGraveAccentAndTilde = usage(kHIDUsage_KeyboardGraveAccentAndTilde)
    /// , or <
    static let keyboardComma = usage(kHIDUsage_KeyboardComma)
    /// . or >
    static let keyboardPeriod = usage(kHIDUsage_KeyboardPeriod)
    /// / or ?
    static let keyboardSlash = usage(kHIDUsage_KeyboardSlash)
    /// Caps Lock
    static let keyboardCapsLock = usage(kHIDUsage_KeyboardCapsLock)
    /// F1
    static let keyboardF1 = usage(kHIDUsage_KeyboardF1)
    /// F2
    static let keyboardF2 = usage(kHIDUsage_KeyboardF2)
    /// F3
    static let keyboardF3 = usage(kHIDUsage_KeyboardF3)
    /// F4
    static let keyboardF4 = usage(kHIDUsage_KeyboardF4)
    /// F5
    static let keyboardF5 = usage(kHIDUsage_KeyboardF5)
    /// F6
    static let keyboardF6 = usage(kHIDUsage_KeyboardF6)
    /// F7
    static let keyboardF7 = usage(kHIDUsage_KeyboardF7)
    /// F8
    static let keyboardF8 = usage(kHIDUsage_KeyboardF8)
    /// F9
    static let keyboardF9 = usage(kHIDUsage_KeyboardF9)
    /// F10
    static let keyboardF10 = usage(kHIDUsage_KeyboardF10)
    /// F11
    static let keyboardF11 = usage(kHIDUsage_KeyboardF11)
    /// F12
    static let keyboardF12 = usage(kHIDUsage_KeyboardF12)
    /// Print Screen
    static let keyboardPrintScreen = usage(kHIDUsage_KeyboardPrintScreen)
    /// Scroll Lock
    static let keyboardScrollLock = usage(kHIDUsage_KeyboardScrollLock)
    /// Pause
    static let keyboardPause = usage(kHIDUsage_KeyboardPause)
    /// Insert
    static let keyboardInsert = usage(kHIDUsage_KeyboardInsert)
    /// Home
    static let keyboardHome = usage(kHIDUsage_KeyboardHome)
    /// Page Up
    static let keyboardPageUp = usage(kHIDUsage_KeyboardPageUp)
    /// Delete Forward
    static let keyboardDeleteForward = usage(kHIDUsage_KeyboardDeleteForward)
    /// End
    static let keyboardEnd = usage(kHIDUsage_KeyboardEnd)
    /// Page Down
    static let keyboardPageDown = usage(kHIDUsage_KeyboardPageDown)
    /// Right Arrow
    static let keyboardRightArrow = usage(kHIDUsage_KeyboardRightArrow)
    /// Left Arrow
    static let keyboardLeftArrow = usage(kHIDUsage_KeyboardLeftArrow)
    /// Down Arrow
    static let keyboardDownArrow = usage(kHIDUsage_KeyboardDownArrow)
    /// Up Arrow
    static let keyboardUpArrow = usage(kHIDUsage_KeyboardUpArrow)
    /// Keypad NumLock or Clear
    static let keypadNumLock = usage(kHIDUsage_KeypadNumLock)
    /// Keypad /
    static let keypadSlash = usage(kHIDUsage_KeypadSlash)
    /// Keypad *
    static let keypadAsterisk = usage(kHIDUsage_KeypadAsterisk)
    /// Keypad -
    static let keypadHyphen = usage(kHIDUsage_KeypadHyphen)
    /// Keypad +
    static let keypadPlus = usage(kHIDUsage_KeypadPlus)
    /// Keypad Enter
    static let keypadEnter = usage(kHIDUsage_KeypadEnter)
    /// Keypad 1 or End
    static let keypad1 = usage(kHIDUsage_Keypad1)
    /// Keypad 2 or Down Arrow
    static let keypad2 = usage(kHIDUsage_Keypad2)
    /// Keypad 3 or Page Down
    static let keypad3 = usage(kHIDUsage_Keypad3)
    /// Keypad 4 or Left Arrow
    static let keypad4 = usage(kHIDUsage_Keypad4)
    /// Keypad 5
    static let keypad5 = usage(kHIDUsage_Keypad5)
    /// Keypad 6 or Right Arrow
    static let keypad6 = usage(kHIDUsage_Keypad6)
    /// Keypad 7 or Home
    static let keypad7 = usage(kHIDUsage_Keypad7)
    /// Keypad 8 or Up Arrow
    static let keypad8 = usage(kHIDUsage_Keypad8)
    /// Keypad 9 or Page Up
    static let keypad9 = usage(kHIDUsage_Keypad9)
    /// Keypad 0 or Insert
    static let keypad0 = usage(kHIDUsage_Keypad0)
    /// Keypad . or Delete
    static let keypadPeriod = usage(kHIDUsage_KeypadPeriod)
    /// Non-US \ or |
    static let keyboardNonUSBackslash = usage(kHIDUsage_KeyboardNonUSBackslash)
    /// Application
    static let keyboardApplication = usage(kHIDUsage_KeyboardApplication)
    /// Power
    static let keyboardPower = usage(kHIDUsage_KeyboardPower)
    /// Keypad =
    static let keypadEqualSign = usage(kHIDUsage_KeypadEqualSign)
    /// F13
    static let keyboardF13 = usage(kHIDUsage_KeyboardF13)
    /// F14
    static let keyboardF14 = usage(kHIDUsage_KeyboardF14)
    /// F15
    static let keyboardF15 = usage(kHIDUsage_KeyboardF15)
    /// F16
    static let keyboardF16 = usage(kHIDUsage_KeyboardF16)
    /// F17
    static let keyboardF17 = usage(kHIDUsage_KeyboardF17)
    /// F18
    static let keyboardF18 = usage(kHIDUsage_KeyboardF18)
    /// F19
    static let keyboardF19 = usage(kHIDUsage_KeyboardF19)
    /// F20
    static let keyboardF20 = usage(kHIDUsage_KeyboardF20)
    /// F21
    static let keyboardF21 = usage(kHIDUsage_KeyboardF21)
    /// F22
    static let keyboardF22 = usage(kHIDUsage_KeyboardF22)
    /// F23
    static let keyboardF23 = usage(kHIDUsage_KeyboardF23)
    /// F24
    static let keyboardF24 = usage(kHIDUsage_KeyboardF24)
    /// Execute
    static let keyboardExecute = usage(kHIDUsage_KeyboardExecute)
    /// Help
    static let keyboardHelp = usage(kHIDUsage_KeyboardHelp)
    /// Menu
    static let keyboardMenu = usage(kHIDUsage_KeyboardMenu)
    /// Select
    static let keyboardSelect = usage(kHIDUsage_KeyboardSelect)
    /// Stop
    static let keyboardStop = usage(kHIDUsage_KeyboardStop)
    /// Again
    static let keyboardAgain = usage(kHIDUsage_KeyboardAgain)
    /// Undo
    static let keyboardUndo = usage(kHIDUsage_KeyboardUndo)
    /// Cut
    static let keyboardCut = usage(kHIDUsage_KeyboardCut)
    /// Copy
    static let keyboardCopy = usage(kHIDUsage_KeyboardCopy)
    /// Paste
    static let keyboardPaste = usage(kHIDUsage_KeyboardPaste)
    /// Find
    static let keyboardFind = usage(kHIDUsage_KeyboardFind)
    /// Mute
    static let keyboardMute = usage(kHIDUsage_KeyboardMute)
    /// Volume Up
    static let keyboardVolumeUp = usage(kHIDUsage_KeyboardVolumeUp)
    /// Volume Down
    static let keyboardVolumeDown = usage(kHIDUsage_KeyboardVolumeDown)
    /// Locking Caps Lock
    static let keyboardLockingCapsLock = usage(kHIDUsage_KeyboardLockingCapsLock)
    /// Locking Num Lock
    static let keyboardLockingNumLock = usage(kHIDUsage_KeyboardLockingNumLock)
    /// Locking Scroll Lock
    static let keyboardLockingScrollLock = usage(kHIDUsage_KeyboardLockingScrollLock)
    /// Keypad Comma
    static let keypadComma = usage(kHIDUsage_KeypadComma)
    /// Keypad Equal Sign for AS/400
    static let keypadEqualSignAS400 = usage(kHIDUsage_KeypadEqualSignAS400)
    /// International1
    static let keyboardInternational1 = usage(kHIDUsage_KeyboardInternational1)
    /// International2
    static let keyboardInternational2 = usage(kHIDUsage_KeyboardInternational2)
    /// International3
    static let keyboardInternational3 = usage(kHIDUsage_KeyboardInternational3)
    /// International4
    static let keyboardInternational4 = usage(kHIDUsage_KeyboardInternational4)
    /// International5
    static let keyboardInternational5 = usage(kHIDUsage_KeyboardInternational5)
    /// International6
    static let keyboardInternational6 = usage(kHIDUsage_KeyboardInternational6)
    /// International7
    static let keyboardInternational7 = usage(kHIDUsage_KeyboardInternational7)
    /// International8
    static let keyboardInternational8 = usage(kHIDUsage_KeyboardInternational8)
    /// International9
    static let keyboardInternational9 = usage(kHIDUsage_KeyboardInternational9)
    /// LANG1
    static let keyboardLANG1 = usage(kHIDUsage_KeyboardLANG1)
    /// LANG2
    static let keyboardLANG2 = usage(kHIDUsage_KeyboardLANG2)
    /// LANG3
    static let keyboardLANG3 = usage(kHIDUsage_KeyboardLANG3)
    /// LANG4
    static let keyboardLANG4 = usage(kHIDUsage_KeyboardLANG4)
    /// LANG5
    static let keyboardLANG5 = usage(kHIDUsage_KeyboardLANG5)
    /// LANG6
    static let keyboardLANG6 = usage(kHIDUsage_KeyboardLANG6)
    /// LANG7
    static let keyboardLANG7 = usage(kHIDUsage_KeyboardLANG7)
    /// LANG8
    static let keyboardLANG8 = usage(kHIDUsage_KeyboardLANG8)
    /// LANG9
    static let keyboardLANG9 = usage(kHIDUsage_KeyboardLANG9)
    /// AlternateErase
    static let keyboardAlternateErase = usage(kHIDUsage_KeyboardAlternateErase)
    /// SysReq/Attention
    static let keyboardSysReqOrAttention = usage(kHIDUsage_KeyboardSysReqOrAttention)
    /// Cancel
    static let keyboardCancel = usage(kHIDUsage_KeyboardCancel)
    /// Clear
    static let keyboardClear = usage(kHIDUsage_KeyboardClear)
    /// Prior
    static let keyboardPrior = usage(kHIDUsage_KeyboardPrior)
    /// Return
    static let keyboardReturn = usage(kHIDUsage_KeyboardReturn)
    /// Separator
    static let keyboardSeparator = usage(kHIDUsage_KeyboardSeparator)
    /// Out
    static let keyboardOut = usage(kHIDUsage_KeyboardOut)
    /// Oper
    static let keyboardOper = usage(kHIDUsage_KeyboardOper)
    /// Clear/Again
    static let keyboardClearOrAgain = usage(kHIDUsage_KeyboardClearOrAgain)
    /// CrSel/Props
    static let keyboardCrSelOrProps = usage(kHIDUsage_KeyboardCrSelOrProps)
    /// ExSel
    static let keyboardExSel = usage(kHIDUsage_KeyboardExSel)
    
    /* 0xA5-0xDF Reserved */
    
    /// Left Control
    static let keyboardLeftControl = usage(kHIDUsage_KeyboardLeftControl)
    /// Left Shift
    static let keyboardLeftShift = usage(kHIDUsage_KeyboardLeftShift)
    /// Left Alt
    static let keyboardLeftAlt = usage(kHIDUsage_KeyboardLeftAlt)
    /// Left GUI
    static let keyboardLeftGUI = usage(kHIDUsage_KeyboardLeftGUI)
    /// Right Control
    static let keyboardRightControl = usage(kHIDUsage_KeyboardRightControl)
    /// Right Shift
    static let keyboardRightShift = usage(kHIDUsage_KeyboardRightShift)
    /// Right Alt
    static let keyboardRightAlt = usage(kHIDUsage_KeyboardRightAlt)
    /// Right GUI
    static let keyboardRightGUI = usage(kHIDUsage_KeyboardRightGUI)
    
    /// 0xE8-0xFFFF Reserved
    static let keyboard_Reserved = usage(kHIDUsage_Keyboard_Reserved)
}

/// LEDs Page (0x08)
///
/// An LED or indicator is implemented as an On/Off Control (OOF) using the
/// �ingle button toggle�mode, where a value of 1 will turn on the indicator,
/// and a value of 0 will turn it off. The exceptions are described below.
public extension HIDUsage {
    /// On/Off Control
    static let led_NumLock = usage(kHIDUsage_LED_NumLock)
    /// On/Off Control
    static let led_CapsLock = usage(kHIDUsage_LED_CapsLock)
    /// On/Off Control
    static let led_ScrollLock = usage(kHIDUsage_LED_ScrollLock)
    /// On/Off Control
    static let led_Compose = usage(kHIDUsage_LED_Compose)
    /// On/Off Control
    static let led_Kana = usage(kHIDUsage_LED_Kana)
    /// On/Off Control
    static let led_Power = usage(kHIDUsage_LED_Power)
    /// On/Off Control
    static let led_Shift = usage(kHIDUsage_LED_Shift)
    /// On/Off Control
    static let led_DoNotDisturb = usage(kHIDUsage_LED_DoNotDisturb)
    /// On/Off Control
    static let led_Mute = usage(kHIDUsage_LED_Mute)
    /// On/Off Control
    static let led_ToneEnable = usage(kHIDUsage_LED_ToneEnable)
    /// On/Off Control
    static let led_HighCutFilter = usage(kHIDUsage_LED_HighCutFilter)
    /// On/Off Control
    static let led_LowCutFilter = usage(kHIDUsage_LED_LowCutFilter)
    /// On/Off Control
    static let led_EqualizerEnable = usage(kHIDUsage_LED_EqualizerEnable)
    /// On/Off Control
    static let led_SoundFieldOn = usage(kHIDUsage_LED_SoundFieldOn)
    /// On/Off Control
    static let led_SurroundOn = usage(kHIDUsage_LED_SurroundOn)
    /// On/Off Control
    static let led_Repeat = usage(kHIDUsage_LED_Repeat)
    /// On/Off Control
    static let led_Stereo = usage(kHIDUsage_LED_Stereo)
    /// On/Off Control
    static let led_SamplingRateDetect = usage(kHIDUsage_LED_SamplingRateDetect)
    /// On/Off Control
    static let led_Spinning = usage(kHIDUsage_LED_Spinning)
    /// On/Off Control
    static let led_CAV = usage(kHIDUsage_LED_CAV)
    /// On/Off Control
    static let led_CLV = usage(kHIDUsage_LED_CLV)
    /// On/Off Control
    static let led_RecordingFormatDetect = usage(kHIDUsage_LED_RecordingFormatDetect)
    /// On/Off Control
    static let led_OffHook = usage(kHIDUsage_LED_OffHook)
    /// On/Off Control
    static let led_Ring = usage(kHIDUsage_LED_Ring)
    /// On/Off Control
    static let led_MessageWaiting = usage(kHIDUsage_LED_MessageWaiting)
    /// On/Off Control
    static let led_DataMode = usage(kHIDUsage_LED_DataMode)
    /// On/Off Control
    static let led_BatteryOperation = usage(kHIDUsage_LED_BatteryOperation)
    /// On/Off Control
    static let led_BatteryOK = usage(kHIDUsage_LED_BatteryOK)
    /// On/Off Control
    static let led_BatteryLow = usage(kHIDUsage_LED_BatteryLow)
    /// On/Off Control
    static let led_Speaker = usage(kHIDUsage_LED_Speaker)
    /// On/Off Control
    static let led_HeadSet = usage(kHIDUsage_LED_HeadSet)
    /// On/Off Control
    static let led_Hold = usage(kHIDUsage_LED_Hold)
    /// On/Off Control
    static let led_Microphone = usage(kHIDUsage_LED_Microphone)
    /// On/Off Control
    static let led_Coverage = usage(kHIDUsage_LED_Coverage)
    /// On/Off Control
    static let led_NightMode = usage(kHIDUsage_LED_NightMode)
    /// On/Off Control
    static let led_SendCalls = usage(kHIDUsage_LED_SendCalls)
    /// On/Off Control
    static let led_CallPickup = usage(kHIDUsage_LED_CallPickup)
    /// On/Off Control
    static let led_Conference = usage(kHIDUsage_LED_Conference)
    /// On/Off Control
    static let led_StandBy = usage(kHIDUsage_LED_StandBy)
    /// On/Off Control
    static let led_CameraOn = usage(kHIDUsage_LED_CameraOn)
    /// On/Off Control
    static let led_CameraOff = usage(kHIDUsage_LED_CameraOff)
    /// On/Off Control
    static let led_OnLine = usage(kHIDUsage_LED_OnLine)
    /// On/Off Control
    static let led_OffLine = usage(kHIDUsage_LED_OffLine)
    /// On/Off Control
    static let led_Busy = usage(kHIDUsage_LED_Busy)
    /// On/Off Control
    static let led_Ready = usage(kHIDUsage_LED_Ready)
    /// On/Off Control
    static let led_PaperOut = usage(kHIDUsage_LED_PaperOut)
    /// On/Off Control
    static let led_PaperJam = usage(kHIDUsage_LED_PaperJam)
    /// On/Off Control
    static let led_Remote = usage(kHIDUsage_LED_Remote)
    /// On/Off Control
    static let led_Forward = usage(kHIDUsage_LED_Forward)
    /// On/Off Control
    static let led_Reverse = usage(kHIDUsage_LED_Reverse)
    /// On/Off Control
    static let led_Stop = usage(kHIDUsage_LED_Stop)
    /// On/Off Control
    static let led_Rewind = usage(kHIDUsage_LED_Rewind)
    /// On/Off Control
    static let led_FastForward = usage(kHIDUsage_LED_FastForward)
    /// On/Off Control
    static let led_Play = usage(kHIDUsage_LED_Play)
    /// On/Off Control
    static let led_Pause = usage(kHIDUsage_LED_Pause)
    /// On/Off Control
    static let led_Record = usage(kHIDUsage_LED_Record)
    /// On/Off Control
    static let led_Error = usage(kHIDUsage_LED_Error)
    /// Selector
    static let led_Usage = usage(kHIDUsage_LED_Usage)
    /// Usage Switch
    static let led_UsageInUseIndicator = usage(kHIDUsage_LED_UsageInUseIndicator)
    /// Usage Modifier
    static let led_UsageMultiModeIndicator = usage(kHIDUsage_LED_UsageMultiModeIndicator)
    /// Selector
    static let led_IndicatorOn = usage(kHIDUsage_LED_IndicatorOn)
    /// Selector
    static let led_IndicatorFlash = usage(kHIDUsage_LED_IndicatorFlash)
    /// Selector
    static let led_IndicatorSlowBlink = usage(kHIDUsage_LED_IndicatorSlowBlink)
    /// Selector
    static let led_IndicatorFastBlink = usage(kHIDUsage_LED_IndicatorFastBlink)
    /// Selector
    static let led_IndicatorOff = usage(kHIDUsage_LED_IndicatorOff)
    /// Dynamic Value
    static let led_FlashOnTime = usage(kHIDUsage_LED_FlashOnTime)
    /// Dynamic Value
    static let led_SlowBlinkOnTime = usage(kHIDUsage_LED_SlowBlinkOnTime)
    /// Dynamic Value
    static let led_SlowBlinkOffTime = usage(kHIDUsage_LED_SlowBlinkOffTime)
    /// Dynamic Value
    static let led_FastBlinkOnTime = usage(kHIDUsage_LED_FastBlinkOnTime)
    /// Dynamic Value
    static let led_FastBlinkOffTime = usage(kHIDUsage_LED_FastBlinkOffTime)
    /// Usage Modifier
    static let led_UsageIndicatorColor = usage(kHIDUsage_LED_UsageIndicatorColor)
    /// Selector
    static let led_IndicatorRed = usage(kHIDUsage_LED_IndicatorRed)
    /// Selector
    static let led_IndicatorGreen = usage(kHIDUsage_LED_IndicatorGreen)
    /// Selector
    static let led_IndicatorAmber = usage(kHIDUsage_LED_IndicatorAmber)
    /// On/Off Control
    static let led_GenericIndicator = usage(kHIDUsage_LED_GenericIndicator)
    /// On/Off Control
    static let led_SystemSuspend = usage(kHIDUsage_LED_SystemSuspend)
    /// On/Off Control
    static let led_ExternalPowerConnected = usage(kHIDUsage_LED_ExternalPowerConnected)
    /// Collection Logical
    static let led_PlayerIndicator = usage(kHIDUsage_LED_PlayerIndicator)
    /// Selector
    static let led_Player1 = usage(kHIDUsage_LED_Player1)
    /// Selector
    static let led_Player2 = usage(kHIDUsage_LED_Player2)
    /// Selector
    static let led_Player3 = usage(kHIDUsage_LED_Player3)
    /// Selector
    static let led_Player4 = usage(kHIDUsage_LED_Player4)
    /// Selector
    static let led_Player5 = usage(kHIDUsage_LED_Player5)
    /// Selector
    static let led_Player6 = usage(kHIDUsage_LED_Player6)
    /// Selector
    static let led_Player7 = usage(kHIDUsage_LED_Player7)
    /// Selector
    static let led_Player8 = usage(kHIDUsage_LED_Player8)
    
    /// 0x4E - 0xFFFF Reserved
    static let led_Reserved = usage(kHIDUsage_LED_Reserved)
}

/// Button Page (0x09)
///
/// The Button page is the first place an application should look for user
/// selection controls. System graphical user interfaces typically employ a
/// pointer and a set of hierarchical selectors to select, move and otherwise
/// manipulate their environment. For these purposes the following assignment of
/// significance can be applied to the Button usages:
///
/// � Button 1, Primary Button. Used for object selecting, dragging, and double
/// click activation. On MacOS, this is the only button. Microsoft operating
/// systems call this a logical left button, because it is not necessarily
/// physically located on the left of the pointing device.
///
/// � Button 2, Secondary Button. Used by newer graphical user interfaces to
/// browse object properties. Exposed by systems to applications that typically
/// assign application-specific functionality.
///
/// � Button 3, Tertiary Button. Optional control. Exposed to applications, but
/// seldom assigned functionality due to prevalence of two- and one-button
/// devices.
///
/// � Buttons 4 -55. As the button number increases, its significance as a
/// selector decreases.
///
/// In many ways the assignment of button numbers is similar to the assignment
/// of Effort in Physical descriptors. Button 1 would be used to define the
/// button a finger rests on when the hand is in the �t rest�position, that is,
/// virtually no effort is required by the user to activate the button. Button
/// values increment as the finger has to stretch to reach a control. See
/// Section 6.2.3, �hysical Descriptors,�in the HID Specification for methods of
/// further qualifying buttons.
public extension HIDUsage {
    /// (primary/trigger)
    static let button_1 = usage(kHIDUsage_Button_1)
    /// (secondary)
    static let button_2 = usage(kHIDUsage_Button_2)
    /// (tertiary)
    static let button_3 = usage(kHIDUsage_Button_3)
    /// 4th button
    static let button_4 = usage(kHIDUsage_Button_4)
    /// (5th button)
    static let button_5 = usage(kHIDUsage_Button_5)
    /// (6th button)
    static let button_6 = usage(kHIDUsage_Button_6)
    /// (7th button)
    static let button_7 = usage(kHIDUsage_Button_7)
    /// (8th button)
    static let button_8 = usage(kHIDUsage_Button_8)
    /// (9th button)
    static let button_9 = usage(kHIDUsage_Button_9)
    /// (10th button)
    static let button_10 = usage(kHIDUsage_Button_10)
    /// (11th button)
    static let button_11 = usage(kHIDUsage_Button_11)
    /// (12th button)
    static let button_12 = usage(kHIDUsage_Button_12)
    /// (13th button)
    static let button_13 = usage(kHIDUsage_Button_13)
    /// (14th button)
    static let button_14 = usage(kHIDUsage_Button_14)
    /// (15th button)
    static let button_15 = usage(kHIDUsage_Button_15)
    /// (16th button)
    static let button_16 = usage(kHIDUsage_Button_16)
    /// (17th button)
    static let button_17 = usage(kHIDUsage_Button_17)
    /// (18th button)
    static let button_18 = usage(kHIDUsage_Button_18)
    /// (19th button)
    static let button_19 = usage(kHIDUsage_Button_19)
    /// (20th button)
    static let button_20 = usage(kHIDUsage_Button_20)
    /// (21st button)
    static let button_21 = usage(kHIDUsage_Button_21)
    /// (22nd button)
    static let button_22 = usage(kHIDUsage_Button_22)
    /// (23rd button)
    static let button_23 = usage(kHIDUsage_Button_23)
    /// (24th button)
    static let button_24 = usage(kHIDUsage_Button_24)
    /// (25th button)
    static let button_25 = usage(kHIDUsage_Button_25)
    /// (26th button)
    static let button_26 = usage(kHIDUsage_Button_26)
    /// (27th button)
    static let button_27 = usage(kHIDUsage_Button_27)
    /// (28th button)
    static let button_28 = usage(kHIDUsage_Button_28)
    /// (29th button)
    static let button_29 = usage(kHIDUsage_Button_29)
    /// (30th button)
    static let button_30 = usage(kHIDUsage_Button_30)
    /// (31st button)
    static let button_31 = usage(kHIDUsage_Button_31)
    /// (32nd button)
    static let button_32 = usage(kHIDUsage_Button_32)
    /// (33rd button)
    static let button_33 = usage(kHIDUsage_Button_33)
    /// (34th button)
    static let button_34 = usage(kHIDUsage_Button_34)
    /// (35th button)
    static let button_35 = usage(kHIDUsage_Button_35)
    /// (36th button)
    static let button_36 = usage(kHIDUsage_Button_36)
    /// (37th button)
    static let button_37 = usage(kHIDUsage_Button_37)
    /// (38th button)
    static let button_38 = usage(kHIDUsage_Button_38)
    /// (39th button)
    static let button_39 = usage(kHIDUsage_Button_39)
    /// (40th button)
    static let button_40 = usage(kHIDUsage_Button_40)
    /// (41st button)
    static let button_41 = usage(kHIDUsage_Button_41)
    /// (42nd button)
    static let button_42 = usage(kHIDUsage_Button_42)
    /// (43rd button)
    static let button_43 = usage(kHIDUsage_Button_43)
    /// (44th button)
    static let button_44 = usage(kHIDUsage_Button_44)
    /// (45th button)
    static let button_45 = usage(kHIDUsage_Button_45)
    /// (46th button)
    static let button_46 = usage(kHIDUsage_Button_46)
    /// (47th button)
    static let button_47 = usage(kHIDUsage_Button_47)
    /// (48th button)
    static let button_48 = usage(kHIDUsage_Button_48)
    /// (49th button)
    static let button_49 = usage(kHIDUsage_Button_49)
    /// (50th button)
    static let button_50 = usage(kHIDUsage_Button_50)
    /// (51st button)
    static let button_51 = usage(kHIDUsage_Button_51)
    /// (52nd button)
    static let button_52 = usage(kHIDUsage_Button_52)
    /// (53rd button)
    static let button_53 = usage(kHIDUsage_Button_53)
    /// (54th button)
    static let button_54 = usage(kHIDUsage_Button_54)
    /// (55th button)
    static let button_55 = usage(kHIDUsage_Button_55)
    /// (56th button)
    static let button_56 = usage(kHIDUsage_Button_56)
    /// (57th button)
    static let button_57 = usage(kHIDUsage_Button_57)
    /// (58th button)
    static let button_58 = usage(kHIDUsage_Button_58)
    /// (59th button)
    static let button_59 = usage(kHIDUsage_Button_59)
    /// (60th button)
    static let button_60 = usage(kHIDUsage_Button_60)
    /// (61st button)
    static let button_61 = usage(kHIDUsage_Button_61)
    /// (62nd button)
    static let button_62 = usage(kHIDUsage_Button_62)
    /// (63rd button)
    static let button_63 = usage(kHIDUsage_Button_63)
    /// (64th button)
    static let button_64 = usage(kHIDUsage_Button_64)
    /// (65th button)
    static let button_65 = usage(kHIDUsage_Button_65)
    /// (66th button)
    static let button_66 = usage(kHIDUsage_Button_66)
    /// (67th button)
    static let button_67 = usage(kHIDUsage_Button_67)
    /// (68th button)
    static let button_68 = usage(kHIDUsage_Button_68)
    /// (69th button)
    static let button_69 = usage(kHIDUsage_Button_69)
    /// (70th button)
    static let button_70 = usage(kHIDUsage_Button_70)
    /// (71st button)
    static let button_71 = usage(kHIDUsage_Button_71)
    /// (72nd button)
    static let button_72 = usage(kHIDUsage_Button_72)
    /// (73rd button)
    static let button_73 = usage(kHIDUsage_Button_73)
    /// (74th button)
    static let button_74 = usage(kHIDUsage_Button_74)
    /// (75th button)
    static let button_75 = usage(kHIDUsage_Button_75)
    /// (76th button)
    static let button_76 = usage(kHIDUsage_Button_76)
    /// (77th button)
    static let button_77 = usage(kHIDUsage_Button_77)
    /// (78th button)
    static let button_78 = usage(kHIDUsage_Button_78)
    /// (79th button)
    static let button_79 = usage(kHIDUsage_Button_79)
    /// (80th button)
    static let button_80 = usage(kHIDUsage_Button_80)
    /// (81st button)
    static let button_81 = usage(kHIDUsage_Button_81)
    /// (82nd button)
    static let button_82 = usage(kHIDUsage_Button_82)
    /// (83rd button)
    static let button_83 = usage(kHIDUsage_Button_83)
    /// (84th button)
    static let button_84 = usage(kHIDUsage_Button_84)
    /// (85th button)
    static let button_85 = usage(kHIDUsage_Button_85)
    /// (86th button)
    static let button_86 = usage(kHIDUsage_Button_86)
    /// (87th button)
    static let button_87 = usage(kHIDUsage_Button_87)
    /// (88th button)
    static let button_88 = usage(kHIDUsage_Button_88)
    /// (89th button)
    static let button_89 = usage(kHIDUsage_Button_89)
    /// (90th button)
    static let button_90 = usage(kHIDUsage_Button_90)
    /// (91st button)
    static let button_91 = usage(kHIDUsage_Button_91)
    /// (92nd button)
    static let button_92 = usage(kHIDUsage_Button_92)
    /// (93rd button)
    static let button_93 = usage(kHIDUsage_Button_93)
    /// (94th button)
    static let button_94 = usage(kHIDUsage_Button_94)
    /// (95th button)
    static let button_95 = usage(kHIDUsage_Button_95)
    /// (96th button)
    static let button_96 = usage(kHIDUsage_Button_96)
    /// (97th button)
    static let button_97 = usage(kHIDUsage_Button_97)
    /// (98th button)
    static let button_98 = usage(kHIDUsage_Button_98)
    /// (99th button)
    static let button_99 = usage(kHIDUsage_Button_99)
    /// (100th button)
    static let button_100 = usage(kHIDUsage_Button_100)
    /// (101st button)
    static let button_101 = usage(kHIDUsage_Button_101)
    /// (102nd button)
    static let button_102 = usage(kHIDUsage_Button_102)
    /// (103rd button)
    static let button_103 = usage(kHIDUsage_Button_103)
    /// (104th button)
    static let button_104 = usage(kHIDUsage_Button_104)
    /// (105th button)
    static let button_105 = usage(kHIDUsage_Button_105)
    /// (106th button)
    static let button_106 = usage(kHIDUsage_Button_106)
    /// (107th button)
    static let button_107 = usage(kHIDUsage_Button_107)
    /// (108th button)
    static let button_108 = usage(kHIDUsage_Button_108)
    /// (109th button)
    static let button_109 = usage(kHIDUsage_Button_109)
    /// (110th button)
    static let button_110 = usage(kHIDUsage_Button_110)
    /// (111th button)
    static let button_111 = usage(kHIDUsage_Button_111)
    /// (112th button)
    static let button_112 = usage(kHIDUsage_Button_112)
    /// (113th button)
    static let button_113 = usage(kHIDUsage_Button_113)
    /// (114th button)
    static let button_114 = usage(kHIDUsage_Button_114)
    /// (115th button)
    static let button_115 = usage(kHIDUsage_Button_115)
    /// (116th button)
    static let button_116 = usage(kHIDUsage_Button_116)
    /// (117th button)
    static let button_117 = usage(kHIDUsage_Button_117)
    /// (118th button)
    static let button_118 = usage(kHIDUsage_Button_118)
    /// (119th button)
    static let button_119 = usage(kHIDUsage_Button_119)
    /// (120th button)
    static let button_120 = usage(kHIDUsage_Button_120)
    /// (121st button)
    static let button_121 = usage(kHIDUsage_Button_121)
    /// (122nd button)
    static let button_122 = usage(kHIDUsage_Button_122)
    /// (123rd button)
    static let button_123 = usage(kHIDUsage_Button_123)
    /// (124th button)
    static let button_124 = usage(kHIDUsage_Button_124)
    /// (125th button)
    static let button_125 = usage(kHIDUsage_Button_125)
    /// (126th button)
    static let button_126 = usage(kHIDUsage_Button_126)
    /// (127th button)
    static let button_127 = usage(kHIDUsage_Button_127)
    /// (128th button)
    static let button_128 = usage(kHIDUsage_Button_128)
    /// (129th button)
    static let button_129 = usage(kHIDUsage_Button_129)
    /// (130th button)
    static let button_130 = usage(kHIDUsage_Button_130)
    /// (131st button)
    static let button_131 = usage(kHIDUsage_Button_131)
    /// (132nd button)
    static let button_132 = usage(kHIDUsage_Button_132)
    /// (133rd button)
    static let button_133 = usage(kHIDUsage_Button_133)
    /// (134th button)
    static let button_134 = usage(kHIDUsage_Button_134)
    /// (135th button)
    static let button_135 = usage(kHIDUsage_Button_135)
    /// (136th button)
    static let button_136 = usage(kHIDUsage_Button_136)
    /// (137th button)
    static let button_137 = usage(kHIDUsage_Button_137)
    /// (138th button)
    static let button_138 = usage(kHIDUsage_Button_138)
    /// (139th button)
    static let button_139 = usage(kHIDUsage_Button_139)
    /// (140th button)
    static let button_140 = usage(kHIDUsage_Button_140)
    /// (141st button)
    static let button_141 = usage(kHIDUsage_Button_141)
    /// (142nd button)
    static let button_142 = usage(kHIDUsage_Button_142)
    /// (143rd button)
    static let button_143 = usage(kHIDUsage_Button_143)
    /// (144th button)
    static let button_144 = usage(kHIDUsage_Button_144)
    /// (145th button)
    static let button_145 = usage(kHIDUsage_Button_145)
    /// (146th button)
    static let button_146 = usage(kHIDUsage_Button_146)
    /// (147th button)
    static let button_147 = usage(kHIDUsage_Button_147)
    /// (148th button)
    static let button_148 = usage(kHIDUsage_Button_148)
    /// (149th button)
    static let button_149 = usage(kHIDUsage_Button_149)
    /// (150th button)
    static let button_150 = usage(kHIDUsage_Button_150)
    /// (151st button)
    static let button_151 = usage(kHIDUsage_Button_151)
    /// (152nd button)
    static let button_152 = usage(kHIDUsage_Button_152)
    /// (153rd button)
    static let button_153 = usage(kHIDUsage_Button_153)
    /// (154th button)
    static let button_154 = usage(kHIDUsage_Button_154)
    /// (155th button)
    static let button_155 = usage(kHIDUsage_Button_155)
    /// (156th button)
    static let button_156 = usage(kHIDUsage_Button_156)
    /// (157th button)
    static let button_157 = usage(kHIDUsage_Button_157)
    /// (158th button)
    static let button_158 = usage(kHIDUsage_Button_158)
    /// (159th button)
    static let button_159 = usage(kHIDUsage_Button_159)
    /// (160th button)
    static let button_160 = usage(kHIDUsage_Button_160)
    /// (161st button)
    static let button_161 = usage(kHIDUsage_Button_161)
    /// (162nd button)
    static let button_162 = usage(kHIDUsage_Button_162)
    /// (163rd button)
    static let button_163 = usage(kHIDUsage_Button_163)
    /// (164th button)
    static let button_164 = usage(kHIDUsage_Button_164)
    /// (165th button)
    static let button_165 = usage(kHIDUsage_Button_165)
    /// (166th button)
    static let button_166 = usage(kHIDUsage_Button_166)
    /// (167th button)
    static let button_167 = usage(kHIDUsage_Button_167)
    /// (168th button)
    static let button_168 = usage(kHIDUsage_Button_168)
    /// (169th button)
    static let button_169 = usage(kHIDUsage_Button_169)
    /// (170th button)
    static let button_170 = usage(kHIDUsage_Button_170)
    /// (171st button)
    static let button_171 = usage(kHIDUsage_Button_171)
    /// (172nd button)
    static let button_172 = usage(kHIDUsage_Button_172)
    /// (173rd button)
    static let button_173 = usage(kHIDUsage_Button_173)
    /// (174th button)
    static let button_174 = usage(kHIDUsage_Button_174)
    /// (175th button)
    static let button_175 = usage(kHIDUsage_Button_175)
    /// (176th button)
    static let button_176 = usage(kHIDUsage_Button_176)
    /// (177th button)
    static let button_177 = usage(kHIDUsage_Button_177)
    /// (178th button)
    static let button_178 = usage(kHIDUsage_Button_178)
    /// (179th button)
    static let button_179 = usage(kHIDUsage_Button_179)
    /// (180th button)
    static let button_180 = usage(kHIDUsage_Button_180)
    /// (181st button)
    static let button_181 = usage(kHIDUsage_Button_181)
    /// (182nd button)
    static let button_182 = usage(kHIDUsage_Button_182)
    /// (183rd button)
    static let button_183 = usage(kHIDUsage_Button_183)
    /// (184th button)
    static let button_184 = usage(kHIDUsage_Button_184)
    /// (185th button)
    static let button_185 = usage(kHIDUsage_Button_185)
    /// (186th button)
    static let button_186 = usage(kHIDUsage_Button_186)
    /// (187th button)
    static let button_187 = usage(kHIDUsage_Button_187)
    /// (188th button)
    static let button_188 = usage(kHIDUsage_Button_188)
    /// (189th button)
    static let button_189 = usage(kHIDUsage_Button_189)
    /// (190th button)
    static let button_190 = usage(kHIDUsage_Button_190)
    /// (191st button)
    static let button_191 = usage(kHIDUsage_Button_191)
    /// (192nd button)
    static let button_192 = usage(kHIDUsage_Button_192)
    /// (193rd button)
    static let button_193 = usage(kHIDUsage_Button_193)
    /// (194th button)
    static let button_194 = usage(kHIDUsage_Button_194)
    /// (195th button)
    static let button_195 = usage(kHIDUsage_Button_195)
    /// (196th button)
    static let button_196 = usage(kHIDUsage_Button_196)
    /// (197th button)
    static let button_197 = usage(kHIDUsage_Button_197)
    /// (198th button)
    static let button_198 = usage(kHIDUsage_Button_198)
    /// (199th button)
    static let button_199 = usage(kHIDUsage_Button_199)
    /// (200th button)
    static let button_200 = usage(kHIDUsage_Button_200)
    /// (201st button)
    static let button_201 = usage(kHIDUsage_Button_201)
    /// (202nd button)
    static let button_202 = usage(kHIDUsage_Button_202)
    /// (203rd button)
    static let button_203 = usage(kHIDUsage_Button_203)
    /// (204th button)
    static let button_204 = usage(kHIDUsage_Button_204)
    /// (205th button)
    static let button_205 = usage(kHIDUsage_Button_205)
    /// (206th button)
    static let button_206 = usage(kHIDUsage_Button_206)
    /// (207th button)
    static let button_207 = usage(kHIDUsage_Button_207)
    /// (208th button)
    static let button_208 = usage(kHIDUsage_Button_208)
    /// (209th button)
    static let button_209 = usage(kHIDUsage_Button_209)
    /// (210th button)
    static let button_210 = usage(kHIDUsage_Button_210)
    /// (211th button)
    static let button_211 = usage(kHIDUsage_Button_211)
    /// (212th button)
    static let button_212 = usage(kHIDUsage_Button_212)
    /// (213th button)
    static let button_213 = usage(kHIDUsage_Button_213)
    /// (214th button)
    static let button_214 = usage(kHIDUsage_Button_214)
    /// (215th button)
    static let button_215 = usage(kHIDUsage_Button_215)
    /// (216th button)
    static let button_216 = usage(kHIDUsage_Button_216)
    /// (217th button)
    static let button_217 = usage(kHIDUsage_Button_217)
    /// (218th button)
    static let button_218 = usage(kHIDUsage_Button_218)
    /// (219th button)
    static let button_219 = usage(kHIDUsage_Button_219)
    /// (220th button)
    static let button_220 = usage(kHIDUsage_Button_220)
    /// (221st button)
    static let button_221 = usage(kHIDUsage_Button_221)
    /// (222nd button)
    static let button_222 = usage(kHIDUsage_Button_222)
    /// (223rd button)
    static let button_223 = usage(kHIDUsage_Button_223)
    /// (224th button)
    static let button_224 = usage(kHIDUsage_Button_224)
    /// (225th button)
    static let button_225 = usage(kHIDUsage_Button_225)
    /// (226th button)
    static let button_226 = usage(kHIDUsage_Button_226)
    /// (227th button)
    static let button_227 = usage(kHIDUsage_Button_227)
    /// (228th button)
    static let button_228 = usage(kHIDUsage_Button_228)
    /// (229th button)
    static let button_229 = usage(kHIDUsage_Button_229)
    /// (230th button)
    static let button_230 = usage(kHIDUsage_Button_230)
    /// (231st button)
    static let button_231 = usage(kHIDUsage_Button_231)
    /// (232nd button)
    static let button_232 = usage(kHIDUsage_Button_232)
    /// (233rd button)
    static let button_233 = usage(kHIDUsage_Button_233)
    /// (234th button)
    static let button_234 = usage(kHIDUsage_Button_234)
    /// (235th button)
    static let button_235 = usage(kHIDUsage_Button_235)
    /// (236th button)
    static let button_236 = usage(kHIDUsage_Button_236)
    /// (237th button)
    static let button_237 = usage(kHIDUsage_Button_237)
    /// (238th button)
    static let button_238 = usage(kHIDUsage_Button_238)
    /// (239th button)
    static let button_239 = usage(kHIDUsage_Button_239)
    /// (240th button)
    static let button_240 = usage(kHIDUsage_Button_240)
    /// (241st button)
    static let button_241 = usage(kHIDUsage_Button_241)
    /// (242nd button)
    static let button_242 = usage(kHIDUsage_Button_242)
    /// (243rd button)
    static let button_243 = usage(kHIDUsage_Button_243)
    /// (244th button)
    static let button_244 = usage(kHIDUsage_Button_244)
    /// (245th button)
    static let button_245 = usage(kHIDUsage_Button_245)
    /// (246th button)
    static let button_246 = usage(kHIDUsage_Button_246)
    /// (247th button)
    static let button_247 = usage(kHIDUsage_Button_247)
    /// (248th button)
    static let button_248 = usage(kHIDUsage_Button_248)
    /// (249th button)
    static let button_249 = usage(kHIDUsage_Button_249)
    /// (250th button)
    static let button_250 = usage(kHIDUsage_Button_250)
    /// (251st button)
    static let button_251 = usage(kHIDUsage_Button_251)
    /// (252nd button)
    static let button_252 = usage(kHIDUsage_Button_252)
    /// (253rd button)
    static let button_253 = usage(kHIDUsage_Button_253)
    /// (254th button)
    static let button_254 = usage(kHIDUsage_Button_254)
    /// (255th button)
    static let button_255 = usage(kHIDUsage_Button_255)
    
    static func button(_ number: Int) -> HIDUsage {
        return usage(number)
    }
    
    static let button_65535 = usage(kHIDUsage_Button_65535)
}

/// Ordinal Page (0x0A)
///
/// The Ordinal page allows multiple instances of a control or sets of controls
/// to be declared without requiring individual enumeration in the native usage
/// page. For example, it is not necessary to declare usages of Pointer 1,
/// Pointer 2, and so forth on the Generic Desktop page. When parsed, the
/// ordinal instance number is, in essence, concatenated to the usages attached
/// to the encompassing collection to create Pointer 1, Pointer 2, and so forth.
///
/// For an example, see Section A.5, �ultiple Instances of a Control,�in
/// Appendix A, �sage Examples.�By convention, an Ordinal collection is placed
/// inside the collection for which it is declaring multiple instances.
///
/// Instances do not have to be identical.
public extension HIDUsage {
    /* 0x00 Reserved */
    /// Usage Modifier
    static let ord_Instance1 = usage(kHIDUsage_Ord_Instance1)
    /// Usage Modifier
    static let ord_Instance2 = usage(kHIDUsage_Ord_Instance2)
    /// Usage Modifier
    static let ord_Instance3 = usage(kHIDUsage_Ord_Instance3)
    /// Usage Modifier
    static let ord_Instance4 = usage(kHIDUsage_Ord_Instance4)
    /// Usage Modifier
    static let ord_Instance65535 = usage(kHIDUsage_Ord_Instance65535)
}

/// Telephony Page (0x0B)
///
/// This usage page defines the keytop and control usages for telephony devices.
///
/// Indicators on a phone are handled by wrapping them in LED: Usage In Use
/// Indicator and LED: Usage Selected Indicator usages. For example, a
/// message-indicator LED would be identified by a Telephony: Message usage
/// declared as a Feature or Output in a LED: Usage In Use Indicator collection.
///
/// See Section 14, �onsumer Page (0x0C),�for audio volume and tone controls.
public extension HIDUsage {
    /// Application Collection
    static let tfon_Phone = usage(kHIDUsage_Tfon_Phone)
    /// Application Collection
    static let tfon_AnsweringMachine = usage(kHIDUsage_Tfon_AnsweringMachine)
    /// Logical Collection
    static let tfon_MessageControls = usage(kHIDUsage_Tfon_MessageControls)
    /// Logical Collection
    static let tfon_Handset = usage(kHIDUsage_Tfon_Handset)
    /// Logical Collection
    static let tfon_Headset = usage(kHIDUsage_Tfon_Headset)
    /// Named Array
    static let tfon_TelephonyKeyPad = usage(kHIDUsage_Tfon_TelephonyKeyPad)
    /// Named Array
    static let tfon_ProgrammableButton = usage(kHIDUsage_Tfon_ProgrammableButton)
    
    /* 0x08 - 0x1F Reserved */
    
    /// On/Off Control
    static let tfon_HookSwitch = usage(kHIDUsage_Tfon_HookSwitch)
    /// Momentary Control
    static let tfon_Flash = usage(kHIDUsage_Tfon_Flash)
    /// One-Shot Control
    static let tfon_Feature = usage(kHIDUsage_Tfon_Feature)
    /// On/Off Control
    static let tfon_Hold = usage(kHIDUsage_Tfon_Hold)
    /// One-Shot Control
    static let tfon_Redial = usage(kHIDUsage_Tfon_Redial)
    /// One-Shot Control
    static let tfon_Transfer = usage(kHIDUsage_Tfon_Transfer)
    /// One-Shot Control
    static let tfon_Drop = usage(kHIDUsage_Tfon_Drop)
    /// On/Off Control
    static let tfon_Park = usage(kHIDUsage_Tfon_Park)
    /// On/Off Control
    static let tfon_ForwardCalls = usage(kHIDUsage_Tfon_ForwardCalls)
    /// Momentary Control
    static let tfon_AlternateFunction = usage(kHIDUsage_Tfon_AlternateFunction)
    /// One-Shot Control
    static let tfon_Line = usage(kHIDUsage_Tfon_Line)
    /// On/Off Control
    static let tfon_SpeakerPhone = usage(kHIDUsage_Tfon_SpeakerPhone)
    /// On/Off Control
    static let tfon_Conference = usage(kHIDUsage_Tfon_Conference)
    /// On/Off Control
    static let tfon_RingEnable = usage(kHIDUsage_Tfon_RingEnable)
    /// Selector
    static let tfon_Ring = usage(kHIDUsage_Tfon_Ring)
    /// On/Off Control
    static let tfon_PhoneMute = usage(kHIDUsage_Tfon_PhoneMute)
    /// Momentary Control
    static let tfon_CallerID = usage(kHIDUsage_Tfon_CallerID)
    
    /* 0x31 - 0x4F Reserved */
    
    /// One-Shot Control
    static let tfon_SpeedDial = usage(kHIDUsage_Tfon_SpeedDial)
    /// One-Shot Control
    static let tfon_StoreNumber = usage(kHIDUsage_Tfon_StoreNumber)
    /// One-Shot Control
    static let tfon_RecallNumber = usage(kHIDUsage_Tfon_RecallNumber)
    /// On/Off Control
    static let tfon_PhoneDirectory = usage(kHIDUsage_Tfon_PhoneDirectory)
    
    /* 0x54 - 0x6F Reserved */
    
    /// On/Off Control
    static let tfon_VoiceMail = usage(kHIDUsage_Tfon_VoiceMail)
    /// On/Off Control
    static let tfon_ScreenCalls = usage(kHIDUsage_Tfon_ScreenCalls)
    /// On/Off Control
    static let tfon_DoNotDisturb = usage(kHIDUsage_Tfon_DoNotDisturb)
    /// One-Shot Control
    static let tfon_Message = usage(kHIDUsage_Tfon_Message)
    /// On/Off Control
    static let tfon_AnswerOnOrOff = usage(kHIDUsage_Tfon_AnswerOnOrOff)
    
    /* 0x75 - 0x8F Reserved */
    
    /// Momentary Control
    static let tfon_InsideDialTone = usage(kHIDUsage_Tfon_InsideDialTone)
    /// Momentary Control
    static let tfon_OutsideDialTone = usage(kHIDUsage_Tfon_OutsideDialTone)
    /// Momentary Control
    static let tfon_InsideRingTone = usage(kHIDUsage_Tfon_InsideRingTone)
    /// Momentary Control
    static let tfon_OutsideRingTone = usage(kHIDUsage_Tfon_OutsideRingTone)
    /// Momentary Control
    static let tfon_PriorityRingTone = usage(kHIDUsage_Tfon_PriorityRingTone)
    /// Momentary Control
    static let tfon_InsideRingback = usage(kHIDUsage_Tfon_InsideRingback)
    /// Momentary Control
    static let tfon_PriorityRingback = usage(kHIDUsage_Tfon_PriorityRingback)
    /// Momentary Control
    static let tfon_LineBusyTone = usage(kHIDUsage_Tfon_LineBusyTone)
    /// Momentary Control
    static let tfon_ReorderTone = usage(kHIDUsage_Tfon_ReorderTone)
    /// Momentary Control
    static let tfon_CallWaitingTone = usage(kHIDUsage_Tfon_CallWaitingTone)
    /// Momentary Control
    static let tfon_ConfirmationTone1 = usage(kHIDUsage_Tfon_ConfirmationTone1)
    /// Momentary Control
    static let tfon_ConfirmationTone2 = usage(kHIDUsage_Tfon_ConfirmationTone2)
    /// On/Off Control
    static let tfon_TonesOff = usage(kHIDUsage_Tfon_TonesOff)
    /// Momentary Control
    static let tfon_OutsideRingback = usage(kHIDUsage_Tfon_OutsideRingback)
    
    /* 0x9E - 0xAF Reserved */
    
    /// Selector/One-Shot Control
    static let tfon_PhoneKey0 = usage(kHIDUsage_Tfon_PhoneKey0)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey1 = usage(kHIDUsage_Tfon_PhoneKey1)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey2 = usage(kHIDUsage_Tfon_PhoneKey2)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey3 = usage(kHIDUsage_Tfon_PhoneKey3)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey4 = usage(kHIDUsage_Tfon_PhoneKey4)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey5 = usage(kHIDUsage_Tfon_PhoneKey5)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey6 = usage(kHIDUsage_Tfon_PhoneKey6)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey7 = usage(kHIDUsage_Tfon_PhoneKey7)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey8 = usage(kHIDUsage_Tfon_PhoneKey8)
    /// Selector/One-Shot Control
    static let tfon_PhoneKey9 = usage(kHIDUsage_Tfon_PhoneKey9)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyStar = usage(kHIDUsage_Tfon_PhoneKeyStar)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyPound = usage(kHIDUsage_Tfon_PhoneKeyPound)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyA = usage(kHIDUsage_Tfon_PhoneKeyA)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyB = usage(kHIDUsage_Tfon_PhoneKeyB)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyC = usage(kHIDUsage_Tfon_PhoneKeyC)
    /// Selector/One-Shot Control
    static let tfon_PhoneKeyD = usage(kHIDUsage_Tfon_PhoneKeyD)
    
    /// 0xC0 - 0xFFFF Reserved
    static let tFon_Reserved = usage(kHIDUsage_TFon_Reserved)
}

/// Consumer Page (0x0C)
///
/// All controls on the Consumer page are application-specific. That is, they
/// affect a specific device, not the system as a whole.
public extension HIDUsage {
    /// Application Collection
    static let csmr_ConsumerControl = usage(kHIDUsage_Csmr_ConsumerControl)
    /// Named Array
    static let csmr_NumericKeyPad = usage(kHIDUsage_Csmr_NumericKeyPad)
    /// Named Array
    static let csmr_ProgrammableButtons = usage(kHIDUsage_Csmr_ProgrammableButtons)
    /// Application Collection
    static let csmr_Microphone = usage(kHIDUsage_Csmr_Microphone)
    /// Application Collection
    static let csmr_Headphone = usage(kHIDUsage_Csmr_Headphone)
    /// Application Collection
    static let csmr_GraphicEqualizer = usage(kHIDUsage_Csmr_GraphicEqualizer)
    /* 0x07 - 0x1F Reserved */
    /// One-Shot Control
    static let csmr_Plus10 = usage(kHIDUsage_Csmr_Plus10)
    /// One-Shot Control
    static let csmr_Plus100 = usage(kHIDUsage_Csmr_Plus100)
    /// One-Shot Control
    static let csmr_AMOrPM = usage(kHIDUsage_Csmr_AMOrPM)
    /* 0x23 - 0x3F Reserved */
    /// On/Off Control
    static let csmr_Power = usage(kHIDUsage_Csmr_Power)
    /// One-Shot Control
    static let csmr_Reset = usage(kHIDUsage_Csmr_Reset)
    /// One-Shot Control
    static let csmr_Sleep = usage(kHIDUsage_Csmr_Sleep)
    /// One-Shot Control
    static let csmr_SleepAfter = usage(kHIDUsage_Csmr_SleepAfter)
    /// Re-Trigger Control
    static let csmr_SleepMode = usage(kHIDUsage_Csmr_SleepMode)
    /// On/Off Control
    static let csmr_Illumination = usage(kHIDUsage_Csmr_Illumination)
    /// Named Array
    static let csmr_FunctionButtons = usage(kHIDUsage_Csmr_FunctionButtons)
    /* 0x37 - 0x3F Reserved */
    /// On/Off Control
    static let csmr_Menu = usage(kHIDUsage_Csmr_Menu)
    /// One-Shot Control
    static let csmr_MenuPick = usage(kHIDUsage_Csmr_MenuPick)
    /// One-Shot Control
    static let csmr_MenuUp = usage(kHIDUsage_Csmr_MenuUp)
    /// One-Shot Control
    static let csmr_MenuDown = usage(kHIDUsage_Csmr_MenuDown)
    /// One-Shot Control
    static let csmr_MenuLeft = usage(kHIDUsage_Csmr_MenuLeft)
    /// One-Shot Control
    static let csmr_MenuRight = usage(kHIDUsage_Csmr_MenuRight)
    /// One-Shot Control
    static let csmr_MenuEscape = usage(kHIDUsage_Csmr_MenuEscape)
    /// One-Shot Control
    static let csmr_MenuValueIncrease = usage(kHIDUsage_Csmr_MenuValueIncrease)
    /// One-Shot Control
    static let csmr_MenuValueDecrease = usage(kHIDUsage_Csmr_MenuValueDecrease)
    
    /* 0x49 - 0x5F Reserved */
    
    /// On/Off Control
    static let csmr_DataOnScreen = usage(kHIDUsage_Csmr_DataOnScreen)
    /// On/Off Control
    static let csmr_ClosedCaption = usage(kHIDUsage_Csmr_ClosedCaption)
    /// Selector
    static let csmr_ClosedCaptionSelect = usage(kHIDUsage_Csmr_ClosedCaptionSelect)
    /// On/Off Control
    static let csmr_VCROrTV = usage(kHIDUsage_Csmr_VCROrTV)
    /// One-Shot Control
    static let csmr_BroadcastMode = usage(kHIDUsage_Csmr_BroadcastMode)
    /// One-Shot Control
    static let csmr_Snapshot = usage(kHIDUsage_Csmr_Snapshot)
    /// One-Shot Control
    static let csmr_Still = usage(kHIDUsage_Csmr_Still)
    /// One-Shot Control
    static let csmr_PictureInPictureToggle = usage(kHIDUsage_Csmr_PictureInPictureToggle)
    /// One-Shot Control
    static let csmr_PictureInPictureSwap = usage(kHIDUsage_Csmr_PictureInPictureSwap)
    /// Momentary Control
    static let csmr_RedMenuButton = usage(kHIDUsage_Csmr_RedMenuButton)
    /// Momentary Control
    static let csmr_GreenMenuButton = usage(kHIDUsage_Csmr_GreenMenuButton)
    /// Momentary Control
    static let csmr_BlueMenuButton = usage(kHIDUsage_Csmr_BlueMenuButton)
    /// Momentary Control
    static let csmr_YellowMenuButton = usage(kHIDUsage_Csmr_YellowMenuButton)
    /// One-shot Control
    static let csmr_Aspect = usage(kHIDUsage_Csmr_Aspect)
    /// One-shot Control
    static let csmr_3DModeSelect = usage(kHIDUsage_Csmr_3DModeSelect)
    /// Re-Trigger Control
    static let csmr_DisplayBrightnessIncrement = usage(kHIDUsage_Csmr_DisplayBrightnessIncrement)
    /// Re-Trigger Control
    static let csmr_DisplayBrightnessDecrement = usage(kHIDUsage_Csmr_DisplayBrightnessDecrement)
    /// Logical Collection
    static let csmr_DisplayBrightness = usage(kHIDUsage_Csmr_DisplayBrightness)
    /// One Shot Control
    static let csmr_DisplayBacklightToggle = usage(kHIDUsage_Csmr_DisplayBacklightToggle)
    /// One Shot Control
    static let csmr_DisplayBrightnessMinimum = usage(kHIDUsage_Csmr_DisplayBrightnessMinimum)
    /// One Shot Control
    static let csmr_DisplayBrightnessMaximum = usage(kHIDUsage_Csmr_DisplayBrightnessMaximum)
    /// On Off Control
    static let csmr_DisplayBrightnessSetAutoBrightness = usage(kHIDUsage_Csmr_DisplayBrightnessSetAutoBrightness)
    /// Re-Trigger Control
    static let csmr_KeyboardBrightnessIncrement = usage(kHIDUsage_Csmr_KeyboardBrightnessIncrement)
    /// Re-Trigger Control
    static let csmr_KeyboardBrightnessDecrement = usage(kHIDUsage_Csmr_KeyboardBrightnessDecrement)
    
    /* 0x7B - 0x7F Reserved */
    
    /// Named Array
    static let csmr_Selection = usage(kHIDUsage_Csmr_Selection)
    /// Selector
    static let csmr_Assign = usage(kHIDUsage_Csmr_Assign)
    /// One-Shot Control
    static let csmr_ModeStep = usage(kHIDUsage_Csmr_ModeStep)
    /// One-Shot Control
    static let csmr_RecallLast = usage(kHIDUsage_Csmr_RecallLast)
    /// One-Shot Control
    static let csmr_EnterChannel = usage(kHIDUsage_Csmr_EnterChannel)
    /// One-Shot Control
    static let csmr_OrderMovie = usage(kHIDUsage_Csmr_OrderMovie)
    /// Linear Control
    static let csmr_Channel = usage(kHIDUsage_Csmr_Channel)
    /// Selector
    static let csmr_MediaSelection = usage(kHIDUsage_Csmr_MediaSelection)
    /// Selector
    static let csmr_MediaSelectComputer = usage(kHIDUsage_Csmr_MediaSelectComputer)
    /// Selector
    static let csmr_MediaSelectTV = usage(kHIDUsage_Csmr_MediaSelectTV)
    /// Selector
    static let csmr_MediaSelectWWW = usage(kHIDUsage_Csmr_MediaSelectWWW)
    /// Selector
    static let csmr_MediaSelectDVD = usage(kHIDUsage_Csmr_MediaSelectDVD)
    /// Selector
    static let csmr_MediaSelectTelephone = usage(kHIDUsage_Csmr_MediaSelectTelephone)
    /// Selector
    static let csmr_MediaSelectProgramGuide = usage(kHIDUsage_Csmr_MediaSelectProgramGuide)
    /// Selector
    static let csmr_MediaSelectVideoPhone = usage(kHIDUsage_Csmr_MediaSelectVideoPhone)
    /// Selector
    static let csmr_MediaSelectGames = usage(kHIDUsage_Csmr_MediaSelectGames)
    /// Selector
    static let csmr_MediaSelectMessages = usage(kHIDUsage_Csmr_MediaSelectMessages)
    /// Selector
    static let csmr_MediaSelectCD = usage(kHIDUsage_Csmr_MediaSelectCD)
    /// Selector
    static let csmr_MediaSelectVCR = usage(kHIDUsage_Csmr_MediaSelectVCR)
    /// Selector
    static let csmr_MediaSelectTuner = usage(kHIDUsage_Csmr_MediaSelectTuner)
    /// One-Shot Control
    static let csmr_Quit = usage(kHIDUsage_Csmr_Quit)
    /// On/Off Control
    static let csmr_Help = usage(kHIDUsage_Csmr_Help)
    /// Selector
    static let csmr_MediaSelectTape = usage(kHIDUsage_Csmr_MediaSelectTape)
    /// Selector
    static let csmr_MediaSelectCable = usage(kHIDUsage_Csmr_MediaSelectCable)
    /// Selector
    static let csmr_MediaSelectSatellite = usage(kHIDUsage_Csmr_MediaSelectSatellite)
    /// Selector
    static let csmr_MediaSelectSecurity = usage(kHIDUsage_Csmr_MediaSelectSecurity)
    /// Selector
    static let csmr_MediaSelectHome = usage(kHIDUsage_Csmr_MediaSelectHome)
    /// Selector
    static let csmr_MediaSelectCall = usage(kHIDUsage_Csmr_MediaSelectCall)
    /// One-Shot Control
    static let csmr_ChannelIncrement = usage(kHIDUsage_Csmr_ChannelIncrement)
    /// One-Shot Control
    static let csmr_ChannelDecrement = usage(kHIDUsage_Csmr_ChannelDecrement)
    /// Selector
    static let csmr_Media = usage(kHIDUsage_Csmr_Media)
    
    /* 0x9F Reserved */
    
    /// One-Shot Control
    static let csmr_VCRPlus = usage(kHIDUsage_Csmr_VCRPlus)
    /// One-Shot Control
    static let csmr_Once = usage(kHIDUsage_Csmr_Once)
    /// One-Shot Control
    static let csmr_Daily = usage(kHIDUsage_Csmr_Daily)
    /// One-Shot Control
    static let csmr_Weekly = usage(kHIDUsage_Csmr_Weekly)
    /// One-Shot Control
    static let csmr_Monthly = usage(kHIDUsage_Csmr_Monthly)
    /* 0xA5 - 0xAF Reserved */
    /// On/Off Control
    static let csmr_Play = usage(kHIDUsage_Csmr_Play)
    /// On/Off Control
    static let csmr_Pause = usage(kHIDUsage_Csmr_Pause)
    /// On/Off Control
    static let csmr_Record = usage(kHIDUsage_Csmr_Record)
    /// On/Off Control
    static let csmr_FastForward = usage(kHIDUsage_Csmr_FastForward)
    /// On/Off Control
    static let csmr_Rewind = usage(kHIDUsage_Csmr_Rewind)
    /// One-Shot Control
    static let csmr_ScanNextTrack = usage(kHIDUsage_Csmr_ScanNextTrack)
    /// One-Shot Control
    static let csmr_ScanPreviousTrack = usage(kHIDUsage_Csmr_ScanPreviousTrack)
    /// One-Shot Control
    static let csmr_Stop = usage(kHIDUsage_Csmr_Stop)
    /// One-Shot Control
    static let csmr_Eject = usage(kHIDUsage_Csmr_Eject)
    /// On/Off Control
    static let csmr_RandomPlay = usage(kHIDUsage_Csmr_RandomPlay)
    /// Named Array
    static let csmr_SelectDisc = usage(kHIDUsage_Csmr_SelectDisc)
    /// Momentary Control
    static let csmr_EnterDisc = usage(kHIDUsage_Csmr_EnterDisc)
    /// One-Shot Control
    static let csmr_Repeat = usage(kHIDUsage_Csmr_Repeat)
    /// Linear Control
    static let csmr_Tracking = usage(kHIDUsage_Csmr_Tracking)
    /// One-Shot Control
    static let csmr_TrackNormal = usage(kHIDUsage_Csmr_TrackNormal)
    /// Linear Control
    static let csmr_SlowTracking = usage(kHIDUsage_Csmr_SlowTracking)
    /// Re-Trigger Control
    static let csmr_FrameForward = usage(kHIDUsage_Csmr_FrameForward)
    /// Re-Trigger Control
    static let csmr_FrameBack = usage(kHIDUsage_Csmr_FrameBack)
    /// One-Shot Control
    static let csmr_Mark = usage(kHIDUsage_Csmr_Mark)
    /// One-Shot Control
    static let csmr_ClearMark = usage(kHIDUsage_Csmr_ClearMark)
    /// On/Off Control
    static let csmr_RepeatFromMark = usage(kHIDUsage_Csmr_RepeatFromMark)
    /// One-Shot Control
    static let csmr_ReturnToMark = usage(kHIDUsage_Csmr_ReturnToMark)
    /// One-Shot Control
    static let csmr_SearchMarkForward = usage(kHIDUsage_Csmr_SearchMarkForward)
    /// One-Shot Control
    static let csmr_SearchMarkBackwards = usage(kHIDUsage_Csmr_SearchMarkBackwards)
    /// One-Shot Control
    static let csmr_CounterReset = usage(kHIDUsage_Csmr_CounterReset)
    /// One-Shot Control
    static let csmr_ShowCounter = usage(kHIDUsage_Csmr_ShowCounter)
    /// Re-Trigger Control
    static let csmr_TrackingIncrement = usage(kHIDUsage_Csmr_TrackingIncrement)
    /// Re-Trigger Control
    static let csmr_TrackingDecrement = usage(kHIDUsage_Csmr_TrackingDecrement)
    /// One-Shot Control
    static let csmr_StopOrEject = usage(kHIDUsage_Csmr_StopOrEject)
    /// One-Shot Control
    static let csmr_PlayOrPause = usage(kHIDUsage_Csmr_PlayOrPause)
    /// One-Shot Control
    static let csmr_PlayOrSkip = usage(kHIDUsage_Csmr_PlayOrSkip)
    /// One-Shot Control
    static let csmr_VoiceCommand = usage(kHIDUsage_Csmr_VoiceCommand)
    
    /* 0xCF - 0xDF Reserved */
    
    /// Linear Control
    static let csmr_Volume = usage(kHIDUsage_Csmr_Volume)
    /// Linear Control
    static let csmr_Balance = usage(kHIDUsage_Csmr_Balance)
    /// On/Off Control
    static let csmr_Mute = usage(kHIDUsage_Csmr_Mute)
    /// Linear Control
    static let csmr_Bass = usage(kHIDUsage_Csmr_Bass)
    /// Linear Control
    static let csmr_Treble = usage(kHIDUsage_Csmr_Treble)
    /// On/Off Control
    static let csmr_BassBoost = usage(kHIDUsage_Csmr_BassBoost)
    /// One-Shot Control
    static let csmr_SurroundMode = usage(kHIDUsage_Csmr_SurroundMode)
    /// On/Off Control
    static let csmr_Loudness = usage(kHIDUsage_Csmr_Loudness)
    /// On/Off Control
    static let csmr_MPX = usage(kHIDUsage_Csmr_MPX)
    /// Re-Trigger Control
    static let csmr_VolumeIncrement = usage(kHIDUsage_Csmr_VolumeIncrement)
    /// Re-Trigger Control
    static let csmr_VolumeDecrement = usage(kHIDUsage_Csmr_VolumeDecrement)
    
    /* 0xEB - 0xEF Reserved */
    
    /// Selector
    static let csmr_Speed = usage(kHIDUsage_Csmr_Speed)
    /// Named Array
    static let csmr_PlaybackSpeed = usage(kHIDUsage_Csmr_PlaybackSpeed)
    /// Selector
    static let csmr_StandardPlay = usage(kHIDUsage_Csmr_StandardPlay)
    /// Selector
    static let csmr_LongPlay = usage(kHIDUsage_Csmr_LongPlay)
    /// Selector
    static let csmr_ExtendedPlay = usage(kHIDUsage_Csmr_ExtendedPlay)
    /// One-Shot Control
    static let csmr_Slow = usage(kHIDUsage_Csmr_Slow)
    
    /* 0xF6 - 0xFF Reserved */
    
    /// On/Off Control
    static let csmr_FanEnable = usage(kHIDUsage_Csmr_FanEnable)
    /// Linear Control
    static let csmr_FanSpeed = usage(kHIDUsage_Csmr_FanSpeed)
    /// On/Off Control
    static let csmr_LightEnable = usage(kHIDUsage_Csmr_LightEnable)
    /// Linear Control
    static let csmr_LightIlluminationLevel = usage(kHIDUsage_Csmr_LightIlluminationLevel)
    /// On/Off Control
    static let csmr_ClimateControlEnable = usage(kHIDUsage_Csmr_ClimateControlEnable)
    /// Linear Control
    static let csmr_RoomTemperature = usage(kHIDUsage_Csmr_RoomTemperature)
    /// On/Off Control
    static let csmr_SecurityEnable = usage(kHIDUsage_Csmr_SecurityEnable)
    /// One-Shot Control
    static let csmr_FireAlarm = usage(kHIDUsage_Csmr_FireAlarm)
    /// One-Shot Control
    static let csmr_PoliceAlarm = usage(kHIDUsage_Csmr_PoliceAlarm)
    /// Linear Control
    static let csmr_Proximity = usage(kHIDUsage_Csmr_Proximity)
    /// One-Shot Control
    static let csmr_Motion = usage(kHIDUsage_Csmr_Motion)
    /// One-Shot Control
    static let csmr_DuressAlarm = usage(kHIDUsage_Csmr_DuressAlarm)
    /// One-Shot Control
    static let csmr_HoldupAlarm = usage(kHIDUsage_Csmr_HoldupAlarm)
    /// One-Shot Control
    static let csmr_MedicalAlarm = usage(kHIDUsage_Csmr_MedicalAlarm)
    
    /* 0x10E - 0x14F Reserved */
    
    /// Re-Trigger Control
    static let csmr_BalanceRight = usage(kHIDUsage_Csmr_BalanceRight)
    /// Re-Trigger Control
    static let csmr_BalanceLeft = usage(kHIDUsage_Csmr_BalanceLeft)
    /// Re-Trigger Control
    static let csmr_BassIncrement = usage(kHIDUsage_Csmr_BassIncrement)
    /// Re-Trigger Control
    static let csmr_BassDecrement = usage(kHIDUsage_Csmr_BassDecrement)
    /// Re-Trigger Control
    static let csmr_TrebleIncrement = usage(kHIDUsage_Csmr_TrebleIncrement)
    /// Re-Trigger Control
    static let csmr_TrebleDecrement = usage(kHIDUsage_Csmr_TrebleDecrement)
    /* 0x156 - 0x15F Reserved */
    /// Logical Collection
    static let csmr_SpeakerSystem = usage(kHIDUsage_Csmr_SpeakerSystem)
    /// Logical Collection
    static let csmr_ChannelLeft = usage(kHIDUsage_Csmr_ChannelLeft)
    /// Logical Collection
    static let csmr_ChannelRight = usage(kHIDUsage_Csmr_ChannelRight)
    /// Logical Collection
    static let csmr_ChannelCenter = usage(kHIDUsage_Csmr_ChannelCenter)
    /// Logical Collection
    static let csmr_ChannelFront = usage(kHIDUsage_Csmr_ChannelFront)
    /// Logical Collection
    static let csmr_ChannelCenterFront = usage(kHIDUsage_Csmr_ChannelCenterFront)
    /// Logical Collection
    static let csmr_ChannelSide = usage(kHIDUsage_Csmr_ChannelSide)
    /// Logical Collection
    static let csmr_ChannelSurround = usage(kHIDUsage_Csmr_ChannelSurround)
    /// Logical Collection
    static let csmr_ChannelLowFrequencyEnhancement = usage(kHIDUsage_Csmr_ChannelLowFrequencyEnhancement)
    /// Logical Collection
    static let csmr_ChannelTop = usage(kHIDUsage_Csmr_ChannelTop)
    /// Logical Collection
    static let csmr_ChannelUnknown = usage(kHIDUsage_Csmr_ChannelUnknown)
    
    /* 0x16B - 0x16F Reserved */
    
    /// Linear Control
    static let csmr_SubChannel = usage(kHIDUsage_Csmr_SubChannel)
    /// One-Shot Control
    static let csmr_SubChannelIncrement = usage(kHIDUsage_Csmr_SubChannelIncrement)
    /// One-Shot Control
    static let csmr_SubChannelDecrement = usage(kHIDUsage_Csmr_SubChannelDecrement)
    /// One-Shot Control
    static let csmr_AlternateAudioIncrement = usage(kHIDUsage_Csmr_AlternateAudioIncrement)
    /// One-Shot Control
    static let csmr_AlternateAudioDecrement = usage(kHIDUsage_Csmr_AlternateAudioDecrement)
    
    /* 0x175 - 0x17F Reserved */
    
    /// Named Array
    static let csmr_ApplicationLaunchButtons = usage(kHIDUsage_Csmr_ApplicationLaunchButtons)
    /// Selector
    static let csmr_ALLaunchButtonConfigurationTool = usage(kHIDUsage_Csmr_ALLaunchButtonConfigurationTool)
    /// Selector
    static let csmr_ALProgrammableButtonConfiguration = usage(kHIDUsage_Csmr_ALProgrammableButtonConfiguration)
    /// Selector
    static let csmr_ALConsumerControlConfiguration = usage(kHIDUsage_Csmr_ALConsumerControlConfiguration)
    /// Selector
    static let csmr_ALWordProcessor = usage(kHIDUsage_Csmr_ALWordProcessor)
    /// Selector
    static let csmr_ALTextEditor = usage(kHIDUsage_Csmr_ALTextEditor)
    /// Selector
    static let csmr_ALSpreadsheet = usage(kHIDUsage_Csmr_ALSpreadsheet)
    /// Selector
    static let csmr_ALGraphicsEditor = usage(kHIDUsage_Csmr_ALGraphicsEditor)
    /// Selector
    static let csmr_ALPresentationApp = usage(kHIDUsage_Csmr_ALPresentationApp)
    /// Selector
    static let csmr_ALDatabaseApp = usage(kHIDUsage_Csmr_ALDatabaseApp)
    /// Selector
    static let csmr_ALEmailReader = usage(kHIDUsage_Csmr_ALEmailReader)
    /// Selector
    static let csmr_ALNewsreader = usage(kHIDUsage_Csmr_ALNewsreader)
    /// Selector
    static let csmr_ALVoicemail = usage(kHIDUsage_Csmr_ALVoicemail)
    /// Selector
    static let csmr_ALContactsOrAddressBook = usage(kHIDUsage_Csmr_ALContactsOrAddressBook)
    /// Selector
    static let csmr_ALCalendarOrSchedule = usage(kHIDUsage_Csmr_ALCalendarOrSchedule)
    /// Selector
    static let csmr_ALTaskOrProjectManager = usage(kHIDUsage_Csmr_ALTaskOrProjectManager)
    /// Selector
    static let csmr_ALLogOrJournalOrTimecard = usage(kHIDUsage_Csmr_ALLogOrJournalOrTimecard)
    /// Selector
    static let csmr_ALCheckbookOrFinance = usage(kHIDUsage_Csmr_ALCheckbookOrFinance)
    /// Selector
    static let csmr_ALCalculator = usage(kHIDUsage_Csmr_ALCalculator)
    /// Selector
    static let csmr_ALAOrVCaptureOrPlayback = usage(kHIDUsage_Csmr_ALAOrVCaptureOrPlayback)
    /// Selector
    static let csmr_ALLocalMachineBrowser = usage(kHIDUsage_Csmr_ALLocalMachineBrowser)
    /// Selector
    static let csmr_ALLANOrWANBrowser = usage(kHIDUsage_Csmr_ALLANOrWANBrowser)
    /// Selector
    static let csmr_ALInternetBrowser = usage(kHIDUsage_Csmr_ALInternetBrowser)
    /// Selector
    static let csmr_ALRemoteNetworkingOrISPConnect = usage(kHIDUsage_Csmr_ALRemoteNetworkingOrISPConnect)
    /// Selector
    static let csmr_ALNetworkConference = usage(kHIDUsage_Csmr_ALNetworkConference)
    /// Selector
    static let csmr_ALNetworkChat = usage(kHIDUsage_Csmr_ALNetworkChat)
    /// Selector
    static let csmr_ALTelephonyOrDialer = usage(kHIDUsage_Csmr_ALTelephonyOrDialer)
    /// Selector
    static let csmr_ALLogon = usage(kHIDUsage_Csmr_ALLogon)
    /// Selector
    static let csmr_ALLogoff = usage(kHIDUsage_Csmr_ALLogoff)
    /// Selector
    static let csmr_ALLogonOrLogoff = usage(kHIDUsage_Csmr_ALLogonOrLogoff)
    /// Selector
    static let csmr_ALTerminalLockOrScreensaver = usage(kHIDUsage_Csmr_ALTerminalLockOrScreensaver)
    /// Selector
    static let csmr_ALControlPanel = usage(kHIDUsage_Csmr_ALControlPanel)
    /// Selector
    static let csmr_ALCommandLineProcessorOrRun = usage(kHIDUsage_Csmr_ALCommandLineProcessorOrRun)
    /// Selector
    static let csmr_ALProcessOrTaskManager = usage(kHIDUsage_Csmr_ALProcessOrTaskManager)
    /// Selector
    static let csmr_AL = usage(kHIDUsage_Csmr_AL)
    /// Selector
    static let csmr_ALNextTaskOrApplication = usage(kHIDUsage_Csmr_ALNextTaskOrApplication)
    /// Selector
    static let csmr_ALPreviousTaskOrApplication = usage(kHIDUsage_Csmr_ALPreviousTaskOrApplication)
    /// Selector
    static let csmr_ALPreemptiveHaltTaskOrApplication = usage(kHIDUsage_Csmr_ALPreemptiveHaltTaskOrApplication)
    /// Selector
    static let csmr_ALIntegratedHelpCenter = usage(kHIDUsage_Csmr_ALIntegratedHelpCenter)
    /// Selector
    static let csmr_ALDocuments = usage(kHIDUsage_Csmr_ALDocuments)
    /// Selector
    static let csmr_ALThesaurus = usage(kHIDUsage_Csmr_ALThesaurus)
    /// Selector
    static let csmr_ALDictionary = usage(kHIDUsage_Csmr_ALDictionary)
    /// Selector
    static let csmr_ALDesktop = usage(kHIDUsage_Csmr_ALDesktop)
    /// Selector
    static let csmr_ALSpellCheck = usage(kHIDUsage_Csmr_ALSpellCheck)
    /// Selector
    static let csmr_ALGrammerCheck = usage(kHIDUsage_Csmr_ALGrammerCheck)
    /// Selector
    static let csmr_ALWirelessStatus = usage(kHIDUsage_Csmr_ALWirelessStatus)
    /// Selector
    static let csmr_ALKeyboardLayout = usage(kHIDUsage_Csmr_ALKeyboardLayout)
    /// Selector
    static let csmr_ALVirusProtection = usage(kHIDUsage_Csmr_ALVirusProtection)
    /// Selector
    static let csmr_ALEncryption = usage(kHIDUsage_Csmr_ALEncryption)
    /// Selector
    static let csmr_ALScreenSaver = usage(kHIDUsage_Csmr_ALScreenSaver)
    /// Selector
    static let csmr_ALAlarms = usage(kHIDUsage_Csmr_ALAlarms)
    /// Selector
    static let csmr_ALClock = usage(kHIDUsage_Csmr_ALClock)
    /// Selector
    static let csmr_ALFileBrowser = usage(kHIDUsage_Csmr_ALFileBrowser)
    /// Selector
    static let csmr_ALPowerStatus = usage(kHIDUsage_Csmr_ALPowerStatus)
    /// Selector
    static let csmr_ALImageBrowser = usage(kHIDUsage_Csmr_ALImageBrowser)
    /// Selector
    static let csmr_ALAudioBrowser = usage(kHIDUsage_Csmr_ALAudioBrowser)
    /// Selector
    static let csmr_ALMovieBrowser = usage(kHIDUsage_Csmr_ALMovieBrowser)
    /// Selector
    static let csmr_ALDigitalRightsManager = usage(kHIDUsage_Csmr_ALDigitalRightsManager)
    /// Selector
    static let csmr_ALDigitalWallet = usage(kHIDUsage_Csmr_ALDigitalWallet)
    /* 0x1BB Reserved */
    /// Selector
    static let csmr_ALInstantMessaging = usage(kHIDUsage_Csmr_ALInstantMessaging)
    /// Selector
    static let csmr_ALOEMFeatureBrowser = usage(kHIDUsage_Csmr_ALOEMFeatureBrowser)
    /// Selector
    static let csmr_ALOEMHelp = usage(kHIDUsage_Csmr_ALOEMHelp)
    /// Selector
    static let csmr_ALOnlineCommunity = usage(kHIDUsage_Csmr_ALOnlineCommunity)
    /// Selector
    static let csmr_ALEntertainmentContentBrowser = usage(kHIDUsage_Csmr_ALEntertainmentContentBrowser)
    /// Selector
    static let csmr_ALOnlineShoppingBrowswer = usage(kHIDUsage_Csmr_ALOnlineShoppingBrowswer)
    /// Selector
    static let csmr_ALSmartCardInformationOrHelp = usage(kHIDUsage_Csmr_ALSmartCardInformationOrHelp)
    /// Selector
    static let csmr_ALMarketMonitorOrFinanceBrowser = usage(kHIDUsage_Csmr_ALMarketMonitorOrFinanceBrowser)
    /// Selector
    static let csmr_ALCustomizedCorporateNewsBrowser = usage(kHIDUsage_Csmr_ALCustomizedCorporateNewsBrowser)
    /// Selector
    static let csmr_ALOnlineActivityBrowswer = usage(kHIDUsage_Csmr_ALOnlineActivityBrowswer)
    /// Selector
    static let csmr_ALResearchOrSearchBrowswer = usage(kHIDUsage_Csmr_ALResearchOrSearchBrowswer)
    /// Selector
    static let csmr_ALAudioPlayer = usage(kHIDUsage_Csmr_ALAudioPlayer)
    /// Selector
    static let csmr_ALNavigation = usage(kHIDUsage_Csmr_ALNavigation)
    /* 0x1C9 - 0x1FF Reserved */
    /// Named Array
    static let csmr_GenericGUIApplicationControls = usage(kHIDUsage_Csmr_GenericGUIApplicationControls)
    /// Selector
    static let csmr_ACNew = usage(kHIDUsage_Csmr_ACNew)
    /// Selector
    static let csmr_ACOpen = usage(kHIDUsage_Csmr_ACOpen)
    /// Selector
    static let csmr_ACClose = usage(kHIDUsage_Csmr_ACClose)
    /// Selector
    static let csmr_ACExit = usage(kHIDUsage_Csmr_ACExit)
    /// Selector
    static let csmr_ACMaximize = usage(kHIDUsage_Csmr_ACMaximize)
    /// Selector
    static let csmr_ACMinimize = usage(kHIDUsage_Csmr_ACMinimize)
    /// Selector
    static let csmr_ACSave = usage(kHIDUsage_Csmr_ACSave)
    /// Selector
    static let csmr_ACPrint = usage(kHIDUsage_Csmr_ACPrint)
    /// Selector
    static let csmr_ACProperties = usage(kHIDUsage_Csmr_ACProperties)
    /// Selector
    static let csmr_ACUndo = usage(kHIDUsage_Csmr_ACUndo)
    /// Selector
    static let csmr_ACCopy = usage(kHIDUsage_Csmr_ACCopy)
    /// Selector
    static let csmr_ACCut = usage(kHIDUsage_Csmr_ACCut)
    /// Selector
    static let csmr_ACPaste = usage(kHIDUsage_Csmr_ACPaste)
    /// Selector
    static let csmr_AC = usage(kHIDUsage_Csmr_AC)
    /// Selector
    static let csmr_ACFind = usage(kHIDUsage_Csmr_ACFind)
    /// Selector
    static let csmr_ACFindandReplace = usage(kHIDUsage_Csmr_ACFindandReplace)
    /// Selector
    static let csmr_ACSearch = usage(kHIDUsage_Csmr_ACSearch)
    /// Selector
    static let csmr_ACGoTo = usage(kHIDUsage_Csmr_ACGoTo)
    /// Selector
    static let csmr_ACHome = usage(kHIDUsage_Csmr_ACHome)
    /// Selector
    static let csmr_ACBack = usage(kHIDUsage_Csmr_ACBack)
    /// Selector
    static let csmr_ACForward = usage(kHIDUsage_Csmr_ACForward)
    /// Selector
    static let csmr_ACStop = usage(kHIDUsage_Csmr_ACStop)
    /// Selector
    static let csmr_ACRefresh = usage(kHIDUsage_Csmr_ACRefresh)
    /// Selector
    static let csmr_ACPreviousLink = usage(kHIDUsage_Csmr_ACPreviousLink)
    /// Selector
    static let csmr_ACNextLink = usage(kHIDUsage_Csmr_ACNextLink)
    /// Selector
    static let csmr_ACBookmarks = usage(kHIDUsage_Csmr_ACBookmarks)
    /// Selector
    static let csmr_ACHistory = usage(kHIDUsage_Csmr_ACHistory)
    /// Selector
    static let csmr_ACSubscriptions = usage(kHIDUsage_Csmr_ACSubscriptions)
    /// Selector
    static let csmr_ACZoomIn = usage(kHIDUsage_Csmr_ACZoomIn)
    /// Selector
    static let csmr_ACZoomOut = usage(kHIDUsage_Csmr_ACZoomOut)
    /// Selector
    static let csmr_ACZoom = usage(kHIDUsage_Csmr_ACZoom)
    /// Selector
    static let csmr_ACFullScreenView = usage(kHIDUsage_Csmr_ACFullScreenView)
    /// Selector
    static let csmr_ACNormalView = usage(kHIDUsage_Csmr_ACNormalView)
    /// Selector
    static let csmr_ACViewToggle = usage(kHIDUsage_Csmr_ACViewToggle)
    /// Selector
    static let csmr_ACScrollUp = usage(kHIDUsage_Csmr_ACScrollUp)
    /// Selector
    static let csmr_ACScrollDown = usage(kHIDUsage_Csmr_ACScrollDown)
    /// Selector
    static let csmr_ACScroll = usage(kHIDUsage_Csmr_ACScroll)
    /// Selector
    static let csmr_ACPanLeft = usage(kHIDUsage_Csmr_ACPanLeft)
    /// Selector
    static let csmr_ACPanRight = usage(kHIDUsage_Csmr_ACPanRight)
    /// Selector
    static let csmr_ACPan = usage(kHIDUsage_Csmr_ACPan)
    /// Selector
    static let csmr_ACNewWindow = usage(kHIDUsage_Csmr_ACNewWindow)
    /// Selector
    static let csmr_ACTileHorizontally = usage(kHIDUsage_Csmr_ACTileHorizontally)
    /// Selector
    static let csmr_ACTileVertically = usage(kHIDUsage_Csmr_ACTileVertically)
    /// Selector
    static let csmr_ACFormat = usage(kHIDUsage_Csmr_ACFormat)
    /// Selector
    static let csmr_ACEdit = usage(kHIDUsage_Csmr_ACEdit)
    /// Selector
    static let csmr_ACBold = usage(kHIDUsage_Csmr_ACBold)
    /// Selector
    static let csmr_ACItalics = usage(kHIDUsage_Csmr_ACItalics)
    /// Selector
    static let csmr_ACUnderline = usage(kHIDUsage_Csmr_ACUnderline)
    /// Selector
    static let csmr_ACStrikethrough = usage(kHIDUsage_Csmr_ACStrikethrough)
    /// Selector
    static let csmr_ACSubscript = usage(kHIDUsage_Csmr_ACSubscript)
    /// Selector
    static let csmr_ACSuperscript = usage(kHIDUsage_Csmr_ACSuperscript)
    /// Selector
    static let csmr_ACAllCaps = usage(kHIDUsage_Csmr_ACAllCaps)
    /// Selector
    static let csmr_ACRotate = usage(kHIDUsage_Csmr_ACRotate)
    /// Selector
    static let csmr_ACResize = usage(kHIDUsage_Csmr_ACResize)
    /// Selector
    static let csmr_ACFlipHorizontal = usage(kHIDUsage_Csmr_ACFlipHorizontal)
    /// Selector
    static let csmr_ACFlipVertical = usage(kHIDUsage_Csmr_ACFlipVertical)
    /// Selector
    static let csmr_ACMirrorHorizontal = usage(kHIDUsage_Csmr_ACMirrorHorizontal)
    /// Selector
    static let csmr_ACMirrorVertical = usage(kHIDUsage_Csmr_ACMirrorVertical)
    /// Selector
    static let csmr_ACFontSelect = usage(kHIDUsage_Csmr_ACFontSelect)
    /// Selector
    static let csmr_ACFontColor = usage(kHIDUsage_Csmr_ACFontColor)
    /// Selector
    static let csmr_ACFontSize = usage(kHIDUsage_Csmr_ACFontSize)
    /// Selector
    static let csmr_ACJustifyLeft = usage(kHIDUsage_Csmr_ACJustifyLeft)
    /// Selector
    static let csmr_ACJustifyCenterH = usage(kHIDUsage_Csmr_ACJustifyCenterH)
    /// Selector
    static let csmr_ACJustifyRight = usage(kHIDUsage_Csmr_ACJustifyRight)
    /// Selector
    static let csmr_ACJustifyBlockH = usage(kHIDUsage_Csmr_ACJustifyBlockH)
    /// Selector
    static let csmr_ACJustifyTop = usage(kHIDUsage_Csmr_ACJustifyTop)
    /// Selector
    static let csmr_ACJustifyCenterV = usage(kHIDUsage_Csmr_ACJustifyCenterV)
    /// Selector
    static let csmr_ACJustifyBottom = usage(kHIDUsage_Csmr_ACJustifyBottom)
    /// Selector
    static let csmr_ACJustifyBlockV = usage(kHIDUsage_Csmr_ACJustifyBlockV)
    /// Selector
    static let csmr_ACIndentyDecrease = usage(kHIDUsage_Csmr_ACIndentyDecrease)
    /// Selector
    static let csmr_ACIndentyIncrease = usage(kHIDUsage_Csmr_ACIndentyIncrease)
    /// Selector
    static let csmr_ACNumberedList = usage(kHIDUsage_Csmr_ACNumberedList)
    /// Selector
    static let csmr_ACRestartNumbering = usage(kHIDUsage_Csmr_ACRestartNumbering)
    /// Selector
    static let csmr_ACBulletedList = usage(kHIDUsage_Csmr_ACBulletedList)
    /// Selector
    static let csmr_ACPromote = usage(kHIDUsage_Csmr_ACPromote)
    /// Selector
    static let csmr_ACDemote = usage(kHIDUsage_Csmr_ACDemote)
    /// Selector
    static let csmr_ACYes = usage(kHIDUsage_Csmr_ACYes)
    /// Selector
    static let csmr_ACNo = usage(kHIDUsage_Csmr_ACNo)
    /// Selector
    static let csmr_ACCancel = usage(kHIDUsage_Csmr_ACCancel)
    /// Selector
    static let csmr_ACCatalog = usage(kHIDUsage_Csmr_ACCatalog)
    /// Selector
    static let csmr_ACBuyOrCheckout = usage(kHIDUsage_Csmr_ACBuyOrCheckout)
    /// Selector
    static let csmr_ACAddToCart = usage(kHIDUsage_Csmr_ACAddToCart)
    /// Selector
    static let csmr_ACExpand = usage(kHIDUsage_Csmr_ACExpand)
    /// Selector
    static let csmr_ACExpandAll = usage(kHIDUsage_Csmr_ACExpandAll)
    /// Selector
    static let csmr_ACCollapse = usage(kHIDUsage_Csmr_ACCollapse)
    /// Selector
    static let csmr_ACCollapseAll = usage(kHIDUsage_Csmr_ACCollapseAll)
    /// Selector
    static let csmr_ACPrintPreview = usage(kHIDUsage_Csmr_ACPrintPreview)
    /// Selector
    static let csmr_ACPasteSpecial = usage(kHIDUsage_Csmr_ACPasteSpecial)
    /// Selector
    static let csmr_ACInsertMode = usage(kHIDUsage_Csmr_ACInsertMode)
    /// Selector
    static let csmr_ACDelete = usage(kHIDUsage_Csmr_ACDelete)
    /// Selector
    static let csmr_ACLock = usage(kHIDUsage_Csmr_ACLock)
    /// Selector
    static let csmr_ACUnlock = usage(kHIDUsage_Csmr_ACUnlock)
    /// Selector
    static let csmr_ACProtect = usage(kHIDUsage_Csmr_ACProtect)
    /// Selector
    static let csmr_ACUnprotect = usage(kHIDUsage_Csmr_ACUnprotect)
    /// Selector
    static let csmr_ACAttachComment = usage(kHIDUsage_Csmr_ACAttachComment)
    /// Selector
    static let csmr_ACDetachComment = usage(kHIDUsage_Csmr_ACDetachComment)
    /// Selector
    static let csmr_ACViewComment = usage(kHIDUsage_Csmr_ACViewComment)
    /// Selector
    static let csmr_ACSelectWord = usage(kHIDUsage_Csmr_ACSelectWord)
    /// Selector
    static let csmr_ACSelectSentence = usage(kHIDUsage_Csmr_ACSelectSentence)
    /// Selector
    static let csmr_ACSelectParagraph = usage(kHIDUsage_Csmr_ACSelectParagraph)
    /// Selector
    static let csmr_ACSelectColumn = usage(kHIDUsage_Csmr_ACSelectColumn)
    /// Selector
    static let csmr_ACSelectRow = usage(kHIDUsage_Csmr_ACSelectRow)
    /// Selector
    static let csmr_ACSelectTable = usage(kHIDUsage_Csmr_ACSelectTable)
    /// Selector
    static let csmr_ACSelectObject = usage(kHIDUsage_Csmr_ACSelectObject)
    /// Selector
    static let csmr_ACRedoOrRepeat = usage(kHIDUsage_Csmr_ACRedoOrRepeat)
    /// Selector
    static let csmr_ACSort = usage(kHIDUsage_Csmr_ACSort)
    /// Selector
    static let csmr_ACSortAscending = usage(kHIDUsage_Csmr_ACSortAscending)
    /// Selector
    static let csmr_ACSortDescending = usage(kHIDUsage_Csmr_ACSortDescending)
    /// Selector
    static let csmr_ACFilter = usage(kHIDUsage_Csmr_ACFilter)
    /// Selector
    static let csmr_ACSetClock = usage(kHIDUsage_Csmr_ACSetClock)
    /// Selector
    static let csmr_ACViewClock = usage(kHIDUsage_Csmr_ACViewClock)
    /// Selector
    static let csmr_ACSelectTimeZone = usage(kHIDUsage_Csmr_ACSelectTimeZone)
    /// Selector
    static let csmr_ACEditTimeZones = usage(kHIDUsage_Csmr_ACEditTimeZones)
    /// Selector
    static let csmr_ACSetAlarm = usage(kHIDUsage_Csmr_ACSetAlarm)
    /// Selector
    static let csmr_ACClearAlarm = usage(kHIDUsage_Csmr_ACClearAlarm)
    /// Selector
    static let csmr_ACSnoozeAlarm = usage(kHIDUsage_Csmr_ACSnoozeAlarm)
    /// Selector
    static let csmr_ACResetAlarm = usage(kHIDUsage_Csmr_ACResetAlarm)
    /// Selector
    static let csmr_ACSynchronize = usage(kHIDUsage_Csmr_ACSynchronize)
    /// Selector
    static let csmr_ACSendOrReceive = usage(kHIDUsage_Csmr_ACSendOrReceive)
    /// Selector
    static let csmr_ACSendTo = usage(kHIDUsage_Csmr_ACSendTo)
    /// Selector
    static let csmr_ACReply = usage(kHIDUsage_Csmr_ACReply)
    /// Selector
    static let csmr_ACReplyAll = usage(kHIDUsage_Csmr_ACReplyAll)
    /// Selector
    static let csmr_ACForwardMessage = usage(kHIDUsage_Csmr_ACForwardMessage)
    /// Selector
    static let csmr_ACSend = usage(kHIDUsage_Csmr_ACSend)
    /// Selector
    static let csmr_ACAttachFile = usage(kHIDUsage_Csmr_ACAttachFile)
    /// Selector
    static let csmr_ACUpload = usage(kHIDUsage_Csmr_ACUpload)
    /// Selector
    static let csmr_ACDownload = usage(kHIDUsage_Csmr_ACDownload)
    /// Selector
    static let csmr_ACSetBorders = usage(kHIDUsage_Csmr_ACSetBorders)
    /// Selector
    static let csmr_ACInsertRow = usage(kHIDUsage_Csmr_ACInsertRow)
    /// Selector
    static let csmr_ACInsertColumn = usage(kHIDUsage_Csmr_ACInsertColumn)
    /// Selector
    static let csmr_ACInsertFile = usage(kHIDUsage_Csmr_ACInsertFile)
    /// Selector
    static let csmr_ACInsertPicture = usage(kHIDUsage_Csmr_ACInsertPicture)
    /// Selector
    static let csmr_ACInsertObject = usage(kHIDUsage_Csmr_ACInsertObject)
    /// Selector
    static let csmr_ACInsertSymbol = usage(kHIDUsage_Csmr_ACInsertSymbol)
    /// Selector
    static let csmr_ACSaveAndClose = usage(kHIDUsage_Csmr_ACSaveAndClose)
    /// Selector
    static let csmr_ACRename = usage(kHIDUsage_Csmr_ACRename)
    /// Selector
    static let csmr_ACMerge = usage(kHIDUsage_Csmr_ACMerge)
    /// Selector
    static let csmr_ACSplit = usage(kHIDUsage_Csmr_ACSplit)
    /// Selector
    static let csmr_ACDistributeH = usage(kHIDUsage_Csmr_ACDistributeH)
    /// Selector
    static let csmr_ACDistributeV = usage(kHIDUsage_Csmr_ACDistributeV)
    /// One-Shot Control
    static let csmr_ACKeyboardLayoutSelect = usage(kHIDUsage_Csmr_ACKeyboardLayoutSelect)
    /// Selector
    static let csmr_ACNavigationGuidance = usage(kHIDUsage_Csmr_ACNavigationGuidance)
    /// Selector
    static let csmr_ACDesktopShowAllWindows = usage(kHIDUsage_Csmr_ACDesktopShowAllWindows)
    /// Selector
    static let csmr_ACDesktopShowAllApplications = usage(kHIDUsage_Csmr_ACDesktopShowAllApplications)
    
    /// 0x2A1 - 0xFFFF Reserved
    static let csmr_Reserved = usage(kHIDUsage_Csmr_Reserved)
}

/// Digitizer Page (0x0D)
///
/// This section provides detailed descriptions of the usages employed by
/// Digitizer Devices.
public extension HIDUsage {
    /// Application Collection
    static let dig_Digitizer = usage(kHIDUsage_Dig_Digitizer)
    /// Application Collection
    static let dig_Pen = usage(kHIDUsage_Dig_Pen)
    /// Application Collection
    static let dig_LightPen = usage(kHIDUsage_Dig_LightPen)
    /// Application Collection
    static let dig_TouchScreen = usage(kHIDUsage_Dig_TouchScreen)
    /// Application Collection
    static let dig_TouchPad = usage(kHIDUsage_Dig_TouchPad)
    /// Application Collection
    static let dig_WhiteBoard = usage(kHIDUsage_Dig_WhiteBoard)
    /// Application Collection
    static let dig_CoordinateMeasuringMachine = usage(kHIDUsage_Dig_CoordinateMeasuringMachine)
    /// Application Collection
    static let dig_3DDigitizer = usage(kHIDUsage_Dig_3DDigitizer)
    /// Application Collection
    static let dig_StereoPlotter = usage(kHIDUsage_Dig_StereoPlotter)
    /// Application Collection
    static let dig_ArticulatedArm = usage(kHIDUsage_Dig_ArticulatedArm)
    /// Application Collection
    static let dig_Armature = usage(kHIDUsage_Dig_Armature)
    /// Application Collection
    static let dig_MultiplePointDigitizer = usage(kHIDUsage_Dig_MultiplePointDigitizer)
    /// Application Collection
    static let dig_FreeSpaceWand = usage(kHIDUsage_Dig_FreeSpaceWand)
    /// Application Collection
    static let dig_DeviceConfiguration = usage(kHIDUsage_Dig_DeviceConfiguration)
    
    /* 0x0F - 0x1F Reserved */
    
    /// Logical Collection
    static let dig_Stylus = usage(kHIDUsage_Dig_Stylus)
    /// Logical Collection
    static let dig_Puck = usage(kHIDUsage_Dig_Puck)
    /// Logical Collection
    static let dig_Finger = usage(kHIDUsage_Dig_Finger)
    /// Logical Collection
    static let dig_DeviceSettings = usage(kHIDUsage_Dig_DeviceSettings)
    /// Logical Collection
    static let dig_GestureCharacter = usage(kHIDUsage_Dig_GestureCharacter)
    
    /* 0x25 - 0x2F Reserved */
    
    /// Dynamic Value
    static let dig_TipPressure = usage(kHIDUsage_Dig_TipPressure)
    /// Dynamic Value
    static let dig_BarrelPressure = usage(kHIDUsage_Dig_BarrelPressure)
    /// Momentary Control
    static let dig_InRange = usage(kHIDUsage_Dig_InRange)
    /// Momentary Control
    static let dig_Touch = usage(kHIDUsage_Dig_Touch)
    /// One-Shot Control
    static let dig_Untouch = usage(kHIDUsage_Dig_Untouch)
    /// One-Shot Control
    static let dig_Tap = usage(kHIDUsage_Dig_Tap)
    /// Dynamic Value
    static let dig_Quality = usage(kHIDUsage_Dig_Quality)
    /// Momentary Control
    static let dig_DataValid = usage(kHIDUsage_Dig_DataValid)
    /// Dynamic Value
    static let dig_TransducerIndex = usage(kHIDUsage_Dig_TransducerIndex)
    /// Logical Collection
    static let dig_TabletFunctionKeys = usage(kHIDUsage_Dig_TabletFunctionKeys)
    /// Logical Collection
    static let dig_ProgramChangeKeys = usage(kHIDUsage_Dig_ProgramChangeKeys)
    /// Dynamic Value
    static let dig_BatteryStrength = usage(kHIDUsage_Dig_BatteryStrength)
    /// Momentary Control
    static let dig_Invert = usage(kHIDUsage_Dig_Invert)
    /// Dynamic Value
    static let dig_XTilt = usage(kHIDUsage_Dig_XTilt)
    /// Dynamic Value
    static let dig_YTilt = usage(kHIDUsage_Dig_YTilt)
    /// Dynamic Value
    static let dig_Azimuth = usage(kHIDUsage_Dig_Azimuth)
    /// Dynamic Value
    static let dig_Altitude = usage(kHIDUsage_Dig_Altitude)
    /// Dynamic Value
    static let dig_Twist = usage(kHIDUsage_Dig_Twist)
    /// Momentary Control
    static let dig_TipSwitch = usage(kHIDUsage_Dig_TipSwitch)
    /// Momentary Control
    static let dig_SecondaryTipSwitch = usage(kHIDUsage_Dig_SecondaryTipSwitch)
    /// Momentary Control
    static let dig_BarrelSwitch = usage(kHIDUsage_Dig_BarrelSwitch)
    /// Momentary Control
    static let dig_Eraser = usage(kHIDUsage_Dig_Eraser)
    /// Momentary Control
    static let dig_TabletPick = usage(kHIDUsage_Dig_TabletPick)
    /// Momentary Control
    static let dig_TouchValid = usage(kHIDUsage_Dig_TouchValid)
    /// Dynamic Value
    static let dig_Width = usage(kHIDUsage_Dig_Width)
    /// Dynamic Value
    static let dig_Height = usage(kHIDUsage_Dig_Height)
    
    /* 0x4A - 0x50 Reserved */
    
    /// Dynamic Value
    static let dig_ContactIdentifier = usage(kHIDUsage_Dig_ContactIdentifier)
    /// Dynamic Value
    static let dig_DeviceMode = usage(kHIDUsage_Dig_DeviceMode)
    /// Dynamic Value
    static let dig_DeviceIdentifier = usage(kHIDUsage_Dig_DeviceIdentifier)
    /// Dynamic Value
    static let dig_ContactCount = usage(kHIDUsage_Dig_ContactCount)
    /// Static Value
    static let dig_ContactCountMaximum = usage(kHIDUsage_Dig_ContactCountMaximum)
    /// Dynamic Value
    static let dig_RelativeScanTime = usage(kHIDUsage_Dig_RelativeScanTime)
    /// Dynamic Flag
    static let dig_SurfaceSwitch = usage(kHIDUsage_Dig_SurfaceSwitch)

    /* 0x56 - 0x5F Reserved */
    
    /// Dynamic Flag
    static let dig_GestureCharacterEnable = usage(kHIDUsage_Dig_GestureCharacterEnable)
    /// Dynamic Value
    static let dig_GestureCharacterQuality = usage(kHIDUsage_Dig_GestureCharacterQuality)
    /// Dynamic Value
    static let dig_GestureCharacterDataLength = usage(kHIDUsage_Dig_GestureCharacterDataLength)
    /// Buffered Bytes
    static let dig_GestureCharacterData = usage(kHIDUsage_Dig_GestureCharacterData)
    /// Named Array
    static let dig_GestureCharacterEncoding = usage(kHIDUsage_Dig_GestureCharacterEncoding)
    /// Selector
    static let dig_GestureCharacterEncodingUTF8 = usage(kHIDUsage_Dig_GestureCharacterEncodingUTF8)
    /// Selector
    static let dig_GestureCharacterEncodingUTF16LE = usage(kHIDUsage_Dig_GestureCharacterEncodingUTF16LE)
    /// Selector
    static let dig_GestureCharacterEncodingUTF16BE = usage(kHIDUsage_Dig_GestureCharacterEncodingUTF16BE)
    /// Selector
    static let dig_GestureCharacterEncodingUTF32LE = usage(kHIDUsage_Dig_GestureCharacterEncodingUTF32LE)
    /// Selector
    static let dig_GestureCharacterEncodingUTF32BE = usage(kHIDUsage_Dig_GestureCharacterEncodingUTF32BE)

    /// Dynamic Value
    static let dig_ReportRate = usage(kHIDUsage_Dig_ReportRate)

    ///0x70 - 0xFFFF Reserved
    static let dig_Reserved = usage(kHIDUsage_Dig_Reserved)
}

/// Physical Interface Device Page (0x0F)
///
/// This section provides detailed descriptions of the usages employed by Power
/// Devices.
public extension HIDUsage {
    /// CA - A collection of PID usages
    static let pid_PhysicalInterfaceDevice = usage(kHIDUsage_PID_PhysicalInterfaceDevice)

    /* 0x02 - 0x1F Reserved */

    /// DV - A force applied perpendicular to the surface of an object
    static let pid_Normal = usage(kHIDUsage_PID_Normal)
    static let pid_SetEffectReport = usage(kHIDUsage_PID_SetEffectReport)
    static let pid_EffectBlockIndex = usage(kHIDUsage_PID_EffectBlockIndex)
    static let pid_ParamBlockOffset = usage(kHIDUsage_PID_ParamBlockOffset)
    static let pid_ROM_Flag = usage(kHIDUsage_PID_ROM_Flag)
    static let pid_EffectType = usage(kHIDUsage_PID_EffectType)
    static let pid_ET_ConstantForce = usage(kHIDUsage_PID_ET_ConstantForce)
    static let pid_ET_Ramp = usage(kHIDUsage_PID_ET_Ramp)
    static let pid_ET_CustomForceData = usage(kHIDUsage_PID_ET_CustomForceData)

    /* 0x29 - 0x2F Reserved */

    static let pid_ET_Square = usage(kHIDUsage_PID_ET_Square)
    static let pid_ET_Sine = usage(kHIDUsage_PID_ET_Sine)
    static let pid_ET_Triangle = usage(kHIDUsage_PID_ET_Triangle)
    static let pid_ET_SawtoothUp = usage(kHIDUsage_PID_ET_SawtoothUp)
    static let pid_ET_SawtoothDown = usage(kHIDUsage_PID_ET_SawtoothDown)

    /* 0x35 - 0x3F Reserved */

    static let pid_ET_Spring = usage(kHIDUsage_PID_ET_Spring)
    static let pid_ET_Damper = usage(kHIDUsage_PID_ET_Damper)
    static let pid_ET_Inertia = usage(kHIDUsage_PID_ET_Inertia)
    static let pid_ET_Friction = usage(kHIDUsage_PID_ET_Friction)

    /* 0x44 - 0x4F Reserved */

    static let pid_Duration = usage(kHIDUsage_PID_Duration)
    static let pid_SamplePeriod = usage(kHIDUsage_PID_SamplePeriod)
    static let pid_Gain = usage(kHIDUsage_PID_Gain)
    static let pid_TriggerButton = usage(kHIDUsage_PID_TriggerButton)
    static let pid_TriggerRepeatInterval = usage(kHIDUsage_PID_TriggerRepeatInterval)
    static let pid_AxesEnable = usage(kHIDUsage_PID_AxesEnable)
    static let pid_DirectionEnable = usage(kHIDUsage_PID_DirectionEnable)
    static let pid_Direction = usage(kHIDUsage_PID_Direction)
    static let pid_TypeSpecificBlockOffset = usage(kHIDUsage_PID_TypeSpecificBlockOffset)
    static let pid_BlockType = usage(kHIDUsage_PID_BlockType)
    static let pid_SetEnvelopeReport = usage(kHIDUsage_PID_SetEnvelopeReport)
    static let pid_AttackLevel = usage(kHIDUsage_PID_AttackLevel)
    static let pid_AttackTime = usage(kHIDUsage_PID_AttackTime)
    static let pid_FadeLevel = usage(kHIDUsage_PID_FadeLevel)
    static let pid_FadeTime = usage(kHIDUsage_PID_FadeTime)
    static let pid_SetConditionReport = usage(kHIDUsage_PID_SetConditionReport)

    static let pid_CP_Offset = usage(kHIDUsage_PID_CP_Offset)
    static let pid_PositiveCoefficient = usage(kHIDUsage_PID_PositiveCoefficient)
    static let pid_NegativeCoefficient = usage(kHIDUsage_PID_NegativeCoefficient)
    static let pid_PositiveSaturation = usage(kHIDUsage_PID_PositiveSaturation)
    static let pid_NegativeSaturation = usage(kHIDUsage_PID_NegativeSaturation)
    static let pid_DeadBand = usage(kHIDUsage_PID_DeadBand)
    static let pid_DownloadForceSample = usage(kHIDUsage_PID_DownloadForceSample)
    static let pid_IsochCustomForceEnable = usage(kHIDUsage_PID_IsochCustomForceEnable)
    static let pid_CustomForceDataReport = usage(kHIDUsage_PID_CustomForceDataReport)
    static let pid_CustomForceData = usage(kHIDUsage_PID_CustomForceData)
    static let pid_CustomForceVendorDefinedData = usage(kHIDUsage_PID_CustomForceVendorDefinedData)
    static let pid_SetCustomForceReport = usage(kHIDUsage_PID_SetCustomForceReport)
    static let pid_CustomForceDataOffset = usage(kHIDUsage_PID_CustomForceDataOffset)
    static let pid_SampleCount = usage(kHIDUsage_PID_SampleCount)
    static let pid_SetPeriodicReport = usage(kHIDUsage_PID_SetPeriodicReport)
    static let pid_Offset = usage(kHIDUsage_PID_Offset)

    static let pid_Magnitude = usage(kHIDUsage_PID_Magnitude)
    static let pid_Phase = usage(kHIDUsage_PID_Phase)
    static let pid_Period = usage(kHIDUsage_PID_Period)
    static let pid_SetConstantForceReport = usage(kHIDUsage_PID_SetConstantForceReport)
    static let pid_SetRampForceReport = usage(kHIDUsage_PID_SetRampForceReport)
    static let pid_RampStart = usage(kHIDUsage_PID_RampStart)
    static let pid_RampEnd = usage(kHIDUsage_PID_RampEnd)
    static let pid_EffectOperationReport = usage(kHIDUsage_PID_EffectOperationReport)
    static let pid_EffectOperation = usage(kHIDUsage_PID_EffectOperation)
    static let pid_OpEffectStart = usage(kHIDUsage_PID_OpEffectStart)
    static let pid_OpEffectStartSolo = usage(kHIDUsage_PID_OpEffectStartSolo)
    static let pid_OpEffectStop = usage(kHIDUsage_PID_OpEffectStop)
    static let pid_LoopCount = usage(kHIDUsage_PID_LoopCount)
    static let pid_DeviceGainReport = usage(kHIDUsage_PID_DeviceGainReport)
    static let pid_DeviceGain = usage(kHIDUsage_PID_DeviceGain)
    static let pid_PoolReport = usage(kHIDUsage_PID_PoolReport)

    static let pid_RAM_PoolSize = usage(kHIDUsage_PID_RAM_PoolSize)
    static let pid_ROM_PoolSize = usage(kHIDUsage_PID_ROM_PoolSize)
    static let pid_ROM_EffectBlockCount = usage(kHIDUsage_PID_ROM_EffectBlockCount)
    static let pid_SimultaneousEffectsMax = usage(kHIDUsage_PID_SimultaneousEffectsMax)
    static let pid_PoolAlignment = usage(kHIDUsage_PID_PoolAlignment)
    static let pid_PoolMoveReport = usage(kHIDUsage_PID_PoolMoveReport)
    static let pid_MoveSource = usage(kHIDUsage_PID_MoveSource)
    static let pid_MoveDestination = usage(kHIDUsage_PID_MoveDestination)
    static let pid_MoveLength = usage(kHIDUsage_PID_MoveLength)
    static let pid_BlockLoadReport = usage(kHIDUsage_PID_BlockLoadReport)
    
    /* 0x8A Reserved */
    
    static let pid_BlockLoadStatus = usage(kHIDUsage_PID_BlockLoadStatus)
    static let pid_BlockLoadSuccess = usage(kHIDUsage_PID_BlockLoadSuccess)
    static let pid_BlockLoadFull = usage(kHIDUsage_PID_BlockLoadFull)
    static let pid_BlockLoadError = usage(kHIDUsage_PID_BlockLoadError)
    static let pid_BlockHandle = usage(kHIDUsage_PID_BlockHandle)

    static let pid_BlockFreeReport = usage(kHIDUsage_PID_BlockFreeReport)
    static let pid_TypeSpecificBlockHandle = usage(kHIDUsage_PID_TypeSpecificBlockHandle)
    static let pid_StateReport = usage(kHIDUsage_PID_StateReport)
    
    /* 0x93 Reserved */
    
    static let pid_EffectPlaying = usage(kHIDUsage_PID_EffectPlaying)
    static let pid_DeviceControlReport = usage(kHIDUsage_PID_DeviceControlReport)
    static let pid_DeviceControl = usage(kHIDUsage_PID_DeviceControl)
    static let pid_DC_EnableActuators = usage(kHIDUsage_PID_DC_EnableActuators)
    static let pid_DC_DisableActuators = usage(kHIDUsage_PID_DC_DisableActuators)
    static let pid_DC_StopAllEffects = usage(kHIDUsage_PID_DC_StopAllEffects)
    static let pid_DC_DeviceReset = usage(kHIDUsage_PID_DC_DeviceReset)
    static let pid_DC_DevicePause = usage(kHIDUsage_PID_DC_DevicePause)
    static let pid_DC_DeviceContinue = usage(kHIDUsage_PID_DC_DeviceContinue)

    /* 0x9d - 0x9E Reserved */

    static let pid_DevicePaused = usage(kHIDUsage_PID_DevicePaused)

    static let pid_ActuatorsEnabled = usage(kHIDUsage_PID_ActuatorsEnabled)

    /* 0xA1 - 0xA3 Reserved */

    static let pid_SafetySwitch = usage(kHIDUsage_PID_SafetySwitch)
    static let pid_ActuatorOverrideSwitch = usage(kHIDUsage_PID_ActuatorOverrideSwitch)
    static let pid_ActuatorPower = usage(kHIDUsage_PID_ActuatorPower)
    static let pid_StartDelay = usage(kHIDUsage_PID_StartDelay)
    static let pid_ParameterBlockSize = usage(kHIDUsage_PID_ParameterBlockSize)
    static let pid_DeviceManagedPool = usage(kHIDUsage_PID_DeviceManagedPool)
    static let pid_SharedParameterBlocks = usage(kHIDUsage_PID_SharedParameterBlocks)
    static let pid_CreateNewEffectReport = usage(kHIDUsage_PID_CreateNewEffectReport)
    static let pid_RAM_PoolAvailable = usage(kHIDUsage_PID_RAM_PoolAvailable)
    
    /// 0xAD - 0xFFFF Reserved
    static let pid_Reserved = usage(kHIDUsage_PID_Reserved)
}

/// AlphanumericDisplay Page (0x14)
///
/// The Alphanumeric Display page is intended for use by simple alphanumeric
/// displays that are used on consumer devices.
public extension HIDUsage {
    /// Application Collection
    static let ad_AlphanumericDisplay = usage(kHIDUsage_AD_AlphanumericDisplay)

    /* 0x02 - 0x1F Reserved */

    /// Logical Collection
    static let ad_DisplayAttributesReport = usage(kHIDUsage_AD_DisplayAttributesReport)
    /// Static Flag
    static let ad_ASCIICharacterSet = usage(kHIDUsage_AD_ASCIICharacterSet)
    /// Static Flag
    static let ad_DataReadBack = usage(kHIDUsage_AD_DataReadBack)
    /// Static Flag
    static let ad_FontReadBack = usage(kHIDUsage_AD_FontReadBack)
    /// Logical Collection
    static let ad_DisplayControlReport = usage(kHIDUsage_AD_DisplayControlReport)
    /// Dynamic Flag
    static let ad_ClearDisplay = usage(kHIDUsage_AD_ClearDisplay)
    /// Dynamic Flag
    static let ad_DisplayEnable = usage(kHIDUsage_AD_DisplayEnable)
    /// Static Value
    static let ad_ScreenSaverDelay = usage(kHIDUsage_AD_ScreenSaverDelay)
    /// Dynamic Flag
    static let ad_ScreenSaverEnable = usage(kHIDUsage_AD_ScreenSaverEnable)
    /// Static Flag
    static let ad_VerticalScroll = usage(kHIDUsage_AD_VerticalScroll)
    /// Static Flag
    static let ad_HorizontalScroll = usage(kHIDUsage_AD_HorizontalScroll)
    /// Logical Collection
    static let ad_CharacterReport = usage(kHIDUsage_AD_CharacterReport)
    /// Dynamic Value
    static let ad_DisplayData = usage(kHIDUsage_AD_DisplayData)
    /// Logical Collection
    static let ad_DisplayStatus = usage(kHIDUsage_AD_DisplayStatus)
    /// Selector
    static let ad_StatNotReady = usage(kHIDUsage_AD_StatNotReady)
    /// Selector
    static let ad_StatReady = usage(kHIDUsage_AD_StatReady)
    /// Selector
    static let ad_ErrNotaloadablecharacter = usage(kHIDUsage_AD_ErrNotaloadablecharacter)
    /// Selector
    static let ad_ErrFontdatacannotberead = usage(kHIDUsage_AD_ErrFontdatacannotberead)
    /// Logical Collection
    static let ad_CursorPositionReport = usage(kHIDUsage_AD_CursorPositionReport)
    /// Dynamic Value
    static let ad_Row = usage(kHIDUsage_AD_Row)
    /// Dynamic Value
    static let ad_Column = usage(kHIDUsage_AD_Column)
    /// Static Value
    static let ad_Rows = usage(kHIDUsage_AD_Rows)
    /// Static Value
    static let ad_Columns = usage(kHIDUsage_AD_Columns)
    /// Static Flag
    static let ad_CursorPixelPositioning = usage(kHIDUsage_AD_CursorPixelPositioning)
    /// Dynamic Flag
    static let ad_CursorMode = usage(kHIDUsage_AD_CursorMode)
    /// Dynamic Flag
    static let ad_CursorEnable = usage(kHIDUsage_AD_CursorEnable)
    /// Dynamic Flag
    static let ad_CursorBlink = usage(kHIDUsage_AD_CursorBlink)
    /// Logical Collection
    static let ad_FontReport = usage(kHIDUsage_AD_FontReport)
    /// Buffered Byte
    static let ad_FontData = usage(kHIDUsage_AD_FontData)
    /// Static Value
    static let ad_CharacterWidth = usage(kHIDUsage_AD_CharacterWidth)
    /// Static Value
    static let ad_CharacterHeight = usage(kHIDUsage_AD_CharacterHeight)
    /// Static Value
    static let ad_CharacterSpacingHorizontal = usage(kHIDUsage_AD_CharacterSpacingHorizontal)
    /// Static Value
    static let ad_CharacterSpacingVertical = usage(kHIDUsage_AD_CharacterSpacingVertical)
    /// Static Flag
    static let ad_UnicodeCharacterSet = usage(kHIDUsage_AD_UnicodeCharacterSet)
    
    /// 0x42 - 0xFFFF Reserved
    static let ad_Reserved = usage(kHIDUsage_AD_Reserved)
}

/// Sensor Page (0x20)
/// The Sensor page is intended for use by devices that capture biometric,
/// electrical, environmental, light, location, mechanical, motion, orientation,
/// scanner, etc events.
public extension HIDUsage {
    static let snsr_Undefined = usage(kHIDUsage_Snsr_Undefined)
    /// Application/Physical Collection
    static let snsr_Sensor = usage(kHIDUsage_Snsr_Sensor)

    /* 0x02 - 0x0F Reserved */

    /// Application/Physical Collection
    static let snsr_Biometric = usage(kHIDUsage_Snsr_Biometric)
    /// Application/Physical Collection
    static let snsr_Biometric_HumanPresence = usage(kHIDUsage_Snsr_Biometric_HumanPresence)
    /// Application/Physical Collection
    static let snsr_Biometric_HumanProximity = usage(kHIDUsage_Snsr_Biometric_HumanProximity)
    /// Application/Physical Collection
    static let snsr_Biometric_HumanTouch = usage(kHIDUsage_Snsr_Biometric_HumanTouch)

    /* 0x14 - 0x1F Reserved */

    /// Application/Physical Collection
    static let snsr_Electrical = usage(kHIDUsage_Snsr_Electrical)
    /// Application/Physical Collection
    static let snsr_Electrical_Capacitance = usage(kHIDUsage_Snsr_Electrical_Capacitance)
    /// Application/Physical Collection
    static let snsr_Electrical_Current = usage(kHIDUsage_Snsr_Electrical_Current)
    /// Application/Physical Collection
    static let snsr_Electrical_Power = usage(kHIDUsage_Snsr_Electrical_Power)
    /// Application/Physical Collection
    static let snsr_Electrical_Inductance = usage(kHIDUsage_Snsr_Electrical_Inductance)
    /// Application/Physical Collection
    static let snsr_Electrical_Resistance = usage(kHIDUsage_Snsr_Electrical_Resistance)
    /// Application/Physical Collection
    static let snsr_Electrical_Voltage = usage(kHIDUsage_Snsr_Electrical_Voltage)
    /// Application/Physical Collection
    static let snsr_Electrical_Potentiometer = usage(kHIDUsage_Snsr_Electrical_Potentiometer)
    /// Application/Physical Collection
    static let snsr_Electrical_Frequency = usage(kHIDUsage_Snsr_Electrical_Frequency)
    /// Application/Physical Collection
    static let snsr_Electrical_Period = usage(kHIDUsage_Snsr_Electrical_Period)

    /* 0x2A - 0x2F Reserved */

    /// Application/Physical Collection
    static let snsr_Environmental = usage(kHIDUsage_Snsr_Environmental)
    /// Application/Physical Collection
    static let snsr_Environmental_AtmosphericPressure = usage(kHIDUsage_Snsr_Environmental_AtmosphericPressure)
    /// Application/Physical Collection
    static let snsr_Environmental_Humidity = usage(kHIDUsage_Snsr_Environmental_Humidity)
    /// Application/Physical Collection
    static let snsr_Environmental_Temperature = usage(kHIDUsage_Snsr_Environmental_Temperature)
    /// Application/Physical Collection
    static let snsr_Environmental_WindDirection = usage(kHIDUsage_Snsr_Environmental_WindDirection)
    /// Application/Physical Collection
    static let snsr_Environmental_WindSpeed = usage(kHIDUsage_Snsr_Environmental_WindSpeed)

    /* 0x36 - 0x3F Reserved */

    /// Application/Physical Collection
    static let snsr_Light = usage(kHIDUsage_Snsr_Light)
    /// Application/Physical Collection
    static let snsr_Light_AmbientLight = usage(kHIDUsage_Snsr_Light_AmbientLight)
    /// Application/Physical Collection
    static let snsr_Light_ConsumerInfrared = usage(kHIDUsage_Snsr_Light_ConsumerInfrared)

    /* 0x43 - 0x4F Reserved */

    /// Application/Physical Collection
    static let snsr_Location = usage(kHIDUsage_Snsr_Location)
    /// Application/Physical Collection
    static let snsr_Location_Broadcast = usage(kHIDUsage_Snsr_Location_Broadcast)
    /// Application/Physical Collection
    static let snsr_Location_DeadReckoning = usage(kHIDUsage_Snsr_Location_DeadReckoning)
    /// Application/Physical Collection
    static let snsr_Location_GPS = usage(kHIDUsage_Snsr_Location_GPS)
    /// Application/Physical Collection
    static let snsr_Location_Lookup = usage(kHIDUsage_Snsr_Location_Lookup)
    /// Application/Physical Collection
    static let snsr_Location_Other = usage(kHIDUsage_Snsr_Location_Other)
    /// Application/Physical Collection
    static let snsr_Location_Static = usage(kHIDUsage_Snsr_Location_Static)
    /// Application/Physical Collection
    static let snsr_Location_Triangulation = usage(kHIDUsage_Snsr_Location_Triangulation)

    /* 0x58 - 0x5F Reserved */

    /// Application/Physical Collection
    static let snsr_Mechanical = usage(kHIDUsage_Snsr_Mechanical)
    /// Application/Physical Collection
    static let snsr_Mechanical_BooleanSwitch = usage(kHIDUsage_Snsr_Mechanical_BooleanSwitch)
    /// Application/Physical Collection
    static let snsr_Mechanical_BooleanSwitchArray = usage(kHIDUsage_Snsr_Mechanical_BooleanSwitchArray)
    /// Application/Physical Collection
    static let snsr_Mechanical_MultivalueSwitch = usage(kHIDUsage_Snsr_Mechanical_MultivalueSwitch)
    /// Application/Physical Collection
    static let snsr_Mechanical_Force = usage(kHIDUsage_Snsr_Mechanical_Force)
    /// Application/Physical Collection
    static let snsr_Mechanical_Pressure = usage(kHIDUsage_Snsr_Mechanical_Pressure)
    /// Application/Physical Collection
    static let snsr_Mechanical_Strain = usage(kHIDUsage_Snsr_Mechanical_Strain)
    /// Application/Physical Collection
    static let snsr_Mechanical_Weight = usage(kHIDUsage_Snsr_Mechanical_Weight)
    /// Application/Physical Collection
    static let snsr_Mechanical_HapticVibrator = usage(kHIDUsage_Snsr_Mechanical_HapticVibrator)
    /// Application/Physical Collection
    static let snsr_Mechanical_HallEffectSwitch = usage(kHIDUsage_Snsr_Mechanical_HallEffectSwitch)

    /* 0x6A - 0x6F Reserved */

    /// Application/Physical Collection
    static let snsr_Motion = usage(kHIDUsage_Snsr_Motion)
    /// Application/Physical Collection
    static let snsr_Motion_Accelerometer1D = usage(kHIDUsage_Snsr_Motion_Accelerometer1D)
    /// Application/Physical Collection
    static let snsr_Motion_Accelerometer2D = usage(kHIDUsage_Snsr_Motion_Accelerometer2D)
    /// Application/Physical Collection
    static let snsr_Motion_Accelerometer3D = usage(kHIDUsage_Snsr_Motion_Accelerometer3D)
    /// Application/Physical Collection
    static let snsr_Motion_Gyrometer1D = usage(kHIDUsage_Snsr_Motion_Gyrometer1D)
    /// Application/Physical Collection
    static let snsr_Motion_Gyrometer2D = usage(kHIDUsage_Snsr_Motion_Gyrometer2D)
    /// Application/Physical Collection
    static let snsr_Motion_Gyrometer3D = usage(kHIDUsage_Snsr_Motion_Gyrometer3D)
    /// Application/Physical Collection
    static let snsr_Motion_MotionDetector = usage(kHIDUsage_Snsr_Motion_MotionDetector)
    /// Application/Physical Collection
    static let snsr_Motion_Speedometer = usage(kHIDUsage_Snsr_Motion_Speedometer)
    /// Application/Physical Collection
    static let snsr_Motion_Accelerometer = usage(kHIDUsage_Snsr_Motion_Accelerometer)
    /// Application/Physical Collection
    static let snsr_Motion_Gyrometer = usage(kHIDUsage_Snsr_Motion_Gyrometer)

    /* 0x7B - 0x7F Reserved */

    /// Application/Physical Collection
    static let snsr_Orientation = usage(kHIDUsage_Snsr_Orientation)
    /// Application/Physical Collection
    static let snsr_Orientation_Compass1D = usage(kHIDUsage_Snsr_Orientation_Compass1D)
    /// Application/Physical Collection
    static let snsr_Orientation_Compass2D = usage(kHIDUsage_Snsr_Orientation_Compass2D)
    /// Application/Physical Collection
    static let snsr_Orientation_Compass3D = usage(kHIDUsage_Snsr_Orientation_Compass3D)
    /// Application/Physical Collection
    static let snsr_Orientation_Inclinometer1D = usage(kHIDUsage_Snsr_Orientation_Inclinometer1D)
    /// Application/Physical Collection
    static let snsr_Orientation_Inclinometer2D = usage(kHIDUsage_Snsr_Orientation_Inclinometer2D)
    /// Application/Physical Collection
    static let snsr_Orientation_Inclinometer3D = usage(kHIDUsage_Snsr_Orientation_Inclinometer3D)
    /// Application/Physical Collection
    static let snsr_Orientation_Distance1D = usage(kHIDUsage_Snsr_Orientation_Distance1D)
    /// Application/Physical Collection
    static let snsr_Orientation_Distance2D = usage(kHIDUsage_Snsr_Orientation_Distance2D)
    /// Application/Physical Collection
    static let snsr_Orientation_Distance3D = usage(kHIDUsage_Snsr_Orientation_Distance3D)
    /// Application/Physical Collection
    static let snsr_Orientation_DeviceOrientation = usage(kHIDUsage_Snsr_Orientation_DeviceOrientation)
    /// Application/Physical Collection
    static let snsr_Orientation_CompassD = usage(kHIDUsage_Snsr_Orientation_CompassD)
    /// Application/Physical Collection
    static let snsr_Orientation_InclinometerD = usage(kHIDUsage_Snsr_Orientation_InclinometerD)
    /// Application/Physical Collection
    static let snsr_Orientation_DistanceD = usage(kHIDUsage_Snsr_Orientation_DistanceD)

    /* 0x8E - 0x8F Reserved */

    /// Application/Physical Collection
    static let snsr_Scanner = usage(kHIDUsage_Snsr_Scanner)
    /// Application/Physical Collection
    static let snsr_Scanner_Barcode = usage(kHIDUsage_Snsr_Scanner_Barcode)
    /// Application/Physical Collection
    static let snsr_Scanner_RFID = usage(kHIDUsage_Snsr_Scanner_RFID)
    /// Application/Physical Collection
    static let snsr_Scanner_NFC = usage(kHIDUsage_Snsr_Scanner_NFC)

    /* 0x94 - 0x9F Reserved */

    /// Application/Physical Collection
    static let snsr_Time = usage(kHIDUsage_Snsr_Time)
    /// Application/Physical Collection
    static let snsr_Time_AlarmTimer = usage(kHIDUsage_Snsr_Time_AlarmTimer)
    /// Application/Physical Collection
    static let snsr_Time_RealTimeClock = usage(kHIDUsage_Snsr_Time_RealTimeClock)

    /* 0xA3 - 0xDF Reserved */

    /// Application/Physical Collection
    static let snsr_Other = usage(kHIDUsage_Snsr_Other)
    /// Application/Physical Collection
    static let snsr_Other_Custom = usage(kHIDUsage_Snsr_Other_Custom)
    /// Application/Physical Collection
    static let snsr_Other_Generic = usage(kHIDUsage_Snsr_Other_Generic)
    /// Application/Physical Collection
    static let snsr_Other_GenericEnumerator = usage(kHIDUsage_Snsr_Other_GenericEnumerator)

    /* 0xE4 - 0xEF Reserved */



    /* 0xF0 - 0xFF Vendor Reserved */

    /* Common Sensor Type Data Fields */

    /* Usage Switches used in conjunction with other Data Usages. The value of the modifier is OR-ed in to the upper nibble of the 16bit Data Usage. */
    /// Data Field Usage Switch
    static let snsr_Modifier_None = usage(kHIDUsage_Snsr_Modifier_None)
    /// Data Field Usage Switch
    static let snsr_Modifier_ChangeSensitivityAbsolute = usage(kHIDUsage_Snsr_Modifier_ChangeSensitivityAbsolute)
    /// Data Field Usage Switch
    static let snsr_Modifier_Max = usage(kHIDUsage_Snsr_Modifier_Max)
    /// Data Field Usage Switch
    static let snsr_Modifier_Min = usage(kHIDUsage_Snsr_Modifier_Min)
    /// Data Field Usage Switch
    static let snsr_Modifier_Accuracy = usage(kHIDUsage_Snsr_Modifier_Accuracy)
    /// Data Field Usage Switch
    static let snsr_Modifier_Resolution = usage(kHIDUsage_Snsr_Modifier_Resolution)
    /// Data Field Usage Switch
    static let snsr_Modifier_ThresholdHigh = usage(kHIDUsage_Snsr_Modifier_ThresholdHigh)
    /// Data Field Usage Switch
    static let snsr_Modifier_ThresholdLow = usage(kHIDUsage_Snsr_Modifier_ThresholdLow)
    /// Data Field Usage Switch
    static let snsr_Modifier_CalibrationOffset = usage(kHIDUsage_Snsr_Modifier_CalibrationOffset)
    /// Data Field Usage Switch
    static let snsr_Modifier_CalibrationMultiplier = usage(kHIDUsage_Snsr_Modifier_CalibrationMultiplier)
    /// Data Field Usage Switch
    static let snsr_Modifier_ReportInterval = usage(kHIDUsage_Snsr_Modifier_ReportInterval)
    /// Data Field Usage Switch
    static let snsr_Modifier_FrequencyMax = usage(kHIDUsage_Snsr_Modifier_FrequencyMax)
    /// Data Field Usage Switch
    static let snsr_Modifier_PeriodMax = usage(kHIDUsage_Snsr_Modifier_PeriodMax)
    /// Data Field Usage Switch
    static let snsr_Modifier_ChangeSensitivityPercentRange = usage(kHIDUsage_Snsr_Modifier_ChangeSensitivityPercentRange)
    /// Data Field Usage Switch
    static let snsr_Modifier_ChangeSensitivityPercentRelative = usage(kHIDUsage_Snsr_Modifier_ChangeSensitivityPercentRelative)
    /// Data Field Usage Switch
    static let snsr_Modifier_VendorDefined = usage(kHIDUsage_Snsr_Modifier_VendorDefined)

    /* Event Usages */
    static let snsr_Event = usage(kHIDUsage_Snsr_Event)
    static let snsr_Event_SensorState = usage(kHIDUsage_Snsr_Event_SensorState)
    static let snsr_Event_SensorEvent = usage(kHIDUsage_Snsr_Event_SensorEvent)

    /* 0x0203 - 0x02FF Event Reserved */

    static let snsr_Event_SensorState_Undefined = usage(kHIDUsage_Snsr_Event_SensorState_Undefined)
    static let snsr_Event_SensorState_Ready = usage(kHIDUsage_Snsr_Event_SensorState_Ready)
    static let snsr_Event_SensorState_NotAvailable = usage(kHIDUsage_Snsr_Event_SensorState_NotAvailable)
    static let snsr_Event_SensorState_NoData = usage(kHIDUsage_Snsr_Event_SensorState_NoData)
    static let snsr_Event_SensorState_Initializing = usage(kHIDUsage_Snsr_Event_SensorState_Initializing)
    static let snsr_Event_SensorState_AccessDenied = usage(kHIDUsage_Snsr_Event_SensorState_AccessDenied)
    static let snsr_Event_SensorState_Error = usage(kHIDUsage_Snsr_Event_SensorState_Error)

    /* 0x0807 - 0x080F Reserved */

    static let snsr_Event_SensorEvent_Unknown = usage(kHIDUsage_Snsr_Event_SensorEvent_Unknown)
    static let snsr_Event_SensorEvent_StateChanged = usage(kHIDUsage_Snsr_Event_SensorEvent_StateChanged)
    static let snsr_Event_SensorEvent_PropertyChanged = usage(kHIDUsage_Snsr_Event_SensorEvent_PropertyChanged)
    static let snsr_Event_SensorEvent_DataUpdated = usage(kHIDUsage_Snsr_Event_SensorEvent_DataUpdated)
    static let snsr_Event_SensorEvent_PollResponse = usage(kHIDUsage_Snsr_Event_SensorEvent_PollResponse)
    static let snsr_Event_SensorEvent_ChangeSensitivity = usage(kHIDUsage_Snsr_Event_SensorEvent_ChangeSensitivity)
    static let snsr_Event_SensorEvent_RangeMaxReached = usage(kHIDUsage_Snsr_Event_SensorEvent_RangeMaxReached)
    static let snsr_Event_SensorEvent_RangeMinReached = usage(kHIDUsage_Snsr_Event_SensorEvent_RangeMinReached)
    static let snsr_Event_SensorEvent_HighThresholdCrossUp = usage(kHIDUsage_Snsr_Event_SensorEvent_HighThresholdCrossUp)
    static let snsr_Event_SensorEvent_HighThresholdCrossDown = usage(kHIDUsage_Snsr_Event_SensorEvent_HighThresholdCrossDown)
    static let snsr_Event_SensorEvent_LowThresholdCrossUp = usage(kHIDUsage_Snsr_Event_SensorEvent_LowThresholdCrossUp)
    static let snsr_Event_SensorEvent_LowThresholdCrossDown = usage(kHIDUsage_Snsr_Event_SensorEvent_LowThresholdCrossDown)
    static let snsr_Event_SensorEvent_ZeroThresholdCrossUp = usage(kHIDUsage_Snsr_Event_SensorEvent_ZeroThresholdCrossUp)
    static let snsr_Event_SensorEvent_ZeroThresholdCrossDown = usage(kHIDUsage_Snsr_Event_SensorEvent_ZeroThresholdCrossDown)
    static let snsr_Event_SensorEvent_PeriodExceeded = usage(kHIDUsage_Snsr_Event_SensorEvent_PeriodExceeded)
    static let snsr_Event_SensorEvent_FrequencyExceeded = usage(kHIDUsage_Snsr_Event_SensorEvent_FrequencyExceeded)
    static let snsr_Event_SensorEvent_ComplexTrigger = usage(kHIDUsage_Snsr_Event_SensorEvent_ComplexTrigger)

    /* 0x0821 - 0x082F Reserved */

    /* Property Usages */
    static let snsr_Property = usage(kHIDUsage_Snsr_Property)
    static let snsr_Property_FriendlyName = usage(kHIDUsage_Snsr_Property_FriendlyName)
    static let snsr_Property_PersistentUniqueID = usage(kHIDUsage_Snsr_Property_PersistentUniqueID)
    static let snsr_Property_SensorStatus = usage(kHIDUsage_Snsr_Property_SensorStatus)
    static let snsr_Property_MinimumReportInterval = usage(kHIDUsage_Snsr_Property_MinimumReportInterval)
    static let snsr_Property_Manufacturer = usage(kHIDUsage_Snsr_Property_Manufacturer)
    static let snsr_Property_Model = usage(kHIDUsage_Snsr_Property_Model)
    static let snsr_Property_SerialNumber = usage(kHIDUsage_Snsr_Property_SerialNumber)
    static let snsr_Property_Description = usage(kHIDUsage_Snsr_Property_Description)
    static let snsr_Property_ConnectionType = usage(kHIDUsage_Snsr_Property_ConnectionType)
    static let snsr_Property_DevicePath = usage(kHIDUsage_Snsr_Property_DevicePath)
    static let snsr_Property_HardwareRevision = usage(kHIDUsage_Snsr_Property_HardwareRevision)
    static let snsr_Property_FirmwareVersion = usage(kHIDUsage_Snsr_Property_FirmwareVersion)
    static let snsr_Property_ReleaseData = usage(kHIDUsage_Snsr_Property_ReleaseData)
    static let snsr_Property_ReportInterval = usage(kHIDUsage_Snsr_Property_ReportInterval)
    static let snsr_Property_ChangeSensitivityAbsolute = usage(kHIDUsage_Snsr_Property_ChangeSensitivityAbsolute)
    static let snsr_Property_ChangeSensitivityPercentRange = usage(kHIDUsage_Snsr_Property_ChangeSensitivityPercentRange)
    static let snsr_Property_ChangeSensitivityPercentRelative = usage(kHIDUsage_Snsr_Property_ChangeSensitivityPercentRelative)
    static let snsr_Property_Accuracy = usage(kHIDUsage_Snsr_Property_Accuracy)
    static let snsr_Property_Resolution = usage(kHIDUsage_Snsr_Property_Resolution)
    static let snsr_Property_Maximum = usage(kHIDUsage_Snsr_Property_Maximum)
    static let snsr_Property_Minimum = usage(kHIDUsage_Snsr_Property_Minimum)
    static let snsr_Property_ReportingState = usage(kHIDUsage_Snsr_Property_ReportingState)
    static let snsr_Property_SamplingRate = usage(kHIDUsage_Snsr_Property_SamplingRate)
    static let snsr_Property_ResponseCurve = usage(kHIDUsage_Snsr_Property_ResponseCurve)
    static let snsr_Property_PowerState = usage(kHIDUsage_Snsr_Property_PowerState)
    static let snsr_Property_MaxFIFOEvents = usage(kHIDUsage_Snsr_Property_MaxFIFOEvents)
    static let snsr_Property_ReportLatency = usage(kHIDUsage_Snsr_Property_ReportLatency)

    /* 0x031C - 0x03FF Reserved */

    static let snsr_Property_ConnectionType_Integrated = usage(kHIDUsage_Snsr_Property_ConnectionType_Integrated)
    static let snsr_Property_ConnectionType_Attached = usage(kHIDUsage_Snsr_Property_ConnectionType_Attached)
    static let snsr_Property_ConnectionType_External = usage(kHIDUsage_Snsr_Property_ConnectionType_External)

    /* 0x0833 - 0x083F Reserved */

    static let snsr_Property_ReportingState_NoEvents = usage(kHIDUsage_Snsr_Property_ReportingState_NoEvents)
    static let snsr_Property_ReportingState_AllEvents = usage(kHIDUsage_Snsr_Property_ReportingState_AllEvents)
    static let snsr_Property_ReportingState_ThresholdEvents = usage(kHIDUsage_Snsr_Property_ReportingState_ThresholdEvents)
    static let snsr_Property_ReportingState_WakeNoEvents = usage(kHIDUsage_Snsr_Property_ReportingState_WakeNoEvents)
    static let snsr_Property_ReportingState_WakeAllEvents = usage(kHIDUsage_Snsr_Property_ReportingState_WakeAllEvents)
    static let snsr_Property_ReportingState_WakeThresholdEvents = usage(kHIDUsage_Snsr_Property_ReportingState_WakeThresholdEvents)

    /* 0x0846 - 0x084F Reserved */

    static let snsr_Property_PowerState_Undefined = usage(kHIDUsage_Snsr_Property_PowerState_Undefined)
    static let snsr_Property_PowerState_D0_FullPower = usage(kHIDUsage_Snsr_Property_PowerState_D0_FullPower)
    static let snsr_Property_PowerState_D1_LowPower = usage(kHIDUsage_Snsr_Property_PowerState_D1_LowPower)
    static let snsr_Property_PowerState_D2_Standby = usage(kHIDUsage_Snsr_Property_PowerState_D2_Standby)
    static let snsr_Property_PowerState_D3_Sleep = usage(kHIDUsage_Snsr_Property_PowerState_D3_Sleep)
    static let snsr_Property_PowerState_D4_PowerOff = usage(kHIDUsage_Snsr_Property_PowerState_D4_PowerOff)

    /* 0x0855 - 0x085F Reserved */

    static let snsr_Light_Illuminance = usage(kHIDUsage_Snsr_Light_Illuminance)

    /* Specific Sensor Type Data Fields */

    /* Location Sensor Data Fields */
    static let snsr_Data_Location = usage(kHIDUsage_Snsr_Data_Location)
    static let snsr_Data_Location_Reserved = usage(kHIDUsage_Snsr_Data_Location_Reserved)
    static let snsr_Data_Location_AltitudeAntennaSeaLevel = usage(kHIDUsage_Snsr_Data_Location_AltitudeAntennaSeaLevel)
    static let snsr_Data_Location_DifferentialReferenceStationID = usage(kHIDUsage_Snsr_Data_Location_DifferentialReferenceStationID)
    static let snsr_Data_Location_AltitudeEllipsoidError = usage(kHIDUsage_Snsr_Data_Location_AltitudeEllipsoidError)
    static let snsr_Data_Location_AltitudeEllipsoid = usage(kHIDUsage_Snsr_Data_Location_AltitudeEllipsoid)
    static let snsr_Data_Location_AltitudeSeaLevelError = usage(kHIDUsage_Snsr_Data_Location_AltitudeSeaLevelError)
    static let snsr_Data_Location_AltitudeSeaLevel = usage(kHIDUsage_Snsr_Data_Location_AltitudeSeaLevel)
    static let snsr_Data_Location_DifferentialGPSDataAge = usage(kHIDUsage_Snsr_Data_Location_DifferentialGPSDataAge)
    static let snsr_Data_Location_ErrorRadius = usage(kHIDUsage_Snsr_Data_Location_ErrorRadius)

    static let snsr_Data_Location_FixQuality = usage(kHIDUsage_Snsr_Data_Location_FixQuality)
    static let snsr_Data_Location_FixQualityNoFix = usage(kHIDUsage_Snsr_Data_Location_FixQualityNoFix)
    static let snsr_Data_Location_FixQualityGPS = usage(kHIDUsage_Snsr_Data_Location_FixQualityGPS)
    static let snsr_Data_Location_FixQualityDGPS = usage(kHIDUsage_Snsr_Data_Location_FixQualityDGPS)

    static let snsr_Data_Location_FixType = usage(kHIDUsage_Snsr_Data_Location_FixType)
    static let snsr_Data_Location_FixTypeNoFix = usage(kHIDUsage_Snsr_Data_Location_FixTypeNoFix)
    static let snsr_Data_Location_FixTypeGPSSPSMode = usage(kHIDUsage_Snsr_Data_Location_FixTypeGPSSPSMode)
    static let snsr_Data_Location_FixTypeDGPSSPSMode = usage(kHIDUsage_Snsr_Data_Location_FixTypeDGPSSPSMode)
    static let snsr_Data_Location_FixTypeGPSPPSMode = usage(kHIDUsage_Snsr_Data_Location_FixTypeGPSPPSMode)
    static let snsr_Data_Location_FixTypeRealTimeKinematic = usage(kHIDUsage_Snsr_Data_Location_FixTypeRealTimeKinematic)
    static let snsr_Data_Location_FixTypeFloatRTK = usage(kHIDUsage_Snsr_Data_Location_FixTypeFloatRTK)
    static let snsr_Data_Location_FixTypeEstimated = usage(kHIDUsage_Snsr_Data_Location_FixTypeEstimated)
    static let snsr_Data_Location_FixTypeManualInputMode = usage(kHIDUsage_Snsr_Data_Location_FixTypeManualInputMode)
    static let snsr_Data_Location_FixTypeSimulatorMode = usage(kHIDUsage_Snsr_Data_Location_FixTypeSimulatorMode)

    static let snsr_Data_Location_GeoidalSeparation = usage(kHIDUsage_Snsr_Data_Location_GeoidalSeparation)

    static let snsr_Data_Location_GPSOperationMode = usage(kHIDUsage_Snsr_Data_Location_GPSOperationMode)
    static let snsr_Data_Location_GPSOperationModeManual = usage(kHIDUsage_Snsr_Data_Location_GPSOperationModeManual)
    static let snsr_Data_Location_GPSOperationModeAutomatic = usage(kHIDUsage_Snsr_Data_Location_GPSOperationModeAutomatic)

    static let snsr_Data_Location_GPSSelectionMode = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionMode)
    static let snsr_Data_Location_GPSSelectionModeAutonomous = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeAutonomous)
    static let snsr_Data_Location_GPSSelectionModeDGPS = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeDGPS)
    static let snsr_Data_Location_GPSSelectionModeEstimated = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeEstimated)
    static let snsr_Data_Location_GPSSelectionModeManualInput = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeManualInput)
    static let snsr_Data_Location_GPSSelectionModeSimulator = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeSimulator)
    static let snsr_Data_Location_GPSSelectionModeDataNotValid = usage(kHIDUsage_Snsr_Data_Location_GPSSelectionModeDataNotValid)

    static let snsr_Data_Location_GPSStatus = usage(kHIDUsage_Snsr_Data_Location_GPSStatus)
    static let snsr_Data_Location_GPSStatusDataValid = usage(kHIDUsage_Snsr_Data_Location_GPSStatusDataValid)
    static let snsr_Data_Location_GPSStatusDataNotValid = usage(kHIDUsage_Snsr_Data_Location_GPSStatusDataNotValid)

    static let snsr_Data_Location_PositionDilutionOfPrecision = usage(kHIDUsage_Snsr_Data_Location_PositionDilutionOfPrecision)
    static let snsr_Data_Location_HorizontalDilutionOfPrecision = usage(kHIDUsage_Snsr_Data_Location_HorizontalDilutionOfPrecision)
    static let snsr_Data_Location_VerticalDilutionOfPrecision = usage(kHIDUsage_Snsr_Data_Location_VerticalDilutionOfPrecision)
    static let snsr_Data_Location_Latitude = usage(kHIDUsage_Snsr_Data_Location_Latitude)
    static let snsr_Data_Location_Longitude = usage(kHIDUsage_Snsr_Data_Location_Longitude)
    static let snsr_Data_Location_TrueHeading = usage(kHIDUsage_Snsr_Data_Location_TrueHeading)
    static let snsr_Data_Location_MagneticHeading = usage(kHIDUsage_Snsr_Data_Location_MagneticHeading)
    static let snsr_Data_Location_MagneticVariation = usage(kHIDUsage_Snsr_Data_Location_MagneticVariation)
    static let snsr_Data_Location_Speed = usage(kHIDUsage_Snsr_Data_Location_Speed)
    static let snsr_Data_Location_SatellitesInView = usage(kHIDUsage_Snsr_Data_Location_SatellitesInView)
    static let snsr_Data_Location_SatellitesInViewAzimuth = usage(kHIDUsage_Snsr_Data_Location_SatellitesInViewAzimuth)
    static let snsr_Data_Location_SatellitesInViewElevation = usage(kHIDUsage_Snsr_Data_Location_SatellitesInViewElevation)
    static let snsr_Data_Location_SatellitesInViewIDs = usage(kHIDUsage_Snsr_Data_Location_SatellitesInViewIDs)
    static let snsr_Data_Location_SatellitesInViewPRNs = usage(kHIDUsage_Snsr_Data_Location_SatellitesInViewPRNs)
    static let snsr_Data_Location_SatellitesInViewSNRatios = usage(kHIDUsage_Snsr_Data_Location_SatellitesInViewSNRatios)
    static let snsr_Data_Location_SatellitesUsedCount = usage(kHIDUsage_Snsr_Data_Location_SatellitesUsedCount)
    static let snsr_Data_Location_SatellitesUsedPRNs = usage(kHIDUsage_Snsr_Data_Location_SatellitesUsedPRNs)
    static let snsr_Data_Location_NMEASentence = usage(kHIDUsage_Snsr_Data_Location_NMEASentence)
    static let snsr_Data_Location_AddressLine1 = usage(kHIDUsage_Snsr_Data_Location_AddressLine1)
    static let snsr_Data_Location_AddressLine2 = usage(kHIDUsage_Snsr_Data_Location_AddressLine2)
    static let snsr_Data_Location_City = usage(kHIDUsage_Snsr_Data_Location_City)
    static let snsr_Data_Location_StateOrProvince = usage(kHIDUsage_Snsr_Data_Location_StateOrProvince)
    static let snsr_Data_Location_CountryOrRegion = usage(kHIDUsage_Snsr_Data_Location_CountryOrRegion)
    static let snsr_Data_Location_PostalCode = usage(kHIDUsage_Snsr_Data_Location_PostalCode)

    /* 0x0428 - 0x0429 Reserved */

    /* Location Sensor Properties */
    static let snsr_Property_Location = usage(kHIDUsage_Snsr_Property_Location)
    static let snsr_Property_Location_DesiredAccuracy = usage(kHIDUsage_Snsr_Property_Location_DesiredAccuracy)
    static let snsr_Property_Location_AccuracyDefault = usage(kHIDUsage_Snsr_Property_Location_AccuracyDefault)
    static let snsr_Property_Location_AccuracyHigh = usage(kHIDUsage_Snsr_Property_Location_AccuracyHigh)
    static let snsr_Property_Location_AccuracyMedium = usage(kHIDUsage_Snsr_Property_Location_AccuracyMedium)
    static let snsr_Property_Location_AccuracyLow = usage(kHIDUsage_Snsr_Property_Location_AccuracyLow)

    /* 0x042C - 0x042F Reserved */

    /* Environmental Sensor Data Fields */
    static let snsr_Data_Environmental = usage(kHIDUsage_Snsr_Data_Environmental)
    static let snsr_Data_Environmental_AtmosphericPressure = usage(kHIDUsage_Snsr_Data_Environmental_AtmosphericPressure)
    static let snsr_Data_Environmental_Reserved = usage(kHIDUsage_Snsr_Data_Environmental_Reserved)
    static let snsr_Data_Environmental_RelativeHumidity = usage(kHIDUsage_Snsr_Data_Environmental_RelativeHumidity)
    static let snsr_Data_Environmental_Temperature = usage(kHIDUsage_Snsr_Data_Environmental_Temperature)
    static let snsr_Data_Environmental_WindDirection = usage(kHIDUsage_Snsr_Data_Environmental_WindDirection)
    static let snsr_Data_Environmental_WindSpeed = usage(kHIDUsage_Snsr_Data_Environmental_WindSpeed)

    /* 0x0437 - 0x043F Reserved */

    /* Environmental Sensor Properties */
    static let snsr_Property_Environmental = usage(kHIDUsage_Snsr_Property_Environmental)
    static let snsr_Property_Environmental_ReferencePressure = usage(kHIDUsage_Snsr_Property_Environmental_ReferencePressure)

    /* 0x0442 - 0x044F Reserved */

    /* Motion Sensor Data Fields */
    static let snsr_Data_Motion = usage(kHIDUsage_Snsr_Data_Motion)
    static let snsr_Data_Motion_State = usage(kHIDUsage_Snsr_Data_Motion_State)
    static let snsr_Data_Motion_Acceleration = usage(kHIDUsage_Snsr_Data_Motion_Acceleration)
    static let snsr_Data_Motion_AccelerationAxisX = usage(kHIDUsage_Snsr_Data_Motion_AccelerationAxisX)
    static let snsr_Data_Motion_AccelerationAxisY = usage(kHIDUsage_Snsr_Data_Motion_AccelerationAxisY)
    static let snsr_Data_Motion_AccelerationAxisZ = usage(kHIDUsage_Snsr_Data_Motion_AccelerationAxisZ)
    static let snsr_Data_Motion_AngularVelocity = usage(kHIDUsage_Snsr_Data_Motion_AngularVelocity)
    static let snsr_Data_Motion_AngularVelocityXAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularVelocityXAxis)
    static let snsr_Data_Motion_AngularVelocityYAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularVelocityYAxis)
    static let snsr_Data_Motion_AngularVelocityZAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularVelocityZAxis)
    static let snsr_Data_Motion_AngularPosition = usage(kHIDUsage_Snsr_Data_Motion_AngularPosition)
    static let snsr_Data_Motion_AngularPositionXAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularPositionXAxis)
    static let snsr_Data_Motion_AngularPositionYAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularPositionYAxis)
    static let snsr_Data_Motion_AngularPositionZAxis = usage(kHIDUsage_Snsr_Data_Motion_AngularPositionZAxis)
    static let snsr_Data_Motion_Speed = usage(kHIDUsage_Snsr_Data_Motion_Speed)
    static let snsr_Data_Motion_Intensity = usage(kHIDUsage_Snsr_Data_Motion_Intensity)

    /* 0x0460 - 0x046F Reserved */

    /* Orientation Sensor Data Fields */
    static let snsr_Data_Orientation = usage(kHIDUsage_Snsr_Data_Orientation)
    static let snsr_Data_Orientation_Heading = usage(kHIDUsage_Snsr_Data_Orientation_Heading)
    static let snsr_Data_Orientation_HeadingXAxis = usage(kHIDUsage_Snsr_Data_Orientation_HeadingXAxis)
    static let snsr_Data_Orientation_HeadingYAxis = usage(kHIDUsage_Snsr_Data_Orientation_HeadingYAxis)
    static let snsr_Data_Orientation_HeadingZAxis = usage(kHIDUsage_Snsr_Data_Orientation_HeadingZAxis)
    static let snsr_Data_Orientation_HeadingCompensatedMagneticNorth = usage(kHIDUsage_Snsr_Data_Orientation_HeadingCompensatedMagneticNorth)
    static let snsr_Data_Orientation_HeadingCompensatedTrueNorth = usage(kHIDUsage_Snsr_Data_Orientation_HeadingCompensatedTrueNorth)
    static let snsr_Data_Orientation_HeadingMagneticNorth = usage(kHIDUsage_Snsr_Data_Orientation_HeadingMagneticNorth)
    static let snsr_Data_Orientation_HeadingTrueNorth = usage(kHIDUsage_Snsr_Data_Orientation_HeadingTrueNorth)
    static let snsr_Data_Orientation_Distance = usage(kHIDUsage_Snsr_Data_Orientation_Distance)
    static let snsr_Data_Orientation_DistanceXAxis = usage(kHIDUsage_Snsr_Data_Orientation_DistanceXAxis)
    static let snsr_Data_Orientation_DistanceYAxis = usage(kHIDUsage_Snsr_Data_Orientation_DistanceYAxis)
    static let snsr_Data_Orientation_DistanceZAxis = usage(kHIDUsage_Snsr_Data_Orientation_DistanceZAxis)
    static let snsr_Data_Orientation_DistanceOutOfRange = usage(kHIDUsage_Snsr_Data_Orientation_DistanceOutOfRange)
    static let snsr_Data_Orientation_Tilt = usage(kHIDUsage_Snsr_Data_Orientation_Tilt)
    static let snsr_Data_Orientation_TiltXAxis = usage(kHIDUsage_Snsr_Data_Orientation_TiltXAxis)
    static let snsr_Data_Orientation_TiltYAxis = usage(kHIDUsage_Snsr_Data_Orientation_TiltYAxis)
    static let snsr_Data_Orientation_TiltZAxis = usage(kHIDUsage_Snsr_Data_Orientation_TiltZAxis)
    static let snsr_Data_Orientation_RotationMatrix = usage(kHIDUsage_Snsr_Data_Orientation_RotationMatrix)
    static let snsr_Data_Orientation_Quaternion = usage(kHIDUsage_Snsr_Data_Orientation_Quaternion)
    static let snsr_Data_Orientation_MagneticFlux = usage(kHIDUsage_Snsr_Data_Orientation_MagneticFlux)
    static let snsr_Data_Orientation_MagneticFluxXAxis = usage(kHIDUsage_Snsr_Data_Orientation_MagneticFluxXAxis)
    static let snsr_Data_Orientation_MagneticFluxYAxis = usage(kHIDUsage_Snsr_Data_Orientation_MagneticFluxYAxis)
    static let snsr_Data_Orientation_MagneticFluxZAxis = usage(kHIDUsage_Snsr_Data_Orientation_MagneticFluxZAxis)

    /* 0x0488 - 0x048F Reserved */

    /* Mechanical Sensor Data Field */
    static let snsr_Data_Mechanical = usage(kHIDUsage_Snsr_Data_Mechanical)
    static let snsr_Data_Mechanical_BooleanSwitchState = usage(kHIDUsage_Snsr_Data_Mechanical_BooleanSwitchState)
    static let snsr_Data_Mechanical_BooleanSwitchArrayStates = usage(kHIDUsage_Snsr_Data_Mechanical_BooleanSwitchArrayStates)
    static let snsr_Data_Mechanical_MultivalueSwitchValue = usage(kHIDUsage_Snsr_Data_Mechanical_MultivalueSwitchValue)
    static let snsr_Data_Mechanical_Force = usage(kHIDUsage_Snsr_Data_Mechanical_Force)
    static let snsr_Data_Mechanical_AbsolutePressure = usage(kHIDUsage_Snsr_Data_Mechanical_AbsolutePressure)
    static let snsr_Data_Mechanical_GaugePressure = usage(kHIDUsage_Snsr_Data_Mechanical_GaugePressure)
    static let snsr_Data_Mechanical_Strain = usage(kHIDUsage_Snsr_Data_Mechanical_Strain)
    static let snsr_Data_Mechanical_Weight = usage(kHIDUsage_Snsr_Data_Mechanical_Weight)

    /* 0x0499 - 0x49F Reserved */

    /* Mechanical Sensor Properties */
    static let snsr_Property_Mechanical = usage(kHIDUsage_Snsr_Property_Mechanical)
    static let snsr_Property_Mechanical_VibrationState = usage(kHIDUsage_Snsr_Property_Mechanical_VibrationState)
    static let snsr_Property_Mechanical_ForwardVibrationSpeed = usage(kHIDUsage_Snsr_Property_Mechanical_ForwardVibrationSpeed)
    static let snsr_Property_Mechanical_BackwardVibrationSpeed = usage(kHIDUsage_Snsr_Property_Mechanical_BackwardVibrationSpeed)

    /* 0x04A4 - 0x04AF Reserved */

    /* Biometric Sensor Data Fields */
    static let snsr_Data_Biometric = usage(kHIDUsage_Snsr_Data_Biometric)
    static let snsr_Data_Biometric_HumanPresence = usage(kHIDUsage_Snsr_Data_Biometric_HumanPresence)
    static let snsr_Data_Biometric_HumanProximityRange = usage(kHIDUsage_Snsr_Data_Biometric_HumanProximityRange)
    static let snsr_Data_Biometric_HumanProximityOutOfRange = usage(kHIDUsage_Snsr_Data_Biometric_HumanProximityOutOfRange)
    static let snsr_Data_Biometric_HumanTouchState = usage(kHIDUsage_Snsr_Data_Biometric_HumanTouchState)

    /* 0x04B5 - 0x04CF Reserved */

    /* Light Sensor Data Fields */
    static let snsr_Data_Light = usage(kHIDUsage_Snsr_Data_Light)
    static let snsr_Data_Light_Illuminance = usage(kHIDUsage_Snsr_Data_Light_Illuminance)
    static let snsr_Data_Light_ColorTemperature = usage(kHIDUsage_Snsr_Data_Light_ColorTemperature)
    static let snsr_Data_Light_Chromaticity = usage(kHIDUsage_Snsr_Data_Light_Chromaticity)
    static let snsr_Data_Light_ChromaticityX = usage(kHIDUsage_Snsr_Data_Light_ChromaticityX)
    static let snsr_Data_Light_ChromaticityY = usage(kHIDUsage_Snsr_Data_Light_ChromaticityY)
    static let snsr_Data_Light_ConsumerIRSentenceReceive = usage(kHIDUsage_Snsr_Data_Light_ConsumerIRSentenceReceive)

    /* 0x04D7 - 0x04DF Reserved */

    /* Light Sensor Properties */
    static let snsr_Property_Light = usage(kHIDUsage_Snsr_Property_Light)
    static let snsr_Property_Light_ConsumerIRSentenceSend = usage(kHIDUsage_Snsr_Property_Light_ConsumerIRSentenceSend)

    /* 0x04E2 - 0x04EF Reserved */

    /* Scanner Sensor Data Fields */
    static let snsr_Data_Scanner = usage(kHIDUsage_Snsr_Data_Scanner)
    static let snsr_Data_Scanner_RFIDTag40Bit = usage(kHIDUsage_Snsr_Data_Scanner_RFIDTag40Bit)
    static let snsr_Data_Scanner_NFCSentenceReceive = usage(kHIDUsage_Snsr_Data_Scanner_NFCSentenceReceive)

    /* 0x04F3 - 0x04F7 Reserved */

    /* Scanner Sensor Properties */
    static let snsr_Property_Scanner = usage(kHIDUsage_Snsr_Property_Scanner)
    static let snsr_Property_Scanner_NFCSentenceSend = usage(kHIDUsage_Snsr_Property_Scanner_NFCSentenceSend)

    /* 0x04FA - 0x04FF Reserved */

    /* Electrical Sensor Data Fields */
    static let snsr_Data_Electrical = usage(kHIDUsage_Snsr_Data_Electrical)
    static let snsr_Data_Electrical_Capacitance = usage(kHIDUsage_Snsr_Data_Electrical_Capacitance)
    static let snsr_Data_Electrical_Current = usage(kHIDUsage_Snsr_Data_Electrical_Current)
    static let snsr_Data_Electrical_ElectricalPower = usage(kHIDUsage_Snsr_Data_Electrical_ElectricalPower)
    static let snsr_Data_Electrical_Inductance = usage(kHIDUsage_Snsr_Data_Electrical_Inductance)
    static let snsr_Data_Electrical_Resistance = usage(kHIDUsage_Snsr_Data_Electrical_Resistance)
    static let snsr_Data_Electrical_Voltage = usage(kHIDUsage_Snsr_Data_Electrical_Voltage)
    static let snsr_Data_Electrical_Frequency = usage(kHIDUsage_Snsr_Data_Electrical_Frequency)
    static let snsr_Data_Electrical_Period = usage(kHIDUsage_Snsr_Data_Electrical_Period)
    static let snsr_Data_Electrical_PercentOfRange = usage(kHIDUsage_Snsr_Data_Electrical_PercentOfRange)

    /* 0x050A - 0x051F Reserved */

    /* Time Sensor Data Fields */
    static let snsr_Data_Time = usage(kHIDUsage_Snsr_Data_Time)
    static let snsr_Data_Time_Year = usage(kHIDUsage_Snsr_Data_Time_Year)
    static let snsr_Data_Time_Month = usage(kHIDUsage_Snsr_Data_Time_Month)
    static let snsr_Data_Time_Day = usage(kHIDUsage_Snsr_Data_Time_Day)

    static let snsr_Data_Time_DayOfWeek = usage(kHIDUsage_Snsr_Data_Time_DayOfWeek)
    static let snsr_Data_Time_DayOfWeekSunday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekSunday)
    static let snsr_Data_Time_DayOfWeekMonday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekMonday)
    static let snsr_Data_Time_DayOfWeekTuesday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekTuesday)
    static let snsr_Data_Time_DayOfWeekWednesday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekWednesday)
    static let snsr_Data_Time_DayOfWeekThursday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekThursday)
    static let snsr_Data_Time_DayOfWeekFriday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekFriday)
    static let snsr_Data_Time_DayOfWeekSaturday = usage(kHIDUsage_Snsr_Data_Time_DayOfWeekSaturday)

    static let snsr_Data_Time_Hour = usage(kHIDUsage_Snsr_Data_Time_Hour)
    static let snsr_Data_Time_Minute = usage(kHIDUsage_Snsr_Data_Time_Minute)
    static let snsr_Data_Time_Second = usage(kHIDUsage_Snsr_Data_Time_Second)
    static let snsr_Data_Time_Millisecond = usage(kHIDUsage_Snsr_Data_Time_Millisecond)
    static let snsr_Data_Time_Timestamp = usage(kHIDUsage_Snsr_Data_Time_Timestamp)
    static let snsr_Data_Time_JulianDayOfYear = usage(kHIDUsage_Snsr_Data_Time_JulianDayOfYear)

    /* 0x052B - 0x052F Reserved */

    /* Time Sensor Properties */
    static let snsr_Property_Time = usage(kHIDUsage_Snsr_Property_Time)
    static let snsr_Property_Time_TimeZoneOffsetFromUTC = usage(kHIDUsage_Snsr_Property_Time_TimeZoneOffsetFromUTC)
    static let snsr_Property_Time_TimeZoneName = usage(kHIDUsage_Snsr_Property_Time_TimeZoneName)
    static let snsr_Property_Time_DaylightSavingsTimeObserved = usage(kHIDUsage_Snsr_Property_Time_DaylightSavingsTimeObserved)
    static let snsr_Property_Time_TimeTrimAdjustment = usage(kHIDUsage_Snsr_Property_Time_TimeTrimAdjustment)
    static let snsr_Property_Time_ArmAlarm = usage(kHIDUsage_Snsr_Property_Time_ArmAlarm)

    /* 0x0536 - 0x053F Reserved */

    /* Custom Sensor Data Fields */
    static let snsr_Data_Custom = usage(kHIDUsage_Snsr_Data_Custom)
    static let snsr_Data_Custom_Usage = usage(kHIDUsage_Snsr_Data_Custom_Usage)
    static let snsr_Data_Custom_BooleanArray = usage(kHIDUsage_Snsr_Data_Custom_BooleanArray)
    static let snsr_Data_Custom_Value = usage(kHIDUsage_Snsr_Data_Custom_Value)
    static let snsr_Data_Custom_Value1 = usage(kHIDUsage_Snsr_Data_Custom_Value1)
    static let snsr_Data_Custom_Value2 = usage(kHIDUsage_Snsr_Data_Custom_Value2)
    static let snsr_Data_Custom_Value3 = usage(kHIDUsage_Snsr_Data_Custom_Value3)
    static let snsr_Data_Custom_Value4 = usage(kHIDUsage_Snsr_Data_Custom_Value4)
    static let snsr_Data_Custom_Value5 = usage(kHIDUsage_Snsr_Data_Custom_Value5)
    static let snsr_Data_Custom_Value6 = usage(kHIDUsage_Snsr_Data_Custom_Value6)

    /* 0x054A - 0x055F Reserved */
}

/// Power Device Page (0x84)
///
/// This section provides detailed descriptions of the usages employed by Power
/// Devices.
public extension HIDUsage {
    /// Power Device Undefined Usage
    static let pd_Undefined = usage(kHIDUsage_PD_Undefined)
    /// CL- Power Device Name Index
    static let pd_iName = usage(kHIDUsage_PD_iName)
    /// CL- Power Device Present Status
    static let pd_PresentStatus = usage(kHIDUsage_PD_PresentStatus)
    /// CA- Power Device Changed Status
    static let pd_ChangedStatus = usage(kHIDUsage_PD_ChangedStatus)
    /// CA- Uninterruptible Power Supply
    static let pd_UPS = usage(kHIDUsage_PD_UPS)
    /// CA- Power Supply
    static let pd_PowerSupply = usage(kHIDUsage_PD_PowerSupply)
    /// CA- Perpheral Device
    static let pd_PeripheralDevice = usage(kHIDUsage_PD_PeripheralDevice)
    /* Reserved 0x07 - 0x0F */
    /// CP- Battery System power module
    static let pd_BatterySystem = usage(kHIDUsage_PD_BatterySystem)
    /// SV IF- Battery System ID
    static let pd_BatterySystemID = usage(kHIDUsage_PD_BatterySystemID)
    /// CP- Battery
    static let pd_Battery = usage(kHIDUsage_PD_Battery)
    /// SV IF- Battery ID
    static let pd_BatteryID = usage(kHIDUsage_PD_BatteryID)
    /// CP- Charger
    static let pd_Charger = usage(kHIDUsage_PD_Charger)
    /// SV IF- Charger ID
    static let pd_ChargerID = usage(kHIDUsage_PD_ChargerID)
    /// CP- Power Converter power module
    static let pd_PowerConverter = usage(kHIDUsage_PD_PowerConverter)
    /// SV IF- Power Converter ID
    static let pd_PowerConverterID = usage(kHIDUsage_PD_PowerConverterID)
    /// CP- Outlet System power module
    static let pd_OutletSystem = usage(kHIDUsage_PD_OutletSystem)
    /// SV IF-Outlet System ID
    static let pd_OutletSystemID = usage(kHIDUsage_PD_OutletSystemID)
    /// CP- Power Device Input
    static let pd_Input = usage(kHIDUsage_PD_Input)
    /// SV IF- Power Device Input ID
    static let pd_InputID = usage(kHIDUsage_PD_InputID)
    /// CP- Power Device Output
    static let pd_Output = usage(kHIDUsage_PD_Output)
    /// SV IF- Power Device Output ID
    static let pd_OutputID = usage(kHIDUsage_PD_OutputID)
    /// CP- Power Device Flow
    static let pd_Flow = usage(kHIDUsage_PD_Flow)
    /// Item IF- Power Device Flow ID
    static let pd_FlowID = usage(kHIDUsage_PD_FlowID)
    /// CP- Power Device Outlet
    static let pd_Outlet = usage(kHIDUsage_PD_Outlet)
    /// SV IF- Power Device Outlet ID
    static let pd_OutletID = usage(kHIDUsage_PD_OutletID)
    /// CL/CP- Power Device Gang
    static let pd_Gang = usage(kHIDUsage_PD_Gang)
    /// SV IF- Power Device Gang ID
    static let pd_GangID = usage(kHIDUsage_PD_GangID)
    /// CL/CP- Power Device Power Summary
    static let pd_PowerSummary = usage(kHIDUsage_PD_PowerSummary)
    /// SV IF- Power Device Power Summary ID
    static let pd_PowerSummaryID = usage(kHIDUsage_PD_PowerSummaryID)
    /* Reserved 0x26 - 0x2F */
    /// DV IF- Power Device Voltage
    static let pd_Voltage = usage(kHIDUsage_PD_Voltage)
    /// DV IF- Power Device Current
    static let pd_Current = usage(kHIDUsage_PD_Current)
    /// DV IF- Power Device Frequency
    static let pd_Frequency = usage(kHIDUsage_PD_Frequency)
    /// DV IF- Power Device Apparent Power
    static let pd_ApparentPower = usage(kHIDUsage_PD_ApparentPower)
    /// DV IF- Power Device RMS Power
    static let pd_ActivePower = usage(kHIDUsage_PD_ActivePower)
    /// DV IF- Power Device Percent Load
    static let pd_PercentLoad = usage(kHIDUsage_PD_PercentLoad)
    /// DV IF- Power Device Temperature
    static let pd_Temperature = usage(kHIDUsage_PD_Temperature)
    /// DV IF- Power Device Humidity
    static let pd_Humidity = usage(kHIDUsage_PD_Humidity)
    /// DV IF- Power Device Bad Condition Count
    static let pd_BadCount = usage(kHIDUsage_PD_BadCount)
    /* Reserved 0x39 - 0x3F */
    /// SV/DV F- Power Device Nominal Voltage
    static let pd_ConfigVoltage = usage(kHIDUsage_PD_ConfigVoltage)
    /// SV/DV F- Power Device Nominal Current
    static let pd_ConfigCurrent = usage(kHIDUsage_PD_ConfigCurrent)
    /// SV/DV F- Power Device Nominal Frequency
    static let pd_ConfigFrequency = usage(kHIDUsage_PD_ConfigFrequency)
    /// SV/DV F- Power Device Nominal Apparent Power
    static let pd_ConfigApparentPower = usage(kHIDUsage_PD_ConfigApparentPower)
    /// SV/DV F- Power Device Nominal RMS Power
    static let pd_ConfigActivePower = usage(kHIDUsage_PD_ConfigActivePower)
    /// SV/DV F- Power Device Nominal Percent Load
    static let pd_ConfigPercentLoad = usage(kHIDUsage_PD_ConfigPercentLoad)
    /// SV/DV F- Power Device Nominal Temperature
    static let pd_ConfigTemperature = usage(kHIDUsage_PD_ConfigTemperature)
    /// SV/DV F- Power Device Nominal Humidity
    static let pd_ConfigHumidity = usage(kHIDUsage_PD_ConfigHumidity)
    /* Reserved 0x48 - 0x4F */
    /// DV F- Power Device Switch On Control
    static let pd_SwitchOnControl = usage(kHIDUsage_PD_SwitchOnControl)
    /// DV F- Power Device Switch Off Control
    static let pd_SwitchOffControl = usage(kHIDUsage_PD_SwitchOffControl)
    /// DV F- Power Device Toogle Sequence Control
    static let pd_ToggleControl = usage(kHIDUsage_PD_ToggleControl)
    /// DV F- Power Device Min Transfer Voltage
    static let pd_LowVoltageTransfer = usage(kHIDUsage_PD_LowVoltageTransfer)
    /// DV F- Power Device Max Transfer Voltage
    static let pd_HighVoltageTransfer = usage(kHIDUsage_PD_HighVoltageTransfer)
    /// DV F- Power Device Delay Before Reboot
    static let pd_DelayBeforeReboot = usage(kHIDUsage_PD_DelayBeforeReboot)
    /// DV F- Power Device Delay Before Startup
    static let pd_DelayBeforeStartup = usage(kHIDUsage_PD_DelayBeforeStartup)
    /// DV F- Power Device Delay Before Shutdown
    static let pd_DelayBeforeShutdown = usage(kHIDUsage_PD_DelayBeforeShutdown)
    /// DV F- Power Device Test Request/Result
    static let pd_Test = usage(kHIDUsage_PD_Test)
    /// DV F- Power Device Reset Request/Result
    static let pd_ModuleReset = usage(kHIDUsage_PD_ModuleReset)
    /// DV F- Power Device Audible Alarm Control
    static let pd_AudibleAlarmControl = usage(kHIDUsage_PD_AudibleAlarmControl)
    /* Reserved 0x5B - 0x5F */
    /// DV IOF- Power Device Present
    static let pd_Present = usage(kHIDUsage_PD_Present)
    /// DV IOF- Power Device Good
    static let pd_Good = usage(kHIDUsage_PD_Good)
    /// DV IOF- Power Device Internal Failure
    static let pd_InternalFailure = usage(kHIDUsage_PD_InternalFailure)
    /// DV IOF- Power Device Voltage Out Of Range
    static let pd_VoltageOutOfRange = usage(kHIDUsage_PD_VoltageOutOfRange)
    /// DV IOF- Power Device Frequency Out Of Range
    static let pd_FrequencyOutOfRange = usage(kHIDUsage_PD_FrequencyOutOfRange)
    /// DV IOF- Power Device Overload
    static let pd_Overload = usage(kHIDUsage_PD_Overload)
    /// DV IOF- Power Device Over Charged
    static let pd_OverCharged = usage(kHIDUsage_PD_OverCharged)
    /// DV IOF- Power Device Over Temperature
    static let pd_OverTemperature = usage(kHIDUsage_PD_OverTemperature)
    /// DV IOF- Power Device Shutdown Requested
    static let pd_ShutdownRequested = usage(kHIDUsage_PD_ShutdownRequested)
    /// DV IOF- Power Device Shutdown Imminent
    static let pd_ShutdownImminent = usage(kHIDUsage_PD_ShutdownImminent)
    /* Reserved 0x6A */
    /// DV IOF- Power Device On/Off Switch Status
    static let pd_SwitchOnOff = usage(kHIDUsage_PD_SwitchOnOff)
    /// DV IOF- Power Device Switchable
    static let pd_Switchable = usage(kHIDUsage_PD_Switchable)
    /// DV IOF- Power Device Used
    static let pd_Used = usage(kHIDUsage_PD_Used)
    /// DV IOF- Power Device Boosted
    static let pd_Boost = usage(kHIDUsage_PD_Boost)
    /// DV IOF- Power Device Bucked
    static let pd_Buck = usage(kHIDUsage_PD_Buck)
    /// DV IOF- Power Device Initialized
    static let pd_Initialized = usage(kHIDUsage_PD_Initialized)
    /// DV IOF- Power Device Tested
    static let pd_Tested = usage(kHIDUsage_PD_Tested)
    /// DV IOF- Power Device Awaiting Power
    static let pd_AwaitingPower = usage(kHIDUsage_PD_AwaitingPower)
    /// DV IOF- Power Device Communication Lost
    static let pd_CommunicationLost = usage(kHIDUsage_PD_CommunicationLost)
    /* Reserved 0x74 - 0xFC */
    /// SV F- Power Device Manufacturer String Index
    static let pd_iManufacturer = usage(kHIDUsage_PD_iManufacturer)
    /// SV F- Power Device Product String Index
    static let pd_iProduct = usage(kHIDUsage_PD_iProduct)
    /// SV F- Power Device Serial Number String Index
    static let pd_iserialNumber = usage(kHIDUsage_PD_iserialNumber)
}

/// Battery System Page (x85)
///
/// This section provides detailed descriptions of the usages employed by
/// Battery Systems.
public extension HIDUsage {
    /// Battery System Undefined
    static let bs_Undefined = usage(kHIDUsage_BS_Undefined)
    /// CL - SMB Mode
    static let bs_SMBBatteryMode = usage(kHIDUsage_BS_SMBBatteryMode)
    /// CL - SMB Status
    static let bs_SMBBatteryStatus = usage(kHIDUsage_BS_SMBBatteryStatus)
    /// CL - SMB Alarm Warning
    static let bs_SMBAlarmWarning = usage(kHIDUsage_BS_SMBAlarmWarning)
    /// CL - SMB Charger Mode
    static let bs_SMBChargerMode = usage(kHIDUsage_BS_SMBChargerMode)
    /// CL - SMB Charger Status
    static let bs_SMBChargerStatus = usage(kHIDUsage_BS_SMBChargerStatus)
    /// CL - SMB Charger Extended Status
    static let bs_SMBChargerSpecInfo = usage(kHIDUsage_BS_SMBChargerSpecInfo)
    /// CL - SMB Selector State
    static let bs_SMBSelectorState = usage(kHIDUsage_BS_SMBSelectorState)
    /// CL - SMB Selector Presets
    static let bs_SMBSelectorPresets = usage(kHIDUsage_BS_SMBSelectorPresets)
    /// CL - SMB Selector Info
    static let bs_SMBSelectorInfo = usage(kHIDUsage_BS_SMBSelectorInfo)
    /* Reserved 0x0A - 0x0F */
    /// DV F - Battery System Optional SMB Mfg Function 1
    static let bs_OptionalMfgFunction1 = usage(kHIDUsage_BS_OptionalMfgFunction1)
    /// DV F - Battery System Optional SMB Mfg Function 2
    static let bs_OptionalMfgFunction2 = usage(kHIDUsage_BS_OptionalMfgFunction2)
    /// DV F - Battery System Optional SMB Mfg Function 3
    static let bs_OptionalMfgFunction3 = usage(kHIDUsage_BS_OptionalMfgFunction3)
    /// DV F - Battery System Optional SMB Mfg Function 4
    static let bs_OptionalMfgFunction4 = usage(kHIDUsage_BS_OptionalMfgFunction4)
    /// DV F - Battery System Optional SMB Mfg Function 5
    static let bs_OptionalMfgFunction5 = usage(kHIDUsage_BS_OptionalMfgFunction5)
    /// DF F - Battery System Connection To System Management Bus
    static let bs_ConnectionToSMBus = usage(kHIDUsage_BS_ConnectionToSMBus)
    /// DF F - Battery System Output Connection Status
    static let bs_OutputConnection = usage(kHIDUsage_BS_OutputConnection)
    /// DF F - Battery System Charger Connection
    static let bs_ChargerConnection = usage(kHIDUsage_BS_ChargerConnection)
    /// DF F - Battery System Battery Insertion
    static let bs_BatteryInsertion = usage(kHIDUsage_BS_BatteryInsertion)
    /// DF F - Battery System Use Next
    static let bs_Usenext = usage(kHIDUsage_BS_Usenext)
    /// DF F - Battery System OK To Use
    static let bs_OKToUse = usage(kHIDUsage_BS_OKToUse)
    /// DF F - Battery System Battery Supported
    static let bs_BatterySupported = usage(kHIDUsage_BS_BatterySupported)
    /// DF F - Battery System Selector Revision
    static let bs_SelectorRevision = usage(kHIDUsage_BS_SelectorRevision)
    /// DF F - Battery System Charging Indicator
    static let bs_ChargingIndicator = usage(kHIDUsage_BS_ChargingIndicator)
    /* Reserved 0x1E - 0x27 */
    /// DV F - Battery System Manufacturer Access
    static let bs_ManufacturerAccess = usage(kHIDUsage_BS_ManufacturerAccess)
    /// DV F - Battery System Remaining Capacity Limit
    static let bs_RemainingCapacityLimit = usage(kHIDUsage_BS_RemainingCapacityLimit)
    /// DV F - Battery System Remaining Time Limit
    static let bs_RemainingTimeLimit = usage(kHIDUsage_BS_RemainingTimeLimit)
    /// DV F - Battery System At Rate...
    static let bs_AtRate = usage(kHIDUsage_BS_AtRate)
    /// DV F - Battery System Capacity Mode
    static let bs_CapacityMode = usage(kHIDUsage_BS_CapacityMode)
    /// DV F - Battery System Broadcast To Charger
    static let bs_BroadcastToCharger = usage(kHIDUsage_BS_BroadcastToCharger)
    /// DV F - Battery System Primary Battery
    static let bs_PrimaryBattery = usage(kHIDUsage_BS_PrimaryBattery)
    /// DV F - Battery System Charge Controller
    static let bs_ChargeController = usage(kHIDUsage_BS_ChargeController)
    /* Reserved 0x30 - 0x3F */
    /// DF IOF - Battery System Terminate Charge
    static let bs_TerminateCharge = usage(kHIDUsage_BS_TerminateCharge)
    /// DF IOF - Battery System Terminate Discharge
    static let bs_TerminateDischarge = usage(kHIDUsage_BS_TerminateDischarge)
    /// DF IOF - Battery System Below Remaining Capacity Limit
    static let bs_BelowRemainingCapacityLimit = usage(kHIDUsage_BS_BelowRemainingCapacityLimit)
    /// DF IOF - Battery System Remaining Time Limit Expired
    static let bs_RemainingTimeLimitExpired = usage(kHIDUsage_BS_RemainingTimeLimitExpired)
    /// DF IOF - Battery System Charging
    static let bs_Charging = usage(kHIDUsage_BS_Charging)
    /// DV IOF - Battery System Discharging
    static let bs_Discharging = usage(kHIDUsage_BS_Discharging)
    /// DF IOF - Battery System Fully Charged
    static let bs_FullyCharged = usage(kHIDUsage_BS_FullyCharged)
    /// DV IOF - Battery System Fully Discharged
    static let bs_FullyDischarged = usage(kHIDUsage_BS_FullyDischarged)
    /// DV IOF - Battery System Conditioning Flag
    static let bs_ConditioningFlag = usage(kHIDUsage_BS_ConditioningFlag)
    /// DV IOF - Battery System At Rate OK
    static let bs_AtRateOK = usage(kHIDUsage_BS_AtRateOK)
    /// DF IOF - Battery System SMB Error Code
    static let bs_SMBErrorCode = usage(kHIDUsage_BS_SMBErrorCode)
    /// DF IOF - Battery System Need Replacement
    static let bs_NeedReplacement = usage(kHIDUsage_BS_NeedReplacement)
    /* Reserved 0x4C - 0x5F */
    /// DV IF - Battery System At Rate Time To Full
    static let bs_AtRateTimeToFull = usage(kHIDUsage_BS_AtRateTimeToFull)
    /// DV IF - Battery System At Rate Time To Empty
    static let bs_AtRateTimeToEmpty = usage(kHIDUsage_BS_AtRateTimeToEmpty)
    /// DV IF - Battery System Average Current
    static let bs_AverageCurrent = usage(kHIDUsage_BS_AverageCurrent)
    /// DV IF - Battery System Max Error
    static let bs_Maxerror = usage(kHIDUsage_BS_Maxerror)
    /// DV IF - Battery System Relative State Of Charge
    static let bs_RelativeStateOfCharge = usage(kHIDUsage_BS_RelativeStateOfCharge)
    /// DV IF - Battery System Absolute State Of Charge
    static let bs_AbsoluteStateOfCharge = usage(kHIDUsage_BS_AbsoluteStateOfCharge)
    /// DV IF - Battery System Remaining Capacity
    static let bs_RemainingCapacity = usage(kHIDUsage_BS_RemainingCapacity)
    /// DV IF - Battery System Full Charge Capacity
    static let bs_FullChargeCapacity = usage(kHIDUsage_BS_FullChargeCapacity)
    /// DV IF - Battery System Run Time To Empty
    static let bs_RunTimeToEmpty = usage(kHIDUsage_BS_RunTimeToEmpty)
    /// DV IF - Battery System Average Time To Empty
    static let bs_AverageTimeToEmpty = usage(kHIDUsage_BS_AverageTimeToEmpty)
    /// DV IF - Battery System Average Time To Full
    static let bs_AverageTimeToFull = usage(kHIDUsage_BS_AverageTimeToFull)
    /// DV IF - Battery System Cycle Count
    static let bs_CycleCount = usage(kHIDUsage_BS_CycleCount)
    /* Reserved 0x6C - 0x7F */
    /// SV F - Battery System Batt Pack Model Level
    static let bs_BattPackModelLevel = usage(kHIDUsage_BS_BattPackModelLevel)
    /// SF F - Battery System Internal Charge Controller
    static let bs_InternalChargeController = usage(kHIDUsage_BS_InternalChargeController)
    /// SF F - Battery System Primary Battery Support
    static let bs_PrimaryBatterySupport = usage(kHIDUsage_BS_PrimaryBatterySupport)
    /// SV F - Battery System Design Capacity
    static let bs_DesignCapacity = usage(kHIDUsage_BS_DesignCapacity)
    /// SV F - Battery System Specification Info
    static let bs_SpecificationInfo = usage(kHIDUsage_BS_SpecificationInfo)
    /// SV F - Battery System Manufacturer Date
    static let bs_ManufacturerDate = usage(kHIDUsage_BS_ManufacturerDate)
    /// SV F - Battery System Serial Number
    static let bs_SerialNumber = usage(kHIDUsage_BS_SerialNumber)
    /// SV F - Battery System Manufacturer Name Index
    static let bs_iManufacturerName = usage(kHIDUsage_BS_iManufacturerName)
    /// SV F - Battery System Device Name Index
    static let bs_iDevicename = usage(kHIDUsage_BS_iDevicename)
    /// SV F - Battery System Device Chemistry Index
    static let bs_iDeviceChemistry = usage(kHIDUsage_BS_iDeviceChemistry)
    /// SV F - Battery System Manufacturer Data
    static let bs_ManufacturerData = usage(kHIDUsage_BS_ManufacturerData)
    /// SV F - Battery System Rechargable
    static let bs_Rechargable = usage(kHIDUsage_BS_Rechargable)
    /// SV F - Battery System Warning Capacity Limit
    static let bs_WarningCapacityLimit = usage(kHIDUsage_BS_WarningCapacityLimit)
    /// SV F - Battery System Capacity Granularity 1
    static let bs_CapacityGranularity1 = usage(kHIDUsage_BS_CapacityGranularity1)
    /// SV F - Battery System Capacity Granularity 2
    static let bs_CapacityGranularity2 = usage(kHIDUsage_BS_CapacityGranularity2)
    /// SV F - Battery System OEM Information Index
    static let bs_iOEMInformation = usage(kHIDUsage_BS_iOEMInformation)
    /* Reserved 0x90 - 0xBF */
    /// DF IOF - Battery System Inhibit Charge
    static let bs_InhibitCharge = usage(kHIDUsage_BS_InhibitCharge)
    /// DF IOF - Battery System Enable Polling
    static let bs_EnablePolling = usage(kHIDUsage_BS_EnablePolling)
    /// DF IOF - Battery System Reset To Zero
    static let bs_ResetToZero = usage(kHIDUsage_BS_ResetToZero)
    /* Reserved 0xC3 - 0xCF */
    /// DF IOF - Battery System AC Present
    static let bs_ACPresent = usage(kHIDUsage_BS_ACPresent)
    /// DF IOF - Battery System Battery Present
    static let bs_BatteryPresent = usage(kHIDUsage_BS_BatteryPresent)
    /// DF IOF - Battery System Power Fail
    static let bs_PowerFail = usage(kHIDUsage_BS_PowerFail)
    /// DF IOF - Battery System Alarm Inhibited
    static let bs_AlarmInhibited = usage(kHIDUsage_BS_AlarmInhibited)
    /// DF IOF - Battery System Thermistor Under Range
    static let bs_ThermistorUnderRange = usage(kHIDUsage_BS_ThermistorUnderRange)
    /// DF IOF - Battery System Thermistor Hot
    static let bs_ThermistorHot = usage(kHIDUsage_BS_ThermistorHot)
    /// DF IOF - Battery System Thermistor Cold
    static let bs_ThermistorCold = usage(kHIDUsage_BS_ThermistorCold)
    /// DF IOF - Battery System Thermistor Over Range
    static let bs_ThermistorOverRange = usage(kHIDUsage_BS_ThermistorOverRange)
    /// DF IOF - Battery System Voltage Out Of Range
    static let bs_VoltageOutOfRange = usage(kHIDUsage_BS_VoltageOutOfRange)
    /// DF IOF - Battery System Current Out Of Range
    static let bs_CurrentOutOfRange = usage(kHIDUsage_BS_CurrentOutOfRange)
    /// DF IOF - Battery System Current Not Regulated
    static let bs_CurrentNotRegulated = usage(kHIDUsage_BS_CurrentNotRegulated)
    /// DF IOF - Battery System Voltage Not Regulated
    static let bs_VoltageNotRegulated = usage(kHIDUsage_BS_VoltageNotRegulated)
    /// DF IOF - Battery System Master Mode
    static let bs_MasterMode = usage(kHIDUsage_BS_MasterMode)
    /* Reserved 0xDD - 0xEF */
    /// SF F- Battery System Charger Support Selector
    static let bs_ChargerSelectorSupport = usage(kHIDUsage_BS_ChargerSelectorSupport)
    /// SF F- Battery System Charger Specification
    static let bs_ChargerSpec = usage(kHIDUsage_BS_ChargerSpec)
    /// SF F- Battery System Charger Level 2
    static let bs_Level2 = usage(kHIDUsage_BS_Level2)
    /// SF F- Battery System Charger Level 3
    static let bs_Level3 = usage(kHIDUsage_BS_Level3)
    /* Reserved 0xF2 - 0xFF */
}

/// Bar Code Scanner Page (0x8C)
/// This section provides detailed descriptions of the usages employed by Bar
/// Code Scanner Devices.
public extension HIDUsage {
    /// Bar Code Scanner Undefined Usage
    static let bcs_Undefined = usage(kHIDUsage_BCS_Undefined)
    /// CA - Bar Code Badge Reader
    static let bcs_BadgeReader = usage(kHIDUsage_BCS_BadgeReader)
    /// CA -Bar Code Scanner
    static let bcs_BarCodeScanner = usage(kHIDUsage_BCS_BarCodeScanner)
    /// CA -Dumb Bar Code Scanner  Usage
    static let bcs_DumbBarCodeScanner = usage(kHIDUsage_BCS_DumbBarCodeScanner)
    /// CA -Cordless Base Usage
    static let bcs_CordlessScannerBase = usage(kHIDUsage_BCS_CordlessScannerBase)
    /// CA -Bar Code Scanner Cradle Usage
    static let bcs_BarCodeScannerCradle = usage(kHIDUsage_BCS_BarCodeScannerCradle)
    /* Reserved 0x06 - 0x0F */
    /// CL - Attribute Report
    static let bcs_AttributeReport = usage(kHIDUsage_BCS_AttributeReport)
    /// CL - Settings Report
    static let bcs_SettingsReport = usage(kHIDUsage_BCS_SettingsReport)
    /// CL - Scanned Data Report
    static let bcs_ScannedDataReport = usage(kHIDUsage_BCS_ScannedDataReport)
    /// CL - Raw Scanned Data Report
    static let bcs_RawScannedDataReport = usage(kHIDUsage_BCS_RawScannedDataReport)
    /// CL - Trigger Report
    static let bcs_TriggerReport = usage(kHIDUsage_BCS_TriggerReport)
    /// CL - Status Report
    static let bcs_StatusReport = usage(kHIDUsage_BCS_StatusReport)
    /// CL - UPC/EAN Control Report
    static let bcs_UPC_EANControlReport = usage(kHIDUsage_BCS_UPC_EANControlReport)
    /// CL - EAN 2/3 Label Control Report
    static let bcs_EAN2_3LabelControlReport = usage(kHIDUsage_BCS_EAN2_3LabelControlReport)
    /// CL - Code 39 Control Report
    static let bcs_Code39ControlReport = usage(kHIDUsage_BCS_Code39ControlReport)
    /// CL - Interleaved 2 of 5 Control Report
    static let bcs_Interleaved2of5ControlReport = usage(kHIDUsage_BCS_Interleaved2of5ControlReport)
    /// CL - Standard 2 of 5 Control Report
    static let bcs_Standard2of5ControlReport = usage(kHIDUsage_BCS_Standard2of5ControlReport)
    /// CL - MSI Plessey Control Report
    static let bcs_MSIPlesseyControlReport = usage(kHIDUsage_BCS_MSIPlesseyControlReport)
    /// CL - Codabar Control Report
    static let bcs_CodabarControlReport = usage(kHIDUsage_BCS_CodabarControlReport)
    /// CL - Code 128 Control Report
    static let bcs_Code128ControlReport = usage(kHIDUsage_BCS_Code128ControlReport)
    /// CL - Misc 1D Control Report
    static let bcs_Misc1DControlReport = usage(kHIDUsage_BCS_Misc1DControlReport)
    /// CL - 2D Control Report
    static let bcs_2DControlReport = usage(kHIDUsage_BCS_2DControlReport)
    /* Reserved 0x20 - 0x2F */
    /// SF - Aiming Pointer Mode
    static let bcs_Aiming_PointerMide = usage(kHIDUsage_BCS_Aiming_PointerMide)
    /// SF - Bar Code Present Sensor
    static let bcs_BarCodePresentSensor = usage(kHIDUsage_BCS_BarCodePresentSensor)
    /// SF - Class 1A Laser
    static let bcs_Class1ALaser = usage(kHIDUsage_BCS_Class1ALaser)
    /// SF - Class 2 Laser
    static let bcs_Class2Laser = usage(kHIDUsage_BCS_Class2Laser)
    /// SF - Heater Present
    static let bcs_HeaterPresent = usage(kHIDUsage_BCS_HeaterPresent)
    /// SF - Contact Scanner
    static let bcs_ContactScanner = usage(kHIDUsage_BCS_ContactScanner)
    /// SF - Electronic Article Surveillance Notification
    static let bcs_ElectronicArticleSurveillanceNotification = usage(kHIDUsage_BCS_ElectronicArticleSurveillanceNotification)
    /// SF - Constant Electronic Article Surveillance
    static let bcs_ConstantElectronicArticleSurveillance = usage(kHIDUsage_BCS_ConstantElectronicArticleSurveillance)
    /// SF - Error Indication
    static let bcs_ErrorIndication = usage(kHIDUsage_BCS_ErrorIndication)
    /// SF - Fixed Beeper
    static let bcs_FixedBeeper = usage(kHIDUsage_BCS_FixedBeeper)
    /// SF - Good Decode Indication
    static let bcs_GoodDecodeIndication = usage(kHIDUsage_BCS_GoodDecodeIndication)
    /// SF - Hands Free Scanning
    static let bcs_HandsFreeScanning = usage(kHIDUsage_BCS_HandsFreeScanning)
    /// SF - Intrinsically Safe
    static let bcs_IntrinsicallySafe = usage(kHIDUsage_BCS_IntrinsicallySafe)
    /// SF - Klasse Eins Laser
    static let bcs_KlasseEinsLaser = usage(kHIDUsage_BCS_KlasseEinsLaser)
    /// SF - Long Range Scanner
    static let bcs_LongRangeScanner = usage(kHIDUsage_BCS_LongRangeScanner)
    /// SF - Mirror Speed Control
    static let bcs_MirrorSpeedControl = usage(kHIDUsage_BCS_MirrorSpeedControl)
    /// SF - Not On File Indication
    static let bcs_NotOnFileIndication = usage(kHIDUsage_BCS_NotOnFileIndication)
    /// SF - Programmable Beeper
    static let bcs_ProgrammableBeeper = usage(kHIDUsage_BCS_ProgrammableBeeper)
    /// SF - Triggerless
    static let bcs_Triggerless = usage(kHIDUsage_BCS_Triggerless)
    /// SF - Wand
    static let bcs_Wand = usage(kHIDUsage_BCS_Wand)
    /// SF - Water Resistant
    static let bcs_WaterResistant = usage(kHIDUsage_BCS_WaterResistant)
    /// SF - Multi-Range Scanner
    static let bcs_MultiRangeScanner = usage(kHIDUsage_BCS_MultiRangeScanner)
    /// SF - Proximity Sensor
    static let bcs_ProximitySensor = usage(kHIDUsage_BCS_ProximitySensor)
    /* Reserved 0x47 - 0x4C */
    /// DF - Fragment Decoding
    static let bcs_FragmentDecoding = usage(kHIDUsage_BCS_FragmentDecoding)
    /// DV - Scanner Read Confidence
    static let bcs_ScannerReadConfidence = usage(kHIDUsage_BCS_ScannerReadConfidence)
    /// NAry - Data Prefix
    static let bcs_DataPrefix = usage(kHIDUsage_BCS_DataPrefix)
    /// SEL - Prefix AIMI
    static let bcs_PrefixAIMI = usage(kHIDUsage_BCS_PrefixAIMI)
    /// SEL - Prefix None
    static let bcs_PrefixNone = usage(kHIDUsage_BCS_PrefixNone)
    /// SEL - Prefix Proprietary
    static let bcs_PrefixProprietary = usage(kHIDUsage_BCS_PrefixProprietary)
    /* Reserved 0x53 - 0x54 */
    /// DV - Active Time
    static let bcs_ActiveTime = usage(kHIDUsage_BCS_ActiveTime)
    /// DF - Aiming Laser Pattern
    static let bcs_AimingLaserPattern = usage(kHIDUsage_BCS_AimingLaserPattern)
    /// OOC - Bar Code Present
    static let bcs_BarCodePresent = usage(kHIDUsage_BCS_BarCodePresent)
    /// OOC - Beeper State
    static let bcs_BeeperState = usage(kHIDUsage_BCS_BeeperState)
    /// DV - Laser On Time
    static let bcs_LaserOnTime = usage(kHIDUsage_BCS_LaserOnTime)
    /// OOC - Laser State
    static let bcs_LaserState = usage(kHIDUsage_BCS_LaserState)
    /// DV - Lockout Time
    static let bcs_LockoutTime = usage(kHIDUsage_BCS_LockoutTime)
    /// OOC - Motor State
    static let bcs_MotorState = usage(kHIDUsage_BCS_MotorState)
    /// DV - Motor Timeout
    static let bcs_MotorTimeout = usage(kHIDUsage_BCS_MotorTimeout)
    /// DF - Power On Reset Scanner
    static let bcs_PowerOnResetScanner = usage(kHIDUsage_BCS_PowerOnResetScanner)
    /// DF - Prevent Read of Barcodes
    static let bcs_PreventReadOfBarcodes = usage(kHIDUsage_BCS_PreventReadOfBarcodes)
    /// DF - Initiate Barcode Read
    static let bcs_InitiateBarcodeRead = usage(kHIDUsage_BCS_InitiateBarcodeRead)
    /// DF - Trigger State
    static let bcs_TriggerState = usage(kHIDUsage_BCS_TriggerState)
    /// NAry - Trigger Mode
    static let bcs_TriggerMode = usage(kHIDUsage_BCS_TriggerMode)
    /// SEL - Trigger Mode Blinking Laser On
    static let bcs_TriggerModeBlinkingLaserOn = usage(kHIDUsage_BCS_TriggerModeBlinkingLaserOn)
    /// SEL - Trigger Mode Continuous Laser On
    static let bcs_TriggerModeContinuousLaserOn = usage(kHIDUsage_BCS_TriggerModeContinuousLaserOn)
    /// SEL - Trigger Mode Laser on while Pulled
    static let bcs_TriggerModeLaserOnWhilePulled = usage(kHIDUsage_BCS_TriggerModeLaserOnWhilePulled)
    /// SEL - Trigger Mode Laser stays on after Trigger Release
    static let bcs_TriggerModeLaserStaysOnAfterTriggerRelease = usage(kHIDUsage_BCS_TriggerModeLaserStaysOnAfterTriggerRelease)
    /* Reserved 0x67 - 0x6C */
    /// DF - Commit Parameters to NVM
    static let bcs_CommitParametersToNVM = usage(kHIDUsage_BCS_CommitParametersToNVM)
    /// DF - Parameter Scanning
    static let bcs_ParameterScanning = usage(kHIDUsage_BCS_ParameterScanning)
    /// OOC - Parameters Changed
    static let bcs_ParametersChanged = usage(kHIDUsage_BCS_ParametersChanged)
    /// DF - Set parameter default values
    static let bcs_SetParameterDefaultValues = usage(kHIDUsage_BCS_SetParameterDefaultValues)
    /* Reserved 0x71 - 0x74 */
    /// OOC - Scanner In Cradle
    static let bcs_ScannerInCradle = usage(kHIDUsage_BCS_ScannerInCradle)
    /// OOC - Scanner In Range
    static let bcs_ScannerInRange = usage(kHIDUsage_BCS_ScannerInRange)
    /* Reserved 0x77 - 0x79 */
    /// DV - Aim Duration
    static let bcs_AimDuration = usage(kHIDUsage_BCS_AimDuration)
    /// DV - Good Read Lamp Duration
    static let bcs_GoodReadLampDuration = usage(kHIDUsage_BCS_GoodReadLampDuration)
    /// DV - Good Read Lamp Intensity
    static let bcs_GoodReadLampIntensity = usage(kHIDUsage_BCS_GoodReadLampIntensity)
    /// DF - Good Read LED
    static let bcs_GoodReadLED = usage(kHIDUsage_BCS_GoodReadLED)
    static let bcs_GoodReadToneFrequency = usage(kHIDUsage_BCS_GoodReadToneFrequency) /* DV - Good Read Tone Frequency*/
    /// DV - Good Read Tone Length
    static let bcs_GoodReadToneLength = usage(kHIDUsage_BCS_GoodReadToneLength)
    /// DV - Good Read Tone Volume
    static let bcs_GoodReadToneVolume = usage(kHIDUsage_BCS_GoodReadToneVolume)
    /* Reserved 0x81 */
    /// DF - No Read Message
    static let bcs_NoReadMessage = usage(kHIDUsage_BCS_NoReadMessage)
    /// DV - Not on File Volume
    static let bcs_NotOnFileVolume = usage(kHIDUsage_BCS_NotOnFileVolume)
    /// DF - Powerup Beep
    static let bcs_PowerupBeep = usage(kHIDUsage_BCS_PowerupBeep)
    /// DF - Sound Error Beep
    static let bcs_SoundErrorBeep = usage(kHIDUsage_BCS_SoundErrorBeep)
    /// DF - Sound Good Read Beep
    static let bcs_SoundGoodReadBeep = usage(kHIDUsage_BCS_SoundGoodReadBeep)
    /// DF - Sound Not On File Beep
    static let bcs_SoundNotOnFileBeep = usage(kHIDUsage_BCS_SoundNotOnFileBeep)
    /// NArry - Good Read When to Write
    static let bcs_GoodReadWhenToWrite = usage(kHIDUsage_BCS_GoodReadWhenToWrite)
    /// SEL - GRWTI After Decode
    static let bcs_GRWTIAfterDecode = usage(kHIDUsage_BCS_GRWTIAfterDecode)
    /// SEL - GRWTI Beep/Lamp after transmit
    static let bcs_GRWTIBeep_LampAfterTransmit = usage(kHIDUsage_BCS_GRWTIBeep_LampAfterTransmit)
    /// SEL - GRWTI No Beep/Lamp at all
    static let bcs_GRWTINoBeep_LampUseAtAll = usage(kHIDUsage_BCS_GRWTINoBeep_LampUseAtAll)
    /* Reserved 0x8C - 0x90 */
    /// DF - Bookland EAN
    static let bcs_BooklandEAN = usage(kHIDUsage_BCS_BooklandEAN)
    /// DF - Convert EAN 8 to 13 Type
    static let bcs_ConvertEAN8To13Type = usage(kHIDUsage_BCS_ConvertEAN8To13Type)
    /// DF - Convert UPC A to EAN-13
    static let bcs_ConvertUPCAToEAN_13 = usage(kHIDUsage_BCS_ConvertUPCAToEAN_13)
    /// DF - Convert UPC-E to A
    static let bcs_ConvertUPC_EToA = usage(kHIDUsage_BCS_ConvertUPC_EToA)
    /// DF - EAN-13
    static let bcs_EAN_13 = usage(kHIDUsage_BCS_EAN_13)
    /// DF - EAN_8
    static let bcs_EAN_8 = usage(kHIDUsage_BCS_EAN_8)
    /// DF - EAN-99 128_Mandatory
    static let bcs_EAN_99_128_Mandatory = usage(kHIDUsage_BCS_EAN_99_128_Mandatory)
    /// DF - EAN-99 P5/128_Optional
    static let bcs_EAN_99_P5_128_Optional = usage(kHIDUsage_BCS_EAN_99_P5_128_Optional)
    /* Reserved 0x99 */
    /// DF - UPC/EAN
    static let bcs_UPC_EAN = usage(kHIDUsage_BCS_UPC_EAN)
    /// DF - UPC/EAN Coupon Code
    static let bcs_UPC_EANCouponCode = usage(kHIDUsage_BCS_UPC_EANCouponCode)
    /// DV - UPC/EAN Periodicals
    static let bcs_UPC_EANPeriodicals = usage(kHIDUsage_BCS_UPC_EANPeriodicals)
    /// DF - UPC-A
    static let bcs_UPC_A = usage(kHIDUsage_BCS_UPC_A)
    /// DF - UPC-A with 128 Mandatory
    static let bcs_UPC_AWith128Mandatory = usage(kHIDUsage_BCS_UPC_AWith128Mandatory)
    /// DF - UPC-A with 128 Optical
    static let bcs_UPC_AWith128Optical = usage(kHIDUsage_BCS_UPC_AWith128Optical)
    /// DF - UPC-A with P5 Optional
    static let bcs_UPC_AWithP5Optional = usage(kHIDUsage_BCS_UPC_AWithP5Optional)
    /// DF - UPC-E
    static let bcs_UPC_E = usage(kHIDUsage_BCS_UPC_E)
    /// DF - UPC-E1
    static let bcs_UPC_E1 = usage(kHIDUsage_BCS_UPC_E1)
    /* Reserved 0xA3 - 0xA8 */
    /// NArry - Periodical
    static let bcs_Periodical = usage(kHIDUsage_BCS_Periodical)
    /// SEL - Periodical Auto-Discriminate + 2
    static let bcs_PeriodicalAutoDiscriminatePlus2 = usage(kHIDUsage_BCS_PeriodicalAutoDiscriminatePlus2)
    /// SEL - Periodical Only Decode with + 2
    static let bcs_PeriodicalOnlyDecodeWithPlus2 = usage(kHIDUsage_BCS_PeriodicalOnlyDecodeWithPlus2)
    /// SEL - Periodical Ignore + 2
    static let bcs_PeriodicalIgnorePlus2 = usage(kHIDUsage_BCS_PeriodicalIgnorePlus2)
    /// SEL - Periodical Auto-Discriminate + 5
    static let bcs_PeriodicalAutoDiscriminatePlus5 = usage(kHIDUsage_BCS_PeriodicalAutoDiscriminatePlus5)
    /// SEL - Periodical Only Decode with + 5
    static let bcs_PeriodicalOnlyDecodeWithPlus5 = usage(kHIDUsage_BCS_PeriodicalOnlyDecodeWithPlus5)
    /// SEL - Periodical Ignore + 5
    static let bcs_PeriodicalIgnorePlus5 = usage(kHIDUsage_BCS_PeriodicalIgnorePlus5)
    /// NArry - Check
    static let bcs_Check = usage(kHIDUsage_BCS_Check)
    /// SEL - Check Disable Price
    static let bcs_CheckDisablePrice = usage(kHIDUsage_BCS_CheckDisablePrice)
    /// SEL - Check Enable 4 digit Price
    static let bcs_CheckEnable4DigitPrice = usage(kHIDUsage_BCS_CheckEnable4DigitPrice)
    /// SEL - Check Enable 5 digit Price
    static let bcs_CheckEnable5DigitPrice = usage(kHIDUsage_BCS_CheckEnable5DigitPrice)
    /// SEL - Check Enable European 4 digit Price
    static let bcs_CheckEnableEuropean4DigitPrice = usage(kHIDUsage_BCS_CheckEnableEuropean4DigitPrice)
    /// SEL - Check Enable European 5 digit Price
    static let bcs_CheckEnableEuropean5DigitPrice = usage(kHIDUsage_BCS_CheckEnableEuropean5DigitPrice)
    /* Reserved 0xB6 */
    /// DF - EAN Two Label
    static let bcs_EANTwoLabel = usage(kHIDUsage_BCS_EANTwoLabel)
    /// DF - EAN Thread Label
    static let bcs_EANThreeLabel = usage(kHIDUsage_BCS_EANThreeLabel)
    /// DV - EAN 8 Flag Digit 1
    static let bcs_EAN8FlagDigit1 = usage(kHIDUsage_BCS_EAN8FlagDigit1)
    /// DV - EAN 8 Flag Digit 2
    static let bcs_EAN8FlagDigit2 = usage(kHIDUsage_BCS_EAN8FlagDigit2)
    /// DV - EAN 8 Flag Digit 3
    static let bcs_EAN8FlagDigit3 = usage(kHIDUsage_BCS_EAN8FlagDigit3)
    /// DV - EAN 13 Flag Digit 1
    static let bcs_EAN13FlagDigit1 = usage(kHIDUsage_BCS_EAN13FlagDigit1)
    /// DV - EAN 13 Flag Digit 2
    static let bcs_EAN13FlagDigit2 = usage(kHIDUsage_BCS_EAN13FlagDigit2)
    /// DV - EAN 13 Flag Digit 3
    static let bcs_EAN13FlagDigit3 = usage(kHIDUsage_BCS_EAN13FlagDigit3)
    /// DF - Add EAN 2/3 Label Definition
    static let bcs_AddEAN2_3LabelDefinition = usage(kHIDUsage_BCS_AddEAN2_3LabelDefinition)
    /// DF - Clear all EAN 2/3 Label Definitions
    static let bcs_ClearAllEAN2_3LabelDefinitions = usage(kHIDUsage_BCS_ClearAllEAN2_3LabelDefinitions)
    /* Reserved 0xC1 - 0xC2 */
    /// DF - Codabar
    static let bcs_Codabar = usage(kHIDUsage_BCS_Codabar)
    /// DF - Code 128
    static let bcs_Code128 = usage(kHIDUsage_BCS_Code128)
    /* Reserved 0xC5 - 0xC6 */
    /// DF - Code 39
    static let bcs_Code39 = usage(kHIDUsage_BCS_Code39)
    /// DF - Code 93
    static let bcs_Code93 = usage(kHIDUsage_BCS_Code93)
    /// DF - Full ASCII Conversion
    static let bcs_FullASCIIConversion = usage(kHIDUsage_BCS_FullASCIIConversion)
    /// DF - Interleaved 2 of 5
    static let bcs_Interleaved2of5 = usage(kHIDUsage_BCS_Interleaved2of5)
    /// DF - Italian Pharmacy Code
    static let bcs_ItalianPharmacyCode = usage(kHIDUsage_BCS_ItalianPharmacyCode)
    /// DF - MSI/Plessey
    static let bcs_MSI_Plessey = usage(kHIDUsage_BCS_MSI_Plessey)
    /// DF - Standard 2 of 5 IATA
    static let bcs_Standard2of5IATA = usage(kHIDUsage_BCS_Standard2of5IATA)
    /// DF - Standard 2 of 5
    static let bcs_Standard2of5 = usage(kHIDUsage_BCS_Standard2of5)
    /* Reserved 0xCF - 0xD2 */
    /// DF - Transmit Start/Stop
    static let bcs_TransmitStart_Stop = usage(kHIDUsage_BCS_TransmitStart_Stop)
    /// DF - Tri-Optic
    static let bcs_TriOptic = usage(kHIDUsage_BCS_TriOptic)
    /// DF - UCC/EAN-128
    static let bcs_UCC_EAN_128 = usage(kHIDUsage_BCS_UCC_EAN_128)
    /// NArry - Check Digit
    static let bcs_CheckDigit = usage(kHIDUsage_BCS_CheckDigit)
    /// SEL - Check Digit Disable
    static let bcs_CheckDigitDisable = usage(kHIDUsage_BCS_CheckDigitDisable)
    /// SEL - Check Digit Enable Interleaved 2 of 5 OPCC
    static let bcs_CheckDigitEnableInterleaved2of5OPCC = usage(kHIDUsage_BCS_CheckDigitEnableInterleaved2of5OPCC)
    /// SEL - Check Digit Enable Interleaved 2 of 5 USS
    static let bcs_CheckDigitEnableInterleaved2of5USS = usage(kHIDUsage_BCS_CheckDigitEnableInterleaved2of5USS)
    /// SEL - Check Digit Enable Standard 2 of 5 OPCC
    static let bcs_CheckDigitEnableStandard2of5OPCC = usage(kHIDUsage_BCS_CheckDigitEnableStandard2of5OPCC)
    /// SEL - Check Digit Enable Standard 2 of 5 USS
    static let bcs_CheckDigitEnableStandard2of5USS = usage(kHIDUsage_BCS_CheckDigitEnableStandard2of5USS)
    /// SEL - Check Digit Enable One MSI Plessey
    static let bcs_CheckDigitEnableOneMSIPlessey = usage(kHIDUsage_BCS_CheckDigitEnableOneMSIPlessey)
    /// SEL - Check Digit Enable Two MSI Plessey
    static let bcs_CheckDigitEnableTwoMSIPlessey = usage(kHIDUsage_BCS_CheckDigitEnableTwoMSIPlessey)
    /// SEL - Check Digit Codabar Enable
    static let bcs_CheckDigitCodabarEnable = usage(kHIDUsage_BCS_CheckDigitCodabarEnable)
    /// SEL - Check Digit Code 99 Enable
    static let bcs_CheckDigitCode99Enable = usage(kHIDUsage_BCS_CheckDigitCode99Enable)
    /* Reserved 0xE0 - 0xEF */
    /// NArry - Transmit Check Digit
    static let bcs_TransmitCheckDigit = usage(kHIDUsage_BCS_TransmitCheckDigit)
    /// SEL - Disable Check Digit Transmit
    static let bcs_DisableCheckDigitTransmit = usage(kHIDUsage_BCS_DisableCheckDigitTransmit)
    /// SEL - Enable Check Digit Transmit
    static let bcs_EnableCheckDigitTransmit = usage(kHIDUsage_BCS_EnableCheckDigitTransmit)
    /* Reserved 0xF3 - 0xFA */
    /// DV - Symbology Identifier 1
    static let bcs_SymbologyIdentifier1 = usage(kHIDUsage_BCS_SymbologyIdentifier1)
    /// DV - Symbology Identifier 2
    static let bcs_SymbologyIdentifier2 = usage(kHIDUsage_BCS_SymbologyIdentifier2)
    /// DV - Symbology Identifier 3
    static let bcs_SymbologyIdentifier3 = usage(kHIDUsage_BCS_SymbologyIdentifier3)
    /// DV - Decoded Data
    static let bcs_DecodedData = usage(kHIDUsage_BCS_DecodedData)
    /// DF - Decode Data Continued
    static let bcs_DecodeDataContinued = usage(kHIDUsage_BCS_DecodeDataContinued)
    /// DV - Bar Space Data
    static let bcs_BarSpaceData = usage(kHIDUsage_BCS_BarSpaceData)
    /// DV - Scanner Data Accuracy
    static let bcs_ScannerDataAccuracy = usage(kHIDUsage_BCS_ScannerDataAccuracy)
    /// NArry - Raw Data Polarity
    static let bcs_RawDataPolarity = usage(kHIDUsage_BCS_RawDataPolarity)
    /// SEL - Polarity Inverted Bar Code
    static let bcs_PolarityInvertedBarCode = usage(kHIDUsage_BCS_PolarityInvertedBarCode)
    /// SEL - Polarity Normal Bar Code
    static let bcs_PolarityNormalBarCode = usage(kHIDUsage_BCS_PolarityNormalBarCode)
    /* Reserved 0x105 */
    /// DV - Minimum Length to Decode
    static let bcs_MinimumLengthToDecode = usage(kHIDUsage_BCS_MinimumLengthToDecode)
    /// DV - Maximum Length to Decode
    static let bcs_MaximumLengthToDecode = usage(kHIDUsage_BCS_MaximumLengthToDecode)
    /// DV - First Discrete Length to Decode
    static let bcs_FirstDiscreteLengthToDecode = usage(kHIDUsage_BCS_FirstDiscreteLengthToDecode)
    /// DV - Second Discrete Length to Decode
    static let bcs_SecondDiscreteLengthToDecode = usage(kHIDUsage_BCS_SecondDiscreteLengthToDecode)
    /// NArry - Data Length Method
    static let bcs_DataLengthMethod = usage(kHIDUsage_BCS_DataLengthMethod)
    /// DF - DL Method Read any
    static let bcs_DLMethodReadAny = usage(kHIDUsage_BCS_DLMethodReadAny)
    /// DF - DL Method Check in Range
    static let bcs_DLMethodCheckInRange = usage(kHIDUsage_BCS_DLMethodCheckInRange)
    /// DF - DL Method Check for Discrete
    static let bcs_DLMethodCheckForDiscrete = usage(kHIDUsage_BCS_DLMethodCheckForDiscrete)
    /* Reserved 0x10E - 0x10F */
    /// DF - Aztec Code
    static let bcs_AztecCode = usage(kHIDUsage_BCS_AztecCode)
    /// DF - BC412
    static let bcs_BC412 = usage(kHIDUsage_BCS_BC412)
    /// DF - Channel Code
    static let bcs_ChannelCode = usage(kHIDUsage_BCS_ChannelCode)
    /// DF - Code 16
    static let bcs_Code16 = usage(kHIDUsage_BCS_Code16)
    /// DF - Code 32
    static let bcs_Code32 = usage(kHIDUsage_BCS_Code32)
    /// DF - Code 49
    static let bcs_Code49 = usage(kHIDUsage_BCS_Code49)
    /// DF - Code One
    static let bcs_CodeOne = usage(kHIDUsage_BCS_CodeOne)
    /// DF - Colorcode
    static let bcs_Colorcode = usage(kHIDUsage_BCS_Colorcode)
    /// DF - Data Matrix
    static let bcs_DataMatrix = usage(kHIDUsage_BCS_DataMatrix)
    /// DF - MaxiCode
    static let bcs_MaxiCode = usage(kHIDUsage_BCS_MaxiCode)
    /// DF - MicroPDF
    static let bcs_MicroPDF = usage(kHIDUsage_BCS_MicroPDF)
    /// DF - PDF-417
    static let bcs_PDF_417 = usage(kHIDUsage_BCS_PDF_417)
    /// DF - PosiCode
    static let bcs_PosiCode = usage(kHIDUsage_BCS_PosiCode)
    /// DF - QR Code
    static let bcs_QRCode = usage(kHIDUsage_BCS_QRCode)
    /// DF - SuperCode
    static let bcs_SuperCode = usage(kHIDUsage_BCS_SuperCode)
    /// DF - UltraCode
    static let bcs_UltraCode = usage(kHIDUsage_BCS_UltraCode)
    /// DF - USD-5 (Slug Code)
    static let bcs_USB_5_SlugCode = usage(kHIDUsage_BCS_USB_5_SlugCode)
    /// DF - VeriCode
    static let bcs_VeriCode = usage(kHIDUsage_BCS_VeriCode)
    /* Reserved 0x122 - 0xFFFF */
}

/// Weighing Devices Page (0x8D)
/// This section provides detailed descriptions of the usages employed by Weighing Devices.
public extension HIDUsage {
    /// Weighing Device Undefined Usage
    static let wd_Undefined = usage(kHIDUsage_WD_Undefined)
    /// CA - Weighing Device
    static let wd_WeighingDevice = usage(kHIDUsage_WD_WeighingDevice)
    /* Reserved 0x02 - 0x1F */
    /// CL - Scale Device
    static let wd_ScaleScaleDevice = usage(kHIDUsage_WD_ScaleScaleDevice)
    /// CL - Scale Class I Metric
    static let wd_ScaleScaleClassIMetricCL = usage(kHIDUsage_WD_ScaleScaleClassIMetricCL)
    /// SEL - Scale Class I Metric
    static let wd_ScaleScaleClassIMetric = usage(kHIDUsage_WD_ScaleScaleClassIMetric)
    /// SEL - Scale Class II Metric
    static let wd_ScaleScaleClassIIMetric = usage(kHIDUsage_WD_ScaleScaleClassIIMetric)
    /// SEL - Scale Class III Metric
    static let wd_ScaleScaleClassIIIMetric = usage(kHIDUsage_WD_ScaleScaleClassIIIMetric)
    /// SEL - Scale Class IIIL Metric
    static let wd_ScaleScaleClassIIILMetric = usage(kHIDUsage_WD_ScaleScaleClassIIILMetric)
    /// SEL - Scale Class IV Metric
    static let wd_ScaleScaleClassIVMetric = usage(kHIDUsage_WD_ScaleScaleClassIVMetric)
    /// SEL - Scale Class III English
    static let wd_ScaleScaleClassIIIEnglish = usage(kHIDUsage_WD_ScaleScaleClassIIIEnglish)
    /// SEL - Scale Class IIIL English
    static let wd_ScaleScaleClassIIILEnglish = usage(kHIDUsage_WD_ScaleScaleClassIIILEnglish)
    /// SEL - Scale Class IV English
    static let wd_ScaleScaleClassIVEnglish = usage(kHIDUsage_WD_ScaleScaleClassIVEnglish)
    /// SEL - Scale Class Generic
    static let wd_ScaleScaleClassGeneric = usage(kHIDUsage_WD_ScaleScaleClassGeneric)
    /* Reserved 0x2B - 0x2F */
    /// CL - Scale Attribute Report
    static let wd_ScaleAtrributeReport = usage(kHIDUsage_WD_ScaleAtrributeReport)
    /// CL - Scale Control Report
    static let wd_ScaleControlReport = usage(kHIDUsage_WD_ScaleControlReport)
    /// CL - Scale Data Report
    static let wd_ScaleDataReport = usage(kHIDUsage_WD_ScaleDataReport)
    /// CL - Scale Status Report
    static let wd_ScaleStatusReport = usage(kHIDUsage_WD_ScaleStatusReport)
    /// CL - Scale Weight Limit Report
    static let wd_ScaleWeightLimitReport = usage(kHIDUsage_WD_ScaleWeightLimitReport)
    /// CL - Scale Statistics Report
    static let wd_ScaleStatisticsReport = usage(kHIDUsage_WD_ScaleStatisticsReport)
    /* Reserved 0x36 - 0x3F */
    /// DV - Data Weight
    static let wd_DataWeight = usage(kHIDUsage_WD_DataWeight)
    /// DV - Data Scaling
    static let wd_DataScaling = usage(kHIDUsage_WD_DataScaling)
    /* Reserved 0x42 - 0x4F */
    /// CL - Weight Unit
    static let wd_WeightUnit = usage(kHIDUsage_WD_WeightUnit)
    /// SEL - Weight Unit Milligram
    static let wd_WeightUnitMilligram = usage(kHIDUsage_WD_WeightUnitMilligram)
    /// SEL - Weight Unit Gram
    static let wd_WeightUnitGram = usage(kHIDUsage_WD_WeightUnitGram)
    /// SEL - Weight Unit Kilogram
    static let wd_WeightUnitKilogram = usage(kHIDUsage_WD_WeightUnitKilogram)
    /// SEL - Weight Unit Carats
    static let wd_WeightUnitCarats = usage(kHIDUsage_WD_WeightUnitCarats)
    /// SEL - Weight Unit Taels
    static let wd_WeightUnitTaels = usage(kHIDUsage_WD_WeightUnitTaels)
    /// SEL - Weight Unit Grains
    static let wd_WeightUnitGrains = usage(kHIDUsage_WD_WeightUnitGrains)
    /// SEL - Weight Unit Pennyweights
    static let wd_WeightUnitPennyweights = usage(kHIDUsage_WD_WeightUnitPennyweights)
    /// SEL - Weight Unit Metric Ton
    static let wd_WeightUnitMetricTon = usage(kHIDUsage_WD_WeightUnitMetricTon)
    /// SEL - Weight Unit Avoir Ton
    static let wd_WeightUnitAvoirTon = usage(kHIDUsage_WD_WeightUnitAvoirTon)
    /// SEL - Weight Unit Troy Ounce
    static let wd_WeightUnitTroyOunce = usage(kHIDUsage_WD_WeightUnitTroyOunce)
    /// SEL - Weight Unit Ounce
    static let wd_WeightUnitOunce = usage(kHIDUsage_WD_WeightUnitOunce)
    /// SEL - Weight Unit Pound
    static let wd_WeightUnitPound = usage(kHIDUsage_WD_WeightUnitPound)
    /* Reserved 0x5D - 0x5F */
    /// DV - Calibration Count
    static let wd_CalibrationCount = usage(kHIDUsage_WD_CalibrationCount)
    static let wd_RezeroCount = usage(kHIDUsage_WD_RezeroCount) /* DV - Re-Zero Count*/
    /* Reserved 0x62 - 0x6F */
    /// CL - Scale Status
    static let wd_ScaleStatus = usage(kHIDUsage_WD_ScaleStatus)
    /// SEL - Scale Status Fault
    static let wd_ScaleStatusFault = usage(kHIDUsage_WD_ScaleStatusFault)
    /// SEL - Scale Status Stable at Center of  Zero
    static let wd_ScaleStatusStableAtZero = usage(kHIDUsage_WD_ScaleStatusStableAtZero)
    /// SEL - Scale Status In Motion
    static let wd_ScaleStatusInMotion = usage(kHIDUsage_WD_ScaleStatusInMotion)
    /// SEL - Scale Status Weight Stable
    static let wd_ScaleStatusWeightStable = usage(kHIDUsage_WD_ScaleStatusWeightStable)
    /// SEL - Scale Status Under Zero
    static let wd_ScaleStatusUnderZero = usage(kHIDUsage_WD_ScaleStatusUnderZero)
    /// SEL - Scale Status Over Weight Limit
    static let wd_ScaleStatusOverWeightLimit = usage(kHIDUsage_WD_ScaleStatusOverWeightLimit)
    /// SEL - Scale Status Requires Calibration
    static let wd_ScaleStatusRequiresCalibration = usage(kHIDUsage_WD_ScaleStatusRequiresCalibration)
    /// SEL - Scale Status Requires Re-zeroing
    static let wd_ScaleStatusRequiresRezeroing = usage(kHIDUsage_WD_ScaleStatusRequiresRezeroing)
    /* Reserved 0x79 - 0x7F */
    /// OOC - Zero Scale
    static let wd_ZeroScale = usage(kHIDUsage_WD_ZeroScale)
    /// OOC - Enforced Zero Return
    static let wd_EnforcedZeroReturn = usage(kHIDUsage_WD_EnforcedZeroReturn)
    /* Reserved 0x82 - 0xFFFF */
}

/// Magnetic Stripe Reader Page (0x8E)
/// This section provides detailed descriptions of the usages employed by
/// Magnetic Stripe Reader Devices.
public extension HIDUsage {
    /// MagStripe Undefined Usage
    static let msr_Undefined = usage(kHIDUsage_MSR_Undefined)
    /// CA - MSR Device Read-Only
    static let msr_DeviceReadOnly = usage(kHIDUsage_MSR_DeviceReadOnly)
    /* Reserved 0x02 - 0x10 */
    /// SF, DF, SEL - Track 1 Length
    static let msr_Track1Length = usage(kHIDUsage_MSR_Track1Length)
    /// SF, DF, SEL - Track 2 Length
    static let msr_Track2Length = usage(kHIDUsage_MSR_Track2Length)
    /// SF, DF, SEL - Track 3 Length
    static let msr_Track3Length = usage(kHIDUsage_MSR_Track3Length)
    /// SF, DF, SEL - Track JIS Length
    static let msr_TrackJISLength = usage(kHIDUsage_MSR_TrackJISLength)
    /* Reserved 0x15 - 0x1F */
    /// SF, DF, SEL - Track Data
    static let msr_TrackData = usage(kHIDUsage_MSR_TrackData)
    /// SF, DF, SEL - Track 1 Data
    static let msr_Track1Data = usage(kHIDUsage_MSR_Track1Data)
    /// SF, DF, SEL - Track 2 Data
    static let msr_Track2Data = usage(kHIDUsage_MSR_Track2Data)
    /// SF, DF, SEL - Track 3 Data
    static let msr_Track3Data = usage(kHIDUsage_MSR_Track3Data)
    /// SF, DF, SEL - Track JIS Data
    static let msr_TrackJISData = usage(kHIDUsage_MSR_TrackJISData)
    /* Reserved 0x25 - 0xFFFF */
}

/// Camera Control Page (0x90)
public extension HIDUsage {
    /// Camera Control Undefined Usage
    static let cc_Undefined = usage(kHIDUsage_CC_Undefined)
    /* Reserved 0x01 - 0x1F */
    /// One-Shot Control
    static let cc_Autofocus = usage(kHIDUsage_CC_Autofocus)
    /// One-Shot Control
    static let cc_Shutter = usage(kHIDUsage_CC_Shutter)
}

#endif // canImport(IOKit)
