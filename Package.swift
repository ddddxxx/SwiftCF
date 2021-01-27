// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftCF",
    products: [
        .library(
            name: "SwiftCF",
            targets: ["SwiftCF", "CoreGraphicsExt", "CoreTextExt", "IOKitExt", "ImageIOExt", "AccessibilityExt"]),
    ],
    targets: [
        .target(name: "SwiftCF"),
        .target(name: "CoreGraphicsExt", dependencies: ["SwiftCF"]),
        .target(name: "CoreTextExt", dependencies: ["SwiftCF"]),
        .target(name: "IOKitExt", dependencies: ["SwiftCF"]),
        .target(name: "ImageIOExt", dependencies: ["SwiftCF"]),
        .target(name: "AccessibilityExt", dependencies: ["SwiftCF"]),
        .testTarget(name: "SwiftCFTests", dependencies: ["SwiftCF"]),
    ]
)
