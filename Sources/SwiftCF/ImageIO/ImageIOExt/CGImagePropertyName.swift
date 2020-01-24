#if canImport(ImageIO)

import ImageIO

extension CGImage {
    
    public struct PropertyName: CFStringKey {
        
        public let rawValue: CFString
        
        public init(_ key: CFString) {
            rawValue = key
        }
    }
}

public extension CGImage.PropertyName {
    static let fileSize = kCGImagePropertyFileSize as CGImage.PropertyName
    static let pixelHeight = kCGImagePropertyPixelHeight as CGImage.PropertyName
    static let pixelWidth = kCGImagePropertyPixelWidth as CGImage.PropertyName
    static let dPIHeight = kCGImagePropertyDPIHeight as CGImage.PropertyName
    static let dPIWidth = kCGImagePropertyDPIWidth as CGImage.PropertyName
    static let depth = kCGImagePropertyDepth as CGImage.PropertyName
    static let orientation = kCGImagePropertyOrientation as CGImage.PropertyName
    static let isFloat = kCGImagePropertyIsFloat as CGImage.PropertyName
    static let isIndexed = kCGImagePropertyIsIndexed as CGImage.PropertyName
    static let hasAlpha = kCGImagePropertyHasAlpha as CGImage.PropertyName
    static let colorModel = kCGImagePropertyColorModel as CGImage.PropertyName
    static let profileName = kCGImagePropertyProfileName as CGImage.PropertyName
    @available(macOS 10.11, iOS 9.0, tvOS 9.0, watchOS 2.0, *)
    static let pngCompressionFilter = kCGImagePropertyPNGCompressionFilter as CGImage.PropertyName
    
}

@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public extension CGImage.PropertyName {
    static let primaryImage = kCGImagePropertyPrimaryImage as CGImage.PropertyName
    static let imageCount = kCGImagePropertyImageCount as CGImage.PropertyName
    static let width = kCGImagePropertyWidth as CGImage.PropertyName
    static let height = kCGImagePropertyHeight as CGImage.PropertyName
    static let bytesPerRow = kCGImagePropertyBytesPerRow as CGImage.PropertyName
    static let namedColorSpace = kCGImagePropertyNamedColorSpace as CGImage.PropertyName
    static let pixelFormat = kCGImagePropertyPixelFormat as CGImage.PropertyName
    static let images = kCGImagePropertyImages as CGImage.PropertyName
    static let thumbnailImages = kCGImagePropertyThumbnailImages as CGImage.PropertyName
    static let auxiliaryData = kCGImagePropertyAuxiliaryData as CGImage.PropertyName
    static let auxiliaryDataType = kCGImagePropertyAuxiliaryDataType as CGImage.PropertyName
}

/// For kCGImagePropertyTIFFDictionary
public extension CGImage.PropertyName {
    static let tiffCompression = kCGImagePropertyTIFFCompression as CGImage.PropertyName
    static let tiffPhotometricInterpretation = kCGImagePropertyTIFFPhotometricInterpretation as CGImage.PropertyName
    static let tiffDocumentName = kCGImagePropertyTIFFDocumentName as CGImage.PropertyName
    static let tiffImageDescription = kCGImagePropertyTIFFImageDescription as CGImage.PropertyName
    static let tiffMake = kCGImagePropertyTIFFMake as CGImage.PropertyName
    static let tiffModel = kCGImagePropertyTIFFModel as CGImage.PropertyName
    static let tiffOrientation = kCGImagePropertyTIFFOrientation as CGImage.PropertyName
    static let tiffXResolution = kCGImagePropertyTIFFXResolution as CGImage.PropertyName
    static let tiffYResolution = kCGImagePropertyTIFFYResolution as CGImage.PropertyName
    static let tiffResolutionUnit = kCGImagePropertyTIFFResolutionUnit as CGImage.PropertyName
    static let tiffSoftware = kCGImagePropertyTIFFSoftware as CGImage.PropertyName
    static let tiffTransferFunction = kCGImagePropertyTIFFTransferFunction as CGImage.PropertyName
    static let tiffDateTime = kCGImagePropertyTIFFDateTime as CGImage.PropertyName
    static let tiffArtist = kCGImagePropertyTIFFArtist as CGImage.PropertyName
    static let tiffHostComputer = kCGImagePropertyTIFFHostComputer as CGImage.PropertyName
    static let tiffCopyright = kCGImagePropertyTIFFCopyright as CGImage.PropertyName
    static let tiffWhitePoint = kCGImagePropertyTIFFWhitePoint as CGImage.PropertyName
    static let tiffPrimaryChromaticities = kCGImagePropertyTIFFPrimaryChromaticities as CGImage.PropertyName
    static let tiffTileWidth = kCGImagePropertyTIFFTileWidth as CGImage.PropertyName
    static let tiffTileLength = kCGImagePropertyTIFFTileLength as CGImage.PropertyName
}

/// For kCGImagePropertyJFIFDictionary
public extension CGImage.PropertyName {
    static let jfifVersion = kCGImagePropertyJFIFVersion as CGImage.PropertyName
    static let jfifXDensity = kCGImagePropertyJFIFXDensity as CGImage.PropertyName
    static let jfifYDensity = kCGImagePropertyJFIFYDensity as CGImage.PropertyName
    static let jfifDensityUnit = kCGImagePropertyJFIFDensityUnit as CGImage.PropertyName
    static let jfifIsProgressive = kCGImagePropertyJFIFIsProgressive as CGImage.PropertyName
}

/// For kCGImagePropertyHEICSDictionary
public extension CGImage.PropertyName {
    static let heicsLoopCount = kCGImagePropertyHEICSLoopCount as CGImage.PropertyName
    static let heicsDelayTime = kCGImagePropertyHEICSDelayTime as CGImage.PropertyName
    static let heicsUnclampedDelayTime = kCGImagePropertyHEICSUnclampedDelayTime as CGImage.PropertyName
    static let heicsCanvasPixelWidth = kCGImagePropertyHEICSCanvasPixelWidth as CGImage.PropertyName
    static let heicsCanvasPixelHeight = kCGImagePropertyHEICSCanvasPixelHeight as CGImage.PropertyName
    static let heicsFrameInfoArray = kCGImagePropertyHEICSFrameInfoArray as CGImage.PropertyName
}

