// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftCF",
    products: [
        .library(
            name: "SwiftCF",
            targets: ["SwiftCF"]),
    ],
    targets: [
        .target(
            name: "SwiftCF"),
        .testTarget(
            name: "SwiftCFTests",
            dependencies: ["SwiftCF"]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
