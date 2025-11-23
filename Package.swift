// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-svg",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
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
        .package(path: "../../swift-standards/swift-svg-standard"),
        .package(path: "../swift-svg-printer"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
    ],
    targets: [
        .target(
            name: "SVG",
            dependencies: [
                .product(name: "SVG Standard", package: "swift-svg-standard"),
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