/// For kCGImagePropertyExifDictionary
public extension CGImage.PropertyName {
    static let exifExposureTime = kCGImagePropertyExifExposureTime as CGImage.PropertyName
    static let exifFNumber = kCGImagePropertyExifFNumber as CGImage.PropertyName
    static let exifExposureProgram = kCGImagePropertyExifExposureProgram as CGImage.PropertyName
    static let exifSpectralSensitivity = kCGImagePropertyExifSpectralSensitivity as CGImage.PropertyName
    static let exifISOSpeedRatings = kCGImagePropertyExifISOSpeedRatings as CGImage.PropertyName
    static let exifOECF = kCGImagePropertyExifOECF as CGImage.PropertyName
    static let exifSensitivityType = kCGImagePropertyExifSensitivityType as CGImage.PropertyName
    static let exifStandardOutputSensitivity = kCGImagePropertyExifStandardOutputSensitivity as CGImage.PropertyName
    static let exifRecommendedExposureIndex = kCGImagePropertyExifRecommendedExposureIndex as CGImage.PropertyName
    static let exifISOSpeed = kCGImagePropertyExifISOSpeed as CGImage.PropertyName
    static let exifISOSpeedLatitudeyyy = kCGImagePropertyExifISOSpeedLatitudeyyy as CGImage.PropertyName
    static let exifISOSpeedLatitudezzz = kCGImagePropertyExifISOSpeedLatitudezzz as CGImage.PropertyName
    static let exifVersion = kCGImagePropertyExifVersion as CGImage.PropertyName
    static let exifDateTimeOriginal = kCGImagePropertyExifDateTimeOriginal as CGImage.PropertyName
    static let exifDateTimeDigitized = kCGImagePropertyExifDateTimeDigitized as CGImage.PropertyName
    static let exifOffsetTime = kCGImagePropertyExifOffsetTime as CGImage.PropertyName
    static let exifOffsetTimeOriginal = kCGImagePropertyExifOffsetTimeOriginal as CGImage.PropertyName
    static let exifOffsetTimeDigitized = kCGImagePropertyExifOffsetTimeDigitized as CGImage.PropertyName
    static let exifComponentsConfiguration = kCGImagePropertyExifComponentsConfiguration as CGImage.PropertyName
    static let exifCompressedBitsPerPixel = kCGImagePropertyExifCompressedBitsPerPixel as CGImage.PropertyName
    static let exifShutterSpeedValue = kCGImagePropertyExifShutterSpeedValue as CGImage.PropertyName
    static let exifApertureValue = kCGImagePropertyExifApertureValue as CGImage.PropertyName
    static let exifBrightnessValue = kCGImagePropertyExifBrightnessValue as CGImage.PropertyName
    static let exifExposureBiasValue = kCGImagePropertyExifExposureBiasValue as CGImage.PropertyName
    static let exifMaxApertureValue = kCGImagePropertyExifMaxApertureValue as CGImage.PropertyName
    static let exifSubjectDistance = kCGImagePropertyExifSubjectDistance as CGImage.PropertyName
    static let exifMeteringMode = kCGImagePropertyExifMeteringMode as CGImage.PropertyName
    static let exifLightSource = kCGImagePropertyExifLightSource as CGImage.PropertyName
    static let exifFlash = kCGImagePropertyExifFlash as CGImage.PropertyName
    static let exifFocalLength = kCGImagePropertyExifFocalLength as CGImage.PropertyName
    static let exifSubjectArea = kCGImagePropertyExifSubjectArea as CGImage.PropertyName
    static let exifMakerNote = kCGImagePropertyExifMakerNote as CGImage.PropertyName
    static let exifUserComment = kCGImagePropertyExifUserComment as CGImage.PropertyName
    static let exifSubsecTime = kCGImagePropertyExifSubsecTime as CGImage.PropertyName
    static let exifSubsecTimeOriginal = kCGImagePropertyExifSubsecTimeOriginal as CGImage.PropertyName
    static let exifSubsecTimeDigitized = kCGImagePropertyExifSubsecTimeDigitized as CGImage.PropertyName
    static let exifFlashPixVersion = kCGImagePropertyExifFlashPixVersion as CGImage.PropertyName
    static let exifColorSpace = kCGImagePropertyExifColorSpace as CGImage.PropertyName
    static let exifPixelXDimension = kCGImagePropertyExifPixelXDimension as CGImage.PropertyName
    static let exifPixelYDimension = kCGImagePropertyExifPixelYDimension as CGImage.PropertyName
    static let exifRelatedSoundFile = kCGImagePropertyExifRelatedSoundFile as CGImage.PropertyName
    static let exifFlashEnergy = kCGImagePropertyExifFlashEnergy as CGImage.PropertyName
    static let exifSpatialFrequencyResponse = kCGImagePropertyExifSpatialFrequencyResponse as CGImage.PropertyName
    static let exifFocalPlaneXResolution = kCGImagePropertyExifFocalPlaneXResolution as CGImage.PropertyName
    static let exifFocalPlaneYResolution = kCGImagePropertyExifFocalPlaneYResolution as CGImage.PropertyName
    static let exifFocalPlaneResolutionUnit = kCGImagePropertyExifFocalPlaneResolutionUnit as CGImage.PropertyName
    static let exifSubjectLocation = kCGImagePropertyExifSubjectLocation as CGImage.PropertyName
    static let exifExposureIndex = kCGImagePropertyExifExposureIndex as CGImage.PropertyName
    static let exifSensingMethod = kCGImagePropertyExifSensingMethod as CGImage.PropertyName
    static let exifFileSource = kCGImagePropertyExifFileSource as CGImage.PropertyName
    static let exifSceneType = kCGImagePropertyExifSceneType as CGImage.PropertyName
    static let exifCFAPattern = kCGImagePropertyExifCFAPattern as CGImage.PropertyName
    static let exifCustomRendered = kCGImagePropertyExifCustomRendered as CGImage.PropertyName
    static let exifExposureMode = kCGImagePropertyExifExposureMode as CGImage.PropertyName
    static let exifWhiteBalance = kCGImagePropertyExifWhiteBalance as CGImage.PropertyName
    static let exifDigitalZoomRatio = kCGImagePropertyExifDigitalZoomRatio as CGImage.PropertyName
    static let exifFocalLenIn35mmFilm = kCGImagePropertyExifFocalLenIn35mmFilm as CGImage.PropertyName
    static let exifSceneCaptureType = kCGImagePropertyExifSceneCaptureType as CGImage.PropertyName
    static let exifGainControl = kCGImagePropertyExifGainControl as CGImage.PropertyName
    static let exifContrast = kCGImagePropertyExifContrast as CGImage.PropertyName
    static let exifSaturation = kCGImagePropertyExifSaturation as CGImage.PropertyName
    static let exifSharpness = kCGImagePropertyExifSharpness as CGImage.PropertyName
    static let exifDeviceSettingDescription = kCGImagePropertyExifDeviceSettingDescription as CGImage.PropertyName
    static let exifSubjectDistRange = kCGImagePropertyExifSubjectDistRange as CGImage.PropertyName
    static let exifImageUniqueID = kCGImagePropertyExifImageUniqueID as CGImage.PropertyName
    static let exifCameraOwnerName = kCGImagePropertyExifCameraOwnerName as CGImage.PropertyName
    static let exifBodySerialNumber = kCGImagePropertyExifBodySerialNumber as CGImage.PropertyName
    static let exifLensSpecification = kCGImagePropertyExifLensSpecification as CGImage.PropertyName
    static let exifLensMake = kCGImagePropertyExifLensMake as CGImage.PropertyName
    static let exifLensModel = kCGImagePropertyExifLensModel as CGImage.PropertyName
    static let exifLensSerialNumber = kCGImagePropertyExifLensSerialNumber as CGImage.PropertyName
    static let exifGamma = kCGImagePropertyExifGamma as CGImage.PropertyName
    static let exifCompositeImage = kCGImagePropertyExifCompositeImage as CGImage.PropertyName
    static let exifSourceImageNumberOfCompositeImage = kCGImagePropertyExifSourceImageNumberOfCompositeImage as CGImage.PropertyName
    static let exifSourceExposureTimesOfCompositeImage = kCGImagePropertyExifSourceExposureTimesOfCompositeImage as CGImage.PropertyName
}

/// For kCGImagePropertyExifAuxDictionary
public extension CGImage.PropertyName {
    static let exifAuxLensInfo = kCGImagePropertyExifAuxLensInfo as CGImage.PropertyName
    static let exifAuxLensModel = kCGImagePropertyExifAuxLensModel as CGImage.PropertyName
    static let exifAuxSerialNumber = kCGImagePropertyExifAuxSerialNumber as CGImage.PropertyName
    static let exifAuxLensID = kCGImagePropertyExifAuxLensID as CGImage.PropertyName
    static let exifAuxLensSerialNumber = kCGImagePropertyExifAuxLensSerialNumber as CGImage.PropertyName
    static let exifAuxImageNumber = kCGImagePropertyExifAuxImageNumber as CGImage.PropertyName
    static let exifAuxFlashCompensation = kCGImagePropertyExifAuxFlashCompensation as CGImage.PropertyName
    static let exifAuxOwnerName = kCGImagePropertyExifAuxOwnerName as CGImage.PropertyName
    static let exifAuxFirmware = kCGImagePropertyExifAuxFirmware as CGImage.PropertyName
}

/// For kCGImagePropertyGIFDictionary
public extension CGImage.PropertyName {
    static let gifLoopCount = kCGImagePropertyGIFLoopCount as CGImage.PropertyName
    static let gifDelayTime = kCGImagePropertyGIFDelayTime as CGImage.PropertyName
    static let gifImageColorMap = kCGImagePropertyGIFImageColorMap as CGImage.PropertyName
    static let gifHasGlobalColorMap = kCGImagePropertyGIFHasGlobalColorMap as CGImage.PropertyName
    static let gifUnclampedDelayTime = kCGImagePropertyGIFUnclampedDelayTime as CGImage.PropertyName
    static let gifCanvasPixelWidth = kCGImagePropertyGIFCanvasPixelWidth as CGImage.PropertyName
    static let gifCanvasPixelHeight = kCGImagePropertyGIFCanvasPixelHeight as CGImage.PropertyName
    static let gifFrameInfoArray = kCGImagePropertyGIFFrameInfoArray as CGImage.PropertyName
}

