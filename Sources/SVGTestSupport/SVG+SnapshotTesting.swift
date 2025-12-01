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
        configuration: SVGContext.Configuration = .pretty
    ) -> Self {
        Snapshotting<String, String>.lines.pullback { value in
            var context = SVGContext(configuration)
            var buffer: [UInt8] = []
            Value._render(value, into: &buffer, context: &context)
            return String(decoding: buffer, as: UTF8.self)
        }
    }
}

/// Creates a complete SVG element for snapshot testing
public func testSVG<C: SVG.View>(
    width: Int? = nil,
    height: Int? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> C
) -> SVG.Element<SVG_Standard.Document.SVG, C> {
    svg(
        width: width.map { SVG_Standard.Types.Length.number(Double($0)) },
        height: height.map { SVG_Standard.Types.Length.number(Double($0)) },
        viewBox: viewBox,
        content: content
    )
}
