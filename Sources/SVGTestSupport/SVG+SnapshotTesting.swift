//
//  SVG+SnapshotTesting.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SnapshotTesting

extension Snapshotting where Value: SVG, Format == String {
    /// A snapshot strategy for comparing SVG values as pretty-printed strings
    public static var svg: Self {
        .svg()
    }

    /// A snapshot strategy for comparing SVG values with custom configuration
    /// - Parameter configuration: The printer configuration to use
    public static func svg(
        configuration: SVGPrinter.Configuration = .pretty
    ) -> Self {
        Snapshotting<String, String>.lines.pullback { value in
            value.render(configuration)
        }
    }
}

extension Snapshotting where Value == Document, Format == String {
    /// A snapshot strategy for comparing SVG documents as pretty-printed strings
    public static var svgDocument: Self {
        .svgDocument()
    }

    /// A snapshot strategy for comparing SVG documents with custom configuration
    /// - Parameter configuration: The printer configuration to use
    public static func svgDocument(
        configuration: SVGPrinter.Configuration = .pretty
    ) -> Self {
        Snapshotting<String, String>.lines.pullback { value in
            value.render(configuration)
        }
    }
}

// Helper extension to make snapshot testing easier
extension Document {
    /// Creates a complete SVG document for snapshot testing
    public static func test(
        width: Int? = nil,
        height: Int? = nil,
        viewBox: SVG_Standard.Types.ViewBox? = nil,
        includeXMLDeclaration: Bool = false,
        @SVGBuilder content: () -> some SVG
    ) -> Document {
        Document(includeXMLDeclaration: includeXMLDeclaration) {
            svg(
                width: width.map { SVG_Standard.Types.Length.number(Double($0)) },
                height: height.map { SVG_Standard.Types.Length.number(Double($0)) },
                viewBox: viewBox
            ) {
                content()
            }
        }
    }
}