/// For kCGImagePropertyPNGDictionary
public extension CGImage.PropertyName {
    static let pngAuthor = kCGImagePropertyPNGAuthor as CGImage.PropertyName
    static let pngChromaticities = kCGImagePropertyPNGChromaticities as CGImage.PropertyName
    static let pngComment = kCGImagePropertyPNGComment as CGImage.PropertyName
    static let pngCopyright = kCGImagePropertyPNGCopyright as CGImage.PropertyName
    static let pngCreationTime = kCGImagePropertyPNGCreationTime as CGImage.PropertyName
    static let pngDescription = kCGImagePropertyPNGDescription as CGImage.PropertyName
    static let pngDisclaimer = kCGImagePropertyPNGDisclaimer as CGImage.PropertyName
    static let pngGamma = kCGImagePropertyPNGGamma as CGImage.PropertyName
    static let pngInterlaceType = kCGImagePropertyPNGInterlaceType as CGImage.PropertyName
    static let pngModificationTime = kCGImagePropertyPNGModificationTime as CGImage.PropertyName
    static let pngSoftware = kCGImagePropertyPNGSoftware as CGImage.PropertyName
    static let pngSource = kCGImagePropertyPNGSource as CGImage.PropertyName
    static let pngsRGBIntent = kCGImagePropertyPNGsRGBIntent as CGImage.PropertyName
    static let pngTitle = kCGImagePropertyPNGTitle as CGImage.PropertyName
    static let pngWarning = kCGImagePropertyPNGWarning as CGImage.PropertyName
    static let pngXPixelsPerMeter = kCGImagePropertyPNGXPixelsPerMeter as CGImage.PropertyName
    static let pngYPixelsPerMeter = kCGImagePropertyPNGYPixelsPerMeter as CGImage.PropertyName
    
    static let apngLoopCount = kCGImagePropertyAPNGLoopCount as CGImage.PropertyName
    static let apngDelayTime = kCGImagePropertyAPNGDelayTime as CGImage.PropertyName
    static let apngUnclampedDelayTime = kCGImagePropertyAPNGUnclampedDelayTime as CGImage.PropertyName
    static let apngFrameInfoArray = kCGImagePropertyAPNGFrameInfoArray as CGImage.PropertyName
    static let apngCanvasPixelWidth = kCGImagePropertyAPNGCanvasPixelWidth as CGImage.PropertyName
    static let apngCanvasPixelHeight = kCGImagePropertyAPNGCanvasPixelHeight as CGImage.PropertyName
}

/// For kCGImagePropertyGPSDictionary
public extension CGImage.PropertyName {
    static let gpsVersion = kCGImagePropertyGPSVersion as CGImage.PropertyName
    static let gpsLatitudeRef = kCGImagePropertyGPSLatitudeRef as CGImage.PropertyName
    static let gpsLatitude = kCGImagePropertyGPSLatitude as CGImage.PropertyName
    static let gpsLongitudeRef = kCGImagePropertyGPSLongitudeRef as CGImage.PropertyName
    static let gpsLongitude = kCGImagePropertyGPSLongitude as CGImage.PropertyName
    static let gpsAltitudeRef = kCGImagePropertyGPSAltitudeRef as CGImage.PropertyName
    static let gpsAltitude = kCGImagePropertyGPSAltitude as CGImage.PropertyName
    static let gpsTimeStamp = kCGImagePropertyGPSTimeStamp as CGImage.PropertyName
    static let gpsSatellites = kCGImagePropertyGPSSatellites as CGImage.PropertyName
    static let gpsStatus = kCGImagePropertyGPSStatus as CGImage.PropertyName
    static let gpsMeasureMode = kCGImagePropertyGPSMeasureMode as CGImage.PropertyName
    static let gpsDOP = kCGImagePropertyGPSDOP as CGImage.PropertyName
    static let gpsSpeedRef = kCGImagePropertyGPSSpeedRef as CGImage.PropertyName
    static let gpsSpeed = kCGImagePropertyGPSSpeed as CGImage.PropertyName
    static let gpsTrackRef = kCGImagePropertyGPSTrackRef as CGImage.PropertyName
    static let gpsTrack = kCGImagePropertyGPSTrack as CGImage.PropertyName
    static let gpsImgDirectionRef = kCGImagePropertyGPSImgDirectionRef as CGImage.PropertyName
    static let gpsImgDirection = kCGImagePropertyGPSImgDirection as CGImage.PropertyName
    static let gpsMapDatum = kCGImagePropertyGPSMapDatum as CGImage.PropertyName
    static let gpsDestLatitudeRef = kCGImagePropertyGPSDestLatitudeRef as CGImage.PropertyName
    static let gpsDestLatitude = kCGImagePropertyGPSDestLatitude as CGImage.PropertyName
    static let gpsDestLongitudeRef = kCGImagePropertyGPSDestLongitudeRef as CGImage.PropertyName
    static let gpsDestLongitude = kCGImagePropertyGPSDestLongitude as CGImage.PropertyName
    static let gpsDestBearingRef = kCGImagePropertyGPSDestBearingRef as CGImage.PropertyName
    static let gpsDestBearing = kCGImagePropertyGPSDestBearing as CGImage.PropertyName
    static let gpsDestDistanceRef = kCGImagePropertyGPSDestDistanceRef as CGImage.PropertyName
    static let gpsDestDistance = kCGImagePropertyGPSDestDistance as CGImage.PropertyName
    static let gpsProcessingMethod = kCGImagePropertyGPSProcessingMethod as CGImage.PropertyName
    static let gpsAreaInformation = kCGImagePropertyGPSAreaInformation as CGImage.PropertyName
    static let gpsDateStamp = kCGImagePropertyGPSDateStamp as CGImage.PropertyName
    static let gpsDifferental = kCGImagePropertyGPSDifferental as CGImage.PropertyName
    static let gpsHPositioningError = kCGImagePropertyGPSHPositioningError as CGImage.PropertyName
}

/// For kCGImagePropertyIPTCDictionary
public extension CGImage.PropertyName {
    static let iptcObjectTypeReference = kCGImagePropertyIPTCObjectTypeReference as CGImage.PropertyName
    static let iptcObjectAttributeReference = kCGImagePropertyIPTCObjectAttributeReference as CGImage.PropertyName
    static let iptcObjectName = kCGImagePropertyIPTCObjectName as CGImage.PropertyName
    static let iptcEditStatus = kCGImagePropertyIPTCEditStatus as CGImage.PropertyName
    static let iptcEditorialUpdate = kCGImagePropertyIPTCEditorialUpdate as CGImage.PropertyName
    static let iptcUrgency = kCGImagePropertyIPTCUrgency as CGImage.PropertyName
    static let iptcSubjectReference = kCGImagePropertyIPTCSubjectReference as CGImage.PropertyName
    static let iptcCategory = kCGImagePropertyIPTCCategory as CGImage.PropertyName
    static let iptcSupplementalCategory = kCGImagePropertyIPTCSupplementalCategory as CGImage.PropertyName
    static let iptcFixtureIdentifier = kCGImagePropertyIPTCFixtureIdentifier as CGImage.PropertyName
    static let iptcKeywords = kCGImagePropertyIPTCKeywords as CGImage.PropertyName
    static let iptcContentLocationCode = kCGImagePropertyIPTCContentLocationCode as CGImage.PropertyName
    static let iptcContentLocationName = kCGImagePropertyIPTCContentLocationName as CGImage.PropertyName
    static let iptcReleaseDate = kCGImagePropertyIPTCReleaseDate as CGImage.PropertyName
    static let iptcReleaseTime = kCGImagePropertyIPTCReleaseTime as CGImage.PropertyName
    static let iptcExpirationDate = kCGImagePropertyIPTCExpirationDate as CGImage.PropertyName
    static let iptcExpirationTime = kCGImagePropertyIPTCExpirationTime as CGImage.PropertyName
    static let iptcSpecialInstructions = kCGImagePropertyIPTCSpecialInstructions as CGImage.PropertyName
    static let iptcActionAdvised = kCGImagePropertyIPTCActionAdvised as CGImage.PropertyName
    static let iptcReferenceService = kCGImagePropertyIPTCReferenceService as CGImage.PropertyName
    static let iptcReferenceDate = kCGImagePropertyIPTCReferenceDate as CGImage.PropertyName
    static let iptcReferenceNumber = kCGImagePropertyIPTCReferenceNumber as CGImage.PropertyName
    static let iptcDateCreated = kCGImagePropertyIPTCDateCreated as CGImage.PropertyName
    static let iptcTimeCreated = kCGImagePropertyIPTCTimeCreated as CGImage.PropertyName
    static let iptcDigitalCreationDate = kCGImagePropertyIPTCDigitalCreationDate as CGImage.PropertyName
    static let iptcDigitalCreationTime = kCGImagePropertyIPTCDigitalCreationTime as CGImage.PropertyName
    static let iptcOriginatingProgram = kCGImagePropertyIPTCOriginatingProgram as CGImage.PropertyName
    static let iptcProgramVersion = kCGImagePropertyIPTCProgramVersion as CGImage.PropertyName
    static let iptcObjectCycle = kCGImagePropertyIPTCObjectCycle as CGImage.PropertyName
    static let iptcByline = kCGImagePropertyIPTCByline as CGImage.PropertyName
    static let iptcBylineTitle = kCGImagePropertyIPTCBylineTitle as CGImage.PropertyName
    static let iptcCity = kCGImagePropertyIPTCCity as CGImage.PropertyName
    static let iptcSubLocation = kCGImagePropertyIPTCSubLocation as CGImage.PropertyName
    static let iptcProvinceState = kCGImagePropertyIPTCProvinceState as CGImage.PropertyName
    static let iptcCountryPrimaryLocationCode = kCGImagePropertyIPTCCountryPrimaryLocationCode as CGImage.PropertyName
    static let iptcCountryPrimaryLocationName = kCGImagePropertyIPTCCountryPrimaryLocationName as CGImage.PropertyName
    static let iptcOriginalTransmissionReference = kCGImagePropertyIPTCOriginalTransmissionReference as CGImage.PropertyName
    static let iptcHeadline = kCGImagePropertyIPTCHeadline as CGImage.PropertyName
    static let iptcCredit = kCGImagePropertyIPTCCredit as CGImage.PropertyName
    static let iptcSource = kCGImagePropertyIPTCSource as CGImage.PropertyName
    static let iptcCopyrightNotice = kCGImagePropertyIPTCCopyrightNotice as CGImage.PropertyName
    static let iptcContact = kCGImagePropertyIPTCContact as CGImage.PropertyName
    static let iptcCaptionAbstract = kCGImagePropertyIPTCCaptionAbstract as CGImage.PropertyName
    static let iptcWriterEditor = kCGImagePropertyIPTCWriterEditor as CGImage.PropertyName
    static let iptcImageType = kCGImagePropertyIPTCImageType as CGImage.PropertyName
    static let iptcImageOrientation = kCGImagePropertyIPTCImageOrientation as CGImage.PropertyName
    static let iptcLanguageIdentifier = kCGImagePropertyIPTCLanguageIdentifier as CGImage.PropertyName
    static let iptcStarRating = kCGImagePropertyIPTCStarRating as CGImage.PropertyName
    static let iptcCreatorContactInfo = kCGImagePropertyIPTCCreatorContactInfo as CGImage.PropertyName
    static let iptcRightsUsageTerms = kCGImagePropertyIPTCRightsUsageTerms as CGImage.PropertyName
    static let iptcScene = kCGImagePropertyIPTCScene as CGImage.PropertyName

