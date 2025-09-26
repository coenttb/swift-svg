// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-svg",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
    ],
    products: [
        .library(
            name: "SVG",
            targets: ["SVG"]
        ),
        .library(
            name: "SVGTestSupport",
            targets: ["SVGTestSupport"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-svg-types", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-svg-printer", from: "0.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
    ],
    targets: [
        .target(
            name: "SVG",
            dependencies: [
                .product(name: "SVGTypes", package: "swift-svg-types"),
                .product(name: "SVGPrinter", package: "swift-svg-printer"),
            ]
        ),
        .target(
            name: "SVGTestSupport",
            dependencies: [
                "SVG",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
        .testTarget(
            name: "SVGTests",
            dependencies: [
                "SVG",
                "SVGTestSupport",
            ]
        ),
    ]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
//    .unsafeFlags(["-warnings-as-errors"]),
    // .unsafeFlags([
    //   "-Xfrontend",
    //   "-warn-long-function-bodies=50",
    //   "-Xfrontend",
    //   "-warn-long-expression-type-checking=50",
    // ])
]

for index in package.targets.indices {
    package.targets[index].swiftSettings = (package.targets[index].swiftSettings ?? []) + swiftSettings
}
