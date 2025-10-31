//
//  DebugAttributeTest.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVGTypes
import Testing

@Suite("Debug Attributes")
struct DebugAttributeTest {
  @Test func attributesRender() {
    let svgElement = circle(cx: 50, cy: 50, r: 40) {
      fill("red")
      stroke("black", width: 3)
    }

    let rendered = svgElement.render()
    print("With attributes: '\(rendered)'")
    #expect(rendered.contains("fill"))
    #expect(rendered.contains("stroke"))
  }
}