    static let iptcExtAboutCvTerm = kCGImagePropertyIPTCExtAboutCvTerm as CGImage.PropertyName
    static let iptcExtAboutCvTermCvId = kCGImagePropertyIPTCExtAboutCvTermCvId as CGImage.PropertyName
    static let iptcExtAboutCvTermId = kCGImagePropertyIPTCExtAboutCvTermId as CGImage.PropertyName
    static let iptcExtAboutCvTermName = kCGImagePropertyIPTCExtAboutCvTermName as CGImage.PropertyName
    static let iptcExtAboutCvTermRefinedAbout = kCGImagePropertyIPTCExtAboutCvTermRefinedAbout as CGImage.PropertyName
    static let iptcExtAddlModelInfo = kCGImagePropertyIPTCExtAddlModelInfo as CGImage.PropertyName
    static let iptcExtArtworkOrObject = kCGImagePropertyIPTCExtArtworkOrObject as CGImage.PropertyName
    static let iptcExtArtworkCircaDateCreated = kCGImagePropertyIPTCExtArtworkCircaDateCreated as CGImage.PropertyName
    static let iptcExtArtworkContentDescription = kCGImagePropertyIPTCExtArtworkContentDescription as CGImage.PropertyName
    static let iptcExtArtworkContributionDescription = kCGImagePropertyIPTCExtArtworkContributionDescription as CGImage.PropertyName
    static let iptcExtArtworkCopyrightNotice = kCGImagePropertyIPTCExtArtworkCopyrightNotice as CGImage.PropertyName
    static let iptcExtArtworkCreator = kCGImagePropertyIPTCExtArtworkCreator as CGImage.PropertyName
    static let iptcExtArtworkCreatorID = kCGImagePropertyIPTCExtArtworkCreatorID as CGImage.PropertyName
    static let iptcExtArtworkCopyrightOwnerID = kCGImagePropertyIPTCExtArtworkCopyrightOwnerID as CGImage.PropertyName
    static let iptcExtArtworkCopyrightOwnerName = kCGImagePropertyIPTCExtArtworkCopyrightOwnerName as CGImage.PropertyName
    static let iptcExtArtworkLicensorID = kCGImagePropertyIPTCExtArtworkLicensorID as CGImage.PropertyName
    static let iptcExtArtworkLicensorName = kCGImagePropertyIPTCExtArtworkLicensorName as CGImage.PropertyName
    static let iptcExtArtworkDateCreated = kCGImagePropertyIPTCExtArtworkDateCreated as CGImage.PropertyName
    static let iptcExtArtworkPhysicalDescription = kCGImagePropertyIPTCExtArtworkPhysicalDescription as CGImage.PropertyName
    static let iptcExtArtworkSource = kCGImagePropertyIPTCExtArtworkSource as CGImage.PropertyName
    static let iptcExtArtworkSourceInventoryNo = kCGImagePropertyIPTCExtArtworkSourceInventoryNo as CGImage.PropertyName
    static let iptcExtArtworkSourceInvURL = kCGImagePropertyIPTCExtArtworkSourceInvURL as CGImage.PropertyName
    static let iptcExtArtworkStylePeriod = kCGImagePropertyIPTCExtArtworkStylePeriod as CGImage.PropertyName
    static let iptcExtArtworkTitle = kCGImagePropertyIPTCExtArtworkTitle as CGImage.PropertyName
    static let iptcExtAudioBitrate = kCGImagePropertyIPTCExtAudioBitrate as CGImage.PropertyName
    static let iptcExtAudioBitrateMode = kCGImagePropertyIPTCExtAudioBitrateMode as CGImage.PropertyName
    static let iptcExtAudioChannelCount = kCGImagePropertyIPTCExtAudioChannelCount as CGImage.PropertyName
    static let iptcExtCircaDateCreated = kCGImagePropertyIPTCExtCircaDateCreated as CGImage.PropertyName
    static let iptcExtContainerFormat = kCGImagePropertyIPTCExtContainerFormat as CGImage.PropertyName
    static let iptcExtContainerFormatIdentifier = kCGImagePropertyIPTCExtContainerFormatIdentifier as CGImage.PropertyName
    static let iptcExtContainerFormatName = kCGImagePropertyIPTCExtContainerFormatName as CGImage.PropertyName
    static let iptcExtContributor = kCGImagePropertyIPTCExtContributor as CGImage.PropertyName
    static let iptcExtContributorIdentifier = kCGImagePropertyIPTCExtContributorIdentifier as CGImage.PropertyName
    static let iptcExtContributorName = kCGImagePropertyIPTCExtContributorName as CGImage.PropertyName
    static let iptcExtContributorRole = kCGImagePropertyIPTCExtContributorRole as CGImage.PropertyName
    static let iptcExtCopyrightYear = kCGImagePropertyIPTCExtCopyrightYear as CGImage.PropertyName
    static let iptcExtCreator = kCGImagePropertyIPTCExtCreator as CGImage.PropertyName
    static let iptcExtCreatorIdentifier = kCGImagePropertyIPTCExtCreatorIdentifier as CGImage.PropertyName
    static let iptcExtCreatorName = kCGImagePropertyIPTCExtCreatorName as CGImage.PropertyName
    static let iptcExtCreatorRole = kCGImagePropertyIPTCExtCreatorRole as CGImage.PropertyName
    static let iptcExtControlledVocabularyTerm = kCGImagePropertyIPTCExtControlledVocabularyTerm as CGImage.PropertyName
    static let iptcExtDataOnScreen = kCGImagePropertyIPTCExtDataOnScreen as CGImage.PropertyName
    static let iptcExtDataOnScreenRegion = kCGImagePropertyIPTCExtDataOnScreenRegion as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionD = kCGImagePropertyIPTCExtDataOnScreenRegionD as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionH = kCGImagePropertyIPTCExtDataOnScreenRegionH as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionText = kCGImagePropertyIPTCExtDataOnScreenRegionText as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionUnit = kCGImagePropertyIPTCExtDataOnScreenRegionUnit as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionW = kCGImagePropertyIPTCExtDataOnScreenRegionW as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionX = kCGImagePropertyIPTCExtDataOnScreenRegionX as CGImage.PropertyName
    static let iptcExtDataOnScreenRegionY = kCGImagePropertyIPTCExtDataOnScreenRegionY as CGImage.PropertyName
    static let iptcExtDigitalImageGUID = kCGImagePropertyIPTCExtDigitalImageGUID as CGImage.PropertyName
    static let iptcExtDigitalSourceFileType = kCGImagePropertyIPTCExtDigitalSourceFileType as CGImage.PropertyName
    static let iptcExtDigitalSourceType = kCGImagePropertyIPTCExtDigitalSourceType as CGImage.PropertyName
    static let iptcExtDopesheet = kCGImagePropertyIPTCExtDopesheet as CGImage.PropertyName
    static let iptcExtDopesheetLink = kCGImagePropertyIPTCExtDopesheetLink as CGImage.PropertyName
    static let iptcExtDopesheetLinkLink = kCGImagePropertyIPTCExtDopesheetLinkLink as CGImage.PropertyName
    static let iptcExtDopesheetLinkLinkQualifier = kCGImagePropertyIPTCExtDopesheetLinkLinkQualifier as CGImage.PropertyName
    static let iptcExtEmbdEncRightsExpr = kCGImagePropertyIPTCExtEmbdEncRightsExpr as CGImage.PropertyName
    static let iptcExtEmbeddedEncodedRightsExpr = kCGImagePropertyIPTCExtEmbeddedEncodedRightsExpr as CGImage.PropertyName
    static let iptcExtEmbeddedEncodedRightsExprType = kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprType as CGImage.PropertyName
    static let iptcExtEmbeddedEncodedRightsExprLangID = kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprLangID as CGImage.PropertyName
    static let iptcExtEpisode = kCGImagePropertyIPTCExtEpisode as CGImage.PropertyName
    static let iptcExtEpisodeIdentifier = kCGImagePropertyIPTCExtEpisodeIdentifier as CGImage.PropertyName
    static let iptcExtEpisodeName = kCGImagePropertyIPTCExtEpisodeName as CGImage.PropertyName
    static let iptcExtEpisodeNumber = kCGImagePropertyIPTCExtEpisodeNumber as CGImage.PropertyName
    static let iptcExtEvent = kCGImagePropertyIPTCExtEvent as CGImage.PropertyName
    static let iptcExtShownEvent = kCGImagePropertyIPTCExtShownEvent as CGImage.PropertyName
    static let iptcExtShownEventIdentifier = kCGImagePropertyIPTCExtShownEventIdentifier as CGImage.PropertyName
    static let iptcExtShownEventName = kCGImagePropertyIPTCExtShownEventName as CGImage.PropertyName
    static let iptcExtExternalMetadataLink = kCGImagePropertyIPTCExtExternalMetadataLink as CGImage.PropertyName
    static let iptcExtFeedIdentifier = kCGImagePropertyIPTCExtFeedIdentifier as CGImage.PropertyName
    static let iptcExtGenre = kCGImagePropertyIPTCExtGenre as CGImage.PropertyName
    static let iptcExtGenreCvId = kCGImagePropertyIPTCExtGenreCvId as CGImage.PropertyName
    static let iptcExtGenreCvTermId = kCGImagePropertyIPTCExtGenreCvTermId as CGImage.PropertyName
    static let iptcExtGenreCvTermName = kCGImagePropertyIPTCExtGenreCvTermName as CGImage.PropertyName
    static let iptcExtGenreCvTermRefinedAbout = kCGImagePropertyIPTCExtGenreCvTermRefinedAbout as CGImage.PropertyName
    static let iptcExtHeadline = kCGImagePropertyIPTCExtHeadline as CGImage.PropertyName
    static let iptcExtIPTCLastEdited = kCGImagePropertyIPTCExtIPTCLastEdited as CGImage.PropertyName
    static let iptcExtLinkedEncRightsExpr = kCGImagePropertyIPTCExtLinkedEncRightsExpr as CGImage.PropertyName
    static let iptcExtLinkedEncodedRightsExpr = kCGImagePropertyIPTCExtLinkedEncodedRightsExpr as CGImage.PropertyName
    static let iptcExtLinkedEncodedRightsExprType = kCGImagePropertyIPTCExtLinkedEncodedRightsExprType as CGImage.PropertyName
    static let iptcExtLinkedEncodedRightsExprLangID = kCGImagePropertyIPTCExtLinkedEncodedRightsExprLangID as CGImage.PropertyName
    static let iptcExtLocationCreated = kCGImagePropertyIPTCExtLocationCreated as CGImage.PropertyName
    static let iptcExtLocationCity = kCGImagePropertyIPTCExtLocationCity as CGImage.PropertyName
    static let iptcExtLocationCountryCode = kCGImagePropertyIPTCExtLocationCountryCode as CGImage.PropertyName
    static let iptcExtLocationCountryName = kCGImagePropertyIPTCExtLocationCountryName as CGImage.PropertyName
    static let iptcExtLocationGPSAltitude = kCGImagePropertyIPTCExtLocationGPSAltitude as CGImage.PropertyName
    static let iptcExtLocationGPSLatitude = kCGImagePropertyIPTCExtLocationGPSLatitude as CGImage.PropertyName
    static let iptcExtLocationGPSLongitude = kCGImagePropertyIPTCExtLocationGPSLongitude as CGImage.PropertyName
    static let iptcExtLocationIdentifier = kCGImagePropertyIPTCExtLocationIdentifier as CGImage.PropertyName
    static let iptcExtLocationLocationId = kCGImagePropertyIPTCExtLocationLocationId as CGImage.PropertyName
    static let iptcExtLocationLocationName = kCGImagePropertyIPTCExtLocationLocationName as CGImage.PropertyName
    static let iptcExtLocationProvinceState = kCGImagePropertyIPTCExtLocationProvinceState as CGImage.PropertyName
    static let iptcExtLocationSublocation = kCGImagePropertyIPTCExtLocationSublocation as CGImage.PropertyName
    static let iptcExtLocationWorldRegion = kCGImagePropertyIPTCExtLocationWorldRegion as CGImage.PropertyName
    static let iptcExtLocationShown = kCGImagePropertyIPTCExtLocationShown as CGImage.PropertyName
    static let iptcExtMaxAvailHeight = kCGImagePropertyIPTCExtMaxAvailHeight as CGImage.PropertyName
    static let iptcExtMaxAvailWidth = kCGImagePropertyIPTCExtMaxAvailWidth as CGImage.PropertyName
    static let iptcExtModelAge = kCGImagePropertyIPTCExtModelAge as CGImage.PropertyName
    static let iptcExtOrganisationInImageCode = kCGImagePropertyIPTCExtOrganisationInImageCode as CGImage.PropertyName
    static let iptcExtOrganisationInImageName = kCGImagePropertyIPTCExtOrganisationInImageName as CGImage.PropertyName
    static let iptcExtPersonHeard = kCGImagePropertyIPTCExtPersonHeard as CGImage.PropertyName
    static let iptcExtPersonHeardIdentifier = kCGImagePropertyIPTCExtPersonHeardIdentifier as CGImage.PropertyName
    static let iptcExtPersonHeardName = kCGImagePropertyIPTCExtPersonHeardName as CGImage.PropertyName
    static let iptcExtPersonInImage = kCGImagePropertyIPTCExtPersonInImage as CGImage.PropertyName
    static let iptcExtPersonInImageWDetails = kCGImagePropertyIPTCExtPersonInImageWDetails as CGImage.PropertyName
    static let iptcExtPersonInImageCharacteristic = kCGImagePropertyIPTCExtPersonInImageCharacteristic as CGImage.PropertyName
    static let iptcExtPersonInImageCvTermCvId = kCGImagePropertyIPTCExtPersonInImageCvTermCvId as CGImage.PropertyName
    static let iptcExtPersonInImageCvTermId = kCGImagePropertyIPTCExtPersonInImageCvTermId as CGImage.PropertyName
    static let iptcExtPersonInImageCvTermName = kCGImagePropertyIPTCExtPersonInImageCvTermName as CGImage.PropertyName
    static let iptcExtPersonInImageCvTermRefinedAbout = kCGImagePropertyIPTCExtPersonInImageCvTermRefinedAbout as CGImage.PropertyName
    static let iptcExtPersonInImageDescription = kCGImagePropertyIPTCExtPersonInImageDescription as CGImage.PropertyName
    static let iptcExtPersonInImageId = kCGImagePropertyIPTCExtPersonInImageId as CGImage.PropertyName
    static let iptcExtPersonInImageName = kCGImagePropertyIPTCExtPersonInImageName as CGImage.PropertyName
    static let iptcExtProductInImage = kCGImagePropertyIPTCExtProductInImage as CGImage.PropertyName
    static let iptcExtProductInImageDescription = kCGImagePropertyIPTCExtProductInImageDescription as CGImage.PropertyName
    static let iptcExtProductInImageGTIN = kCGImagePropertyIPTCExtProductInImageGTIN as CGImage.PropertyName
    static let iptcExtProductInImageName = kCGImagePropertyIPTCExtProductInImageName as CGImage.PropertyName
    static let iptcExtstaticationEvent = kCGImagePropertyIPTCExtstaticationEvent as CGImage.PropertyName
    static let iptcExtstaticationEventDate = kCGImagePropertyIPTCExtstaticationEventDate as CGImage.PropertyName
    static let iptcExtstaticationEventIdentifier = kCGImagePropertyIPTCExtstaticationEventIdentifier as CGImage.PropertyName
    static let iptcExtstaticationEventName = kCGImagePropertyIPTCExtstaticationEventName as CGImage.PropertyName
    static let iptcExtRating = kCGImagePropertyIPTCExtRating as CGImage.PropertyName
    static let iptcExtRatingRatingRegion = kCGImagePropertyIPTCExtRatingRatingRegion as CGImage.PropertyName
    static let iptcExtRatingRegionCity = kCGImagePropertyIPTCExtRatingRegionCity as CGImage.PropertyName
    static let iptcExtRatingRegionCountryCode = kCGImagePropertyIPTCExtRatingRegionCountryCode as CGImage.PropertyName
    static let iptcExtRatingRegionCountryName = kCGImagePropertyIPTCExtRatingRegionCountryName as CGImage.PropertyName
    static let iptcExtRatingRegionGPSAltitude = kCGImagePropertyIPTCExtRatingRegionGPSAltitude as CGImage.PropertyName
    static let iptcExtRatingRegionGPSLatitude = kCGImagePropertyIPTCExtRatingRegionGPSLatitude as CGImage.PropertyName
    static let iptcExtRatingRegionGPSLongitude = kCGImagePropertyIPTCExtRatingRegionGPSLongitude as CGImage.PropertyName
    static let iptcExtRatingRegionIdentifier = kCGImagePropertyIPTCExtRatingRegionIdentifier as CGImage.PropertyName
    static let iptcExtRatingRegionLocationId = kCGImagePropertyIPTCExtRatingRegionLocationId as CGImage.PropertyName
    static let iptcExtRatingRegionLocationName = kCGImagePropertyIPTCExtRatingRegionLocationName as CGImage.PropertyName
    static let iptcExtRatingRegionProvinceState = kCGImagePropertyIPTCExtRatingRegionProvinceState as CGImage.PropertyName
    static let iptcExtRatingRegionSublocation = kCGImagePropertyIPTCExtRatingRegionSublocation as CGImage.PropertyName
    static let iptcExtRatingRegionWorldRegion = kCGImagePropertyIPTCExtRatingRegionWorldRegion as CGImage.PropertyName
    static let iptcExtRatingScaleMaxValue = kCGImagePropertyIPTCExtRatingScaleMaxValue as CGImage.PropertyName
    static let iptcExtRatingScaleMinValue = kCGImagePropertyIPTCExtRatingScaleMinValue as CGImage.PropertyName
    static let iptcExtRatingSourceLink = kCGImagePropertyIPTCExtRatingSourceLink as CGImage.PropertyName
    static let iptcExtRatingValue = kCGImagePropertyIPTCExtRatingValue as CGImage.PropertyName
    static let iptcExtRatingValueLogoLink = kCGImagePropertyIPTCExtRatingValueLogoLink as CGImage.PropertyName
    static let iptcExtRegistryID = kCGImagePropertyIPTCExtRegistryID as CGImage.PropertyName
    static let iptcExtRegistryEntryRole = kCGImagePropertyIPTCExtRegistryEntryRole as CGImage.PropertyName
    static let iptcExtRegistryItemID = kCGImagePropertyIPTCExtRegistryItemID as CGImage.PropertyName
    static let iptcExtRegistryOrganisationID = kCGImagePropertyIPTCExtRegistryOrganisationID as CGImage.PropertyName
    static let iptcExtReleaseReady = kCGImagePropertyIPTCExtReleaseReady as CGImage.PropertyName
    static let iptcExtSeason = kCGImagePropertyIPTCExtSeason as CGImage.PropertyName
    static let iptcExtSeasonIdentifier = kCGImagePropertyIPTCExtSeasonIdentifier as CGImage.PropertyName
    static let iptcExtSeasonName = kCGImagePropertyIPTCExtSeasonName as CGImage.PropertyName
    static let iptcExtSeasonNumber = kCGImagePropertyIPTCExtSeasonNumber as CGImage.PropertyName
    static let iptcExtSeries = kCGImagePropertyIPTCExtSeries as CGImage.PropertyName
    static let iptcExtSeriesIdentifier = kCGImagePropertyIPTCExtSeriesIdentifier as CGImage.PropertyName
    static let iptcExtSeriesName = kCGImagePropertyIPTCExtSeriesName as CGImage.PropertyName
    static let iptcExtStorylineIdentifier = kCGImagePropertyIPTCExtStorylineIdentifier as CGImage.PropertyName
    static let iptcExtStreamReady = kCGImagePropertyIPTCExtStreamReady as CGImage.PropertyName
    static let iptcExtStylePeriod = kCGImagePropertyIPTCExtStylePeriod as CGImage.PropertyName
    static let iptcExtSupplyChainSource = kCGImagePropertyIPTCExtSupplyChainSource as CGImage.PropertyName
    static let iptcExtSupplyChainSourceIdentifier = kCGImagePropertyIPTCExtSupplyChainSourceIdentifier as CGImage.PropertyName
    static let iptcExtSupplyChainSourceName = kCGImagePropertyIPTCExtSupplyChainSourceName as CGImage.PropertyName
    static let iptcExtTemporalCoverage = kCGImagePropertyIPTCExtTemporalCoverage as CGImage.PropertyName
    static let iptcExtTemporalCoverageFrom = kCGImagePropertyIPTCExtTemporalCoverageFrom as CGImage.PropertyName
    static let iptcExtTemporalCoverageTo = kCGImagePropertyIPTCExtTemporalCoverageTo as CGImage.PropertyName
    static let iptcExtTranscript = kCGImagePropertyIPTCExtTranscript as CGImage.PropertyName
    static let iptcExtTranscriptLink = kCGImagePropertyIPTCExtTranscriptLink as CGImage.PropertyName
    static let iptcExtTranscriptLinkLink = kCGImagePropertyIPTCExtTranscriptLinkLink as CGImage.PropertyName
    static let iptcExtTranscriptLinkLinkQualifier = kCGImagePropertyIPTCExtTranscriptLinkLinkQualifier as CGImage.PropertyName
    static let iptcExtVideoBitrate = kCGImagePropertyIPTCExtVideoBitrate as CGImage.PropertyName
    static let iptcExtVideoBitrateMode = kCGImagePropertyIPTCExtVideoBitrateMode as CGImage.PropertyName
    static let iptcExtVideoDisplayAspectRatio = kCGImagePropertyIPTCExtVideoDisplayAspectRatio as CGImage.PropertyName
    static let iptcExtVideoEncodingProfile = kCGImagePropertyIPTCExtVideoEncodingProfile as CGImage.PropertyName
    static let iptcExtVideoShotType = kCGImagePropertyIPTCExtVideoShotType as CGImage.PropertyName
    static let iptcExtVideoShotTypeIdentifier = kCGImagePropertyIPTCExtVideoShotTypeIdentifier as CGImage.PropertyName
    static let iptcExtVideoShotTypeName = kCGImagePropertyIPTCExtVideoShotTypeName as CGImage.PropertyName
    static let iptcExtVideoStreamsCount = kCGImagePropertyIPTCExtVideoStreamsCount as CGImage.PropertyName
    static let iptcExtVisualColor = kCGImagePropertyIPTCExtVisualColor as CGImage.PropertyName
    static let iptcExtWorkflowTag = kCGImagePropertyIPTCExtWorkflowTag as CGImage.PropertyName
    static let iptcExtWorkflowTagCvId = kCGImagePropertyIPTCExtWorkflowTagCvId as CGImage.PropertyName
    static let iptcExtWorkflowTagCvTermId = kCGImagePropertyIPTCExtWorkflowTagCvTermId as CGImage.PropertyName
    static let iptcExtWorkflowTagCvTermName = kCGImagePropertyIPTCExtWorkflowTagCvTermName as CGImage.PropertyName
    static let iptcExtWorkflowTagCvTermRefinedAbout = kCGImagePropertyIPTCExtWorkflowTagCvTermRefinedAbout as CGImage.PropertyName
}

