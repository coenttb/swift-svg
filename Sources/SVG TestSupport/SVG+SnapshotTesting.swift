//
//  SVG+SnapshotTesting.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

public import SVG
public import SnapshotTesting

extension Snapshotting where Value: SVG.View, Format == String {
    /// A snapshot strategy for comparing SVG values as pretty-printed strings
    public static var svg: Self {
        .svg()
    }

    /// A snapshot strategy for comparing SVG values with custom configuration
    /// - Parameter configuration: The context configuration to use
    public static func svg(
        configuration: SVG.Context.Configuration = .pretty
    ) -> Self {
        Snapshotting<String, String>.lines.pullback { value in
            var context = SVG.Context(configuration)
            var buffer: [UInt8] = []
            Value._render(value, into: &buffer, context: &context)
            return String(decoding: buffer, as: UTF8.self)
        }
    }
}

/// Creates a complete SVG element for snapshot testing
public func testSVG<C: SVG.View>(
    width: Double? = nil,
    height: Double? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> C
) -> some SVG.View {
    svg(
        width: width,
        height: height,
        viewBox: viewBox,
        content: content
    )
}
