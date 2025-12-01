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
        .package(url: "https://github.com/swift-standards/swift-svg-standard", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-svg-rendering", from: "0.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.3"),
    ],
    targets: [
        .target(
            name: "SVG",
            dependencies: [
                .product(name: "SVG Standard", package: "swift-svg-standard"),
                .product(name: "SVG Rendering", package: "swift-svg-rendering"),
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
for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
    ]
}