/// For kCGImageProperty8BIMDictionary
public extension CGImage.PropertyName {
    static let _8BIMLayerNames = kCGImageProperty8BIMLayerNames as CGImage.PropertyName
    static let _8BIMVersion = kCGImageProperty8BIMVersion as CGImage.PropertyName
}

/// For kCGImagePropertyDNGDictionary
public extension CGImage.PropertyName {
    static let dngVersion = kCGImagePropertyDNGVersion as CGImage.PropertyName
    static let dngBackwardVersion = kCGImagePropertyDNGBackwardVersion as CGImage.PropertyName
    static let dngUniqueCameraModel = kCGImagePropertyDNGUniqueCameraModel as CGImage.PropertyName
    static let dngLocalizedCameraModel = kCGImagePropertyDNGLocalizedCameraModel as CGImage.PropertyName
    static let dngCameraSerialNumber = kCGImagePropertyDNGCameraSerialNumber as CGImage.PropertyName
    static let dngLensInfo = kCGImagePropertyDNGLensInfo as CGImage.PropertyName
    static let dngBlackLevel = kCGImagePropertyDNGBlackLevel as CGImage.PropertyName
    static let dngWhiteLevel = kCGImagePropertyDNGWhiteLevel as CGImage.PropertyName
    static let dngCalibrationIlluminant1 = kCGImagePropertyDNGCalibrationIlluminant1 as CGImage.PropertyName
    static let dngCalibrationIlluminant2 = kCGImagePropertyDNGCalibrationIlluminant2 as CGImage.PropertyName
    static let dngColorMatrix1 = kCGImagePropertyDNGColorMatrix1 as CGImage.PropertyName
    static let dngColorMatrix2 = kCGImagePropertyDNGColorMatrix2 as CGImage.PropertyName
    static let dngCameraCalibration1 = kCGImagePropertyDNGCameraCalibration1 as CGImage.PropertyName
    static let dngCameraCalibration2 = kCGImagePropertyDNGCameraCalibration2 as CGImage.PropertyName
    static let dngAsShotNeutral = kCGImagePropertyDNGAsShotNeutral as CGImage.PropertyName
    static let dngAsShotWhiteXY = kCGImagePropertyDNGAsShotWhiteXY as CGImage.PropertyName
    static let dngBaselineExposure = kCGImagePropertyDNGBaselineExposure as CGImage.PropertyName
    static let dngBaselineNoise = kCGImagePropertyDNGBaselineNoise as CGImage.PropertyName
    static let dngBaselineSharpness = kCGImagePropertyDNGBaselineSharpness as CGImage.PropertyName
    static let dngPrivateData = kCGImagePropertyDNGPrivateData as CGImage.PropertyName
    static let dngCameraCalibrationSignature = kCGImagePropertyDNGCameraCalibrationSignature as CGImage.PropertyName
    static let dngProfileCalibrationSignature = kCGImagePropertyDNGProfileCalibrationSignature as CGImage.PropertyName
    static let dngNoiseProfile = kCGImagePropertyDNGNoiseProfile as CGImage.PropertyName
    static let dngWarpRectilinear = kCGImagePropertyDNGWarpRectilinear as CGImage.PropertyName
    static let dngWarpFisheye = kCGImagePropertyDNGWarpFisheye as CGImage.PropertyName
    static let dngFixVignetteRadial = kCGImagePropertyDNGFixVignetteRadial as CGImage.PropertyName

