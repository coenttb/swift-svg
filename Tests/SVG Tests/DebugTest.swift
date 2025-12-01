//
//  DebugTest.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import Foundation
import SVG
import SVG_Rendering
import SVG_Standard
import Testing

@Suite("Debug")
struct DebugTest {
    @Test func simpleCircleRenders() {
        let svgElement = circle(cx: 50, cy: 50, r: 40)

        let rendered = svgElement.render()
        print("Rendered: '\(rendered)'")
        #expect(!rendered.isEmpty)
        #expect(rendered.contains("<circle"))
    }

    @Test func circleWithAttributesRenders() {
        let circleElement = circle(cx: 50, cy: 50, r: 40)
            .fill("red")
            .stroke("black")
            .strokeWidth(2)

        let rendered = circleElement.render()
        print("Circle rendered: '\(rendered)'")
        #expect(!rendered.isEmpty)
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("fill=\"red\""))
        #expect(rendered.contains("stroke=\"black\""))
    }

    @Test("Check SVG rendering for consistency")
    func svgRenderingConsistency() {
        let svgElement = svg(width: 100, height: 100) {
            circle(cx: 50, cy: 50, r: 40)
                .fill("red")
                .stroke("black")
                .strokeWidth(2)
        }

        let output = svgElement.render(.pretty)
        print("Output: [\(output)]")
        print("Length: \(output.count)")

        // Check the expected structure
        #expect(output.contains("<svg"))
        #expect(output.contains("width=\"100\""))
        #expect(output.contains("height=\"100\""))
        #expect(output.contains("<circle"))
        #expect(output.contains("fill=\"red\""))
        #expect(output.contains("stroke=\"black\""))
        #expect(output.contains("stroke-width=\"2\""))
        #expect(output.contains("</svg>"))
    }
}