    static let dngActiveArea = kCGImagePropertyDNGActiveArea as CGImage.PropertyName
    static let dngAnalogBalance = kCGImagePropertyDNGAnalogBalance as CGImage.PropertyName
    static let dngAntiAliasStrength = kCGImagePropertyDNGAntiAliasStrength as CGImage.PropertyName
    static let dngAsShotICCProfile = kCGImagePropertyDNGAsShotICCProfile as CGImage.PropertyName
    static let dngAsShotPreProfileMatrix = kCGImagePropertyDNGAsShotPreProfileMatrix as CGImage.PropertyName
    static let dngAsShotProfileName = kCGImagePropertyDNGAsShotProfileName as CGImage.PropertyName
    static let dngBaselineExposureOffset = kCGImagePropertyDNGBaselineExposureOffset as CGImage.PropertyName
    static let dngBayerGreenSplit = kCGImagePropertyDNGBayerGreenSplit as CGImage.PropertyName
    static let dngBestQualityScale = kCGImagePropertyDNGBestQualityScale as CGImage.PropertyName
    static let dngBlackLevelDeltaH = kCGImagePropertyDNGBlackLevelDeltaH as CGImage.PropertyName
    static let dngBlackLevelDeltaV = kCGImagePropertyDNGBlackLevelDeltaV as CGImage.PropertyName
    static let dngBlackLevelRepeatDim = kCGImagePropertyDNGBlackLevelRepeatDim as CGImage.PropertyName
    static let dngCFALayout = kCGImagePropertyDNGCFALayout as CGImage.PropertyName
    static let dngCFAPlaneColor = kCGImagePropertyDNGCFAPlaneColor as CGImage.PropertyName
    static let dngChromaBlurRadius = kCGImagePropertyDNGChromaBlurRadius as CGImage.PropertyName
    static let dngColorimetricReference = kCGImagePropertyDNGColorimetricReference as CGImage.PropertyName
    static let dngCurrentICCProfile = kCGImagePropertyDNGCurrentICCProfile as CGImage.PropertyName
    static let dngCurrentPreProfileMatrix = kCGImagePropertyDNGCurrentPreProfileMatrix as CGImage.PropertyName
    static let dngDefaultBlackRender = kCGImagePropertyDNGDefaultBlackRender as CGImage.PropertyName
    static let dngDefaultCropOrigin = kCGImagePropertyDNGDefaultCropOrigin as CGImage.PropertyName
    static let dngDefaultCropSize = kCGImagePropertyDNGDefaultCropSize as CGImage.PropertyName
    static let dngDefaultScale = kCGImagePropertyDNGDefaultScale as CGImage.PropertyName
    static let dngDefaultUserCrop = kCGImagePropertyDNGDefaultUserCrop as CGImage.PropertyName
    static let dngExtraCameraProfiles = kCGImagePropertyDNGExtraCameraProfiles as CGImage.PropertyName
    static let dngForwardMatrix1 = kCGImagePropertyDNGForwardMatrix1 as CGImage.PropertyName
    static let dngForwardMatrix2 = kCGImagePropertyDNGForwardMatrix2 as CGImage.PropertyName
    static let dngLinearizationTable = kCGImagePropertyDNGLinearizationTable as CGImage.PropertyName
    static let dngLinearResponseLimit = kCGImagePropertyDNGLinearResponseLimit as CGImage.PropertyName
    static let dngMakerNoteSafety = kCGImagePropertyDNGMakerNoteSafety as CGImage.PropertyName
    static let dngMaskedAreas = kCGImagePropertyDNGMaskedAreas as CGImage.PropertyName
    static let dngNewRawImageDigest = kCGImagePropertyDNGNewRawImageDigest as CGImage.PropertyName
    static let dngNoiseReductionApplied = kCGImagePropertyDNGNoiseReductionApplied as CGImage.PropertyName
    static let dngOpcodeList1 = kCGImagePropertyDNGOpcodeList1 as CGImage.PropertyName
    static let dngOpcodeList2 = kCGImagePropertyDNGOpcodeList2 as CGImage.PropertyName
    static let dngOpcodeList3 = kCGImagePropertyDNGOpcodeList3 as CGImage.PropertyName
    static let dngOriginalBestQualityFinalSize = kCGImagePropertyDNGOriginalBestQualityFinalSize as CGImage.PropertyName
    static let dngOriginalDefaultCropSize = kCGImagePropertyDNGOriginalDefaultCropSize as CGImage.PropertyName
    static let dngOriginalDefaultFinalSize = kCGImagePropertyDNGOriginalDefaultFinalSize as CGImage.PropertyName
    static let dngOriginalRawFileData = kCGImagePropertyDNGOriginalRawFileData as CGImage.PropertyName
    static let dngOriginalRawFileDigest = kCGImagePropertyDNGOriginalRawFileDigest as CGImage.PropertyName
    static let dngOriginalRawFileName = kCGImagePropertyDNGOriginalRawFileName as CGImage.PropertyName
    static let dngPreviewApplicationName = kCGImagePropertyDNGPreviewApplicationName as CGImage.PropertyName
    static let dngPreviewApplicationVersion = kCGImagePropertyDNGPreviewApplicationVersion as CGImage.PropertyName
    static let dngPreviewColorSpace = kCGImagePropertyDNGPreviewColorSpace as CGImage.PropertyName
    static let dngPreviewDateTime = kCGImagePropertyDNGPreviewDateTime as CGImage.PropertyName
    static let dngPreviewSettingsDigest = kCGImagePropertyDNGPreviewSettingsDigest as CGImage.PropertyName
    static let dngPreviewSettingsName = kCGImagePropertyDNGPreviewSettingsName as CGImage.PropertyName
    static let dngProfileCopyright = kCGImagePropertyDNGProfileCopyright as CGImage.PropertyName
    static let dngProfileEmbedPolicy = kCGImagePropertyDNGProfileEmbedPolicy as CGImage.PropertyName
    static let dngProfileHueSatMapData1 = kCGImagePropertyDNGProfileHueSatMapData1 as CGImage.PropertyName
    static let dngProfileHueSatMapData2 = kCGImagePropertyDNGProfileHueSatMapData2 as CGImage.PropertyName
    static let dngProfileHueSatMapDims = kCGImagePropertyDNGProfileHueSatMapDims as CGImage.PropertyName
    static let dngProfileHueSatMapEncoding = kCGImagePropertyDNGProfileHueSatMapEncoding as CGImage.PropertyName
    static let dngProfileLookTableData = kCGImagePropertyDNGProfileLookTableData as CGImage.PropertyName
    static let dngProfileLookTableDims = kCGImagePropertyDNGProfileLookTableDims as CGImage.PropertyName
    static let dngProfileLookTableEncoding = kCGImagePropertyDNGProfileLookTableEncoding as CGImage.PropertyName
    static let dngProfileName = kCGImagePropertyDNGProfileName as CGImage.PropertyName
    static let dngProfileToneCurve = kCGImagePropertyDNGProfileToneCurve as CGImage.PropertyName
    static let dngRawDataUniqueID = kCGImagePropertyDNGRawDataUniqueID as CGImage.PropertyName
    static let dngRawImageDigest = kCGImagePropertyDNGRawImageDigest as CGImage.PropertyName
    static let dngRawToPreviewGain = kCGImagePropertyDNGRawToPreviewGain as CGImage.PropertyName
    static let dngReductionMatrix1 = kCGImagePropertyDNGReductionMatrix1 as CGImage.PropertyName
    static let dngReductionMatrix2 = kCGImagePropertyDNGReductionMatrix2 as CGImage.PropertyName
    static let dngRowInterleaveFactor = kCGImagePropertyDNGRowInterleaveFactor as CGImage.PropertyName
    static let dngShadowScale = kCGImagePropertyDNGShadowScale as CGImage.PropertyName
    static let dngSubTileBlockSize = kCGImagePropertyDNGSubTileBlockSize as CGImage.PropertyName
}

/// For kCGImagePropertyCIFFDictionary
public extension CGImage.PropertyName {
    static let ciffDescription = kCGImagePropertyCIFFDescription as CGImage.PropertyName
    static let ciffFirmware = kCGImagePropertyCIFFFirmware as CGImage.PropertyName
    static let ciffOwnerName = kCGImagePropertyCIFFOwnerName as CGImage.PropertyName
    static let ciffImageName = kCGImagePropertyCIFFImageName as CGImage.PropertyName
    static let ciffImageFileName = kCGImagePropertyCIFFImageFileName as CGImage.PropertyName
    static let ciffReleaseMethod = kCGImagePropertyCIFFReleaseMethod as CGImage.PropertyName
    static let ciffReleaseTiming = kCGImagePropertyCIFFReleaseTiming as CGImage.PropertyName
    static let ciffRecordID = kCGImagePropertyCIFFRecordID as CGImage.PropertyName
    static let ciffSelfTimingTime = kCGImagePropertyCIFFSelfTimingTime as CGImage.PropertyName
    static let ciffCameraSerialNumber = kCGImagePropertyCIFFCameraSerialNumber as CGImage.PropertyName
    static let ciffImageSerialNumber = kCGImagePropertyCIFFImageSerialNumber as CGImage.PropertyName
    static let ciffContinuousDrive = kCGImagePropertyCIFFContinuousDrive as CGImage.PropertyName
    static let ciffFocusMode = kCGImagePropertyCIFFFocusMode as CGImage.PropertyName
    static let ciffMeteringMode = kCGImagePropertyCIFFMeteringMode as CGImage.PropertyName
    static let ciffShootingMode = kCGImagePropertyCIFFShootingMode as CGImage.PropertyName
    static let ciffLensModel = kCGImagePropertyCIFFLensModel as CGImage.PropertyName
    static let ciffLensMaxMM = kCGImagePropertyCIFFLensMaxMM as CGImage.PropertyName
    static let ciffLensMinMM = kCGImagePropertyCIFFLensMinMM as CGImage.PropertyName
    static let ciffWhiteBalanceIndex = kCGImagePropertyCIFFWhiteBalanceIndex as CGImage.PropertyName
    static let ciffFlashExposureComp = kCGImagePropertyCIFFFlashExposureComp as CGImage.PropertyName
    static let ciffMeasuredEV = kCGImagePropertyCIFFMeasuredEV as CGImage.PropertyName
}

/// For kCGImagePropertyMakerNikonDictionary
public extension CGImage.PropertyName {
    static let makerNikonISOSetting = kCGImagePropertyMakerNikonISOSetting as CGImage.PropertyName
    static let makerNikonColorMode = kCGImagePropertyMakerNikonColorMode as CGImage.PropertyName
    static let makerNikonQuality = kCGImagePropertyMakerNikonQuality as CGImage.PropertyName
    static let makerNikonWhiteBalanceMode = kCGImagePropertyMakerNikonWhiteBalanceMode as CGImage.PropertyName
    static let makerNikonSharpenMode = kCGImagePropertyMakerNikonSharpenMode as CGImage.PropertyName
    static let makerNikonFocusMode = kCGImagePropertyMakerNikonFocusMode as CGImage.PropertyName
    static let makerNikonFlashSetting = kCGImagePropertyMakerNikonFlashSetting as CGImage.PropertyName
    static let makerNikonISOSelection = kCGImagePropertyMakerNikonISOSelection as CGImage.PropertyName
    static let makerNikonFlashExposureComp = kCGImagePropertyMakerNikonFlashExposureComp as CGImage.PropertyName
    static let makerNikonImageAdjustment = kCGImagePropertyMakerNikonImageAdjustment as CGImage.PropertyName
    static let makerNikonLensAdapter = kCGImagePropertyMakerNikonLensAdapter as CGImage.PropertyName
    static let makerNikonLensType = kCGImagePropertyMakerNikonLensType as CGImage.PropertyName
    static let makerNikonLensInfo = kCGImagePropertyMakerNikonLensInfo as CGImage.PropertyName
    static let makerNikonFocusDistance = kCGImagePropertyMakerNikonFocusDistance as CGImage.PropertyName
    static let makerNikonDigitalZoom = kCGImagePropertyMakerNikonDigitalZoom as CGImage.PropertyName
    static let makerNikonShootingMode = kCGImagePropertyMakerNikonShootingMode as CGImage.PropertyName
    static let makerNikonCameraSerialNumber = kCGImagePropertyMakerNikonCameraSerialNumber as CGImage.PropertyName
    static let makerNikonShutterCount = kCGImagePropertyMakerNikonShutterCount as CGImage.PropertyName
}

/// For kCGImagePropertyMakerCanonDictionary
public extension CGImage.PropertyName {
    static let makerCanonOwnerName = kCGImagePropertyMakerCanonOwnerName as CGImage.PropertyName
    static let makerCanonCameraSerialNumber = kCGImagePropertyMakerCanonCameraSerialNumber as CGImage.PropertyName
    static let makerCanonImageSerialNumber = kCGImagePropertyMakerCanonImageSerialNumber as CGImage.PropertyName
    static let makerCanonFlashExposureComp = kCGImagePropertyMakerCanonFlashExposureComp as CGImage.PropertyName
    static let makerCanonContinuousDrive = kCGImagePropertyMakerCanonContinuousDrive as CGImage.PropertyName
    static let makerCanonLensModel = kCGImagePropertyMakerCanonLensModel as CGImage.PropertyName
    static let makerCanonFirmware = kCGImagePropertyMakerCanonFirmware as CGImage.PropertyName
    static let makerCanonAspectRatioInfo = kCGImagePropertyMakerCanonAspectRatioInfo as CGImage.PropertyName
}

/// For kCGImagePropertyOpenEXRDictionary
public extension CGImage.PropertyName {
    static let openEXRAspectRatio = kCGImagePropertyOpenEXRAspectRatio as CGImage.PropertyName
}

#endif
